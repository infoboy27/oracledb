import { AnchoredClock, ExportResultCode } from '@apexthirdparty/opentelemetry-core';
import { Deflate } from '@apexthirdparty/pako';
import { toClsLogs } from './transform.mjs';
import { onIdle } from './idle.mjs';
/**
 * Exports zipped payloads containing spans in CLS Log format, which is
 * supported by the Client Logging Service
 */
export class ClsExporter {
  /**
     * Constructor
     * @param options
     */
  constructor( options ) {
    /**
     * CLS endpoint
     */
    this.endpoint = options.endpoint;
    /**
     * Whether to compress payloads
     */
    this.compress = options.compress ?? true;
    /**
     * Time in milliseconds to attempt to export
     */
    this.exportTimeout = options.exportTimeout ?? 30000;
    /**
     * Gets the export headers for CLS (X-ORCL-CLS-APP-INFO, X-ORCL-CLS-CLIENT-INFO)
     */
    this.getExportHeaders = options.getExportHeaders ?? ( () => {} );
    /**
     * Number of retries
     */
    this.retries = options.retries ?? 3;
    /**
     * Time to next retry, in milliseconds
     *   5000 is the otel default, but we use 15000 here as it aligns to the Redwood Telemetry default
     */
    this.retryInterval = options.retryInterval ?? 15000;
    /**
     * Promises for send task, kept around for flushing
     */
    this.sendPromises = [];
    /**
     * Clock for calculating times in Retry-After header
     */
    this.clock = new AnchoredClock( Date, window.performance );
    /**
     * List of retryable response codes
     */
    this.retryableMap = {
      429: 1,
      501: 1,
      503: 1,
    };
  }
  /**
     * Import the spans to CLS Log format
     * @param spans
     * @param resultCallback
     */
  export( spans, resultCallback ) {
    const logs = [];
    // Generate the span logs
    spans.forEach( span => logs.push( ...toClsLogs( span ) ) );
    // Sort by timestamp (so that start and end messages end up
    // around their children)
    logs.sort( ( a, b ) => a.ts - b.ts );
    if ( this.compress ) {
      // Schedule for zipping
      const deflate = new Deflate( { gzip: true } );
      // Stringify the payload
      deflate.push( '{"spans":[' );
      // Zip the payload in idle time
      const processPayload = ( deadline ) => {
        // Write chunks while there's time left
        while ( logs.length > 0 && deadline.timeRemaining() > 0 ) {
          // Write the log
          deflate.push( JSON.stringify( logs.shift() ) );
          if ( logs.length > 0 ) {
            // Write the array delimiter
            deflate.push( ',' );
          } else {
            // End the array
            deflate.push( ']}', true );
            if ( deflate.err ) {
              resultCallback( {
                code: ExportResultCode.FAILED,
                error: new Error( `Error compressing payload: ${ deflate.err }` ),
              } );
            } else {
              // Get the data
              const data = deflate.result;
              onIdle( () => {
                this.sendData( data, true, resultCallback );
              } );
            }
            return;
          }
        }
        if ( logs.length > 0 ) {
          onIdle( processPayload );
        }
      };
      // Process payload in idle time
      onIdle( processPayload, { timeout: this.exportTimeout } );
    } else {
      const payload = {
        spans: logs,
      };
      // Send a plain JSON payload
      const data = JSON.stringify( payload );
      onIdle( () => {
        this.sendData( data, false, resultCallback );
      } );
    }
  }
  /**
     * Send data to the remote endpoint
     * @param data Data to send
     * @param resultCallback Callback for results
     */
  sendData( data, compressed, resultCallback ) {
    const sendPromise = new Promise( ( resolve, reject ) => {
      // Compile the headers
      const headers = {
        ...( this.getExportHeaders() ),
        'content-type': 'application/json',
        ...( compressed ? { 'content-encoding': 'gzip' } : {} ),
      };
      // Make the call
      // TODO: support Node?
      fetch( this.endpoint, {
        headers,
        method: 'POST',
        body: data,
        mode: 'cors',
        credentials: 'same-origin',
        keepalive: true, // PATCHED
      } ).then( response => {
        // CLS only returns 204
        if ( response.ok ) {
          resolve();
        } else {
          reject( response );
        }
      } ).catch( reason => {
        // Failure due to CORS/network
        reject( reason );
      } );
    } );
    // Add to the flush queue
    this.sendPromises.push( sendPromise );
    // Start retry counter
    var retryCount = this.retries;
    const popPromise = () => {
      const index = this.sendPromises.indexOf( sendPromise );
      this.sendPromises.splice( index, 1 );
    };
    const success = () => {
      popPromise();
      resultCallback( { code: ExportResultCode.SUCCESS } );
    };
    const retry = ( reason ) => {
      // If we can retry, do so
      if ( this.isRetryable( reason ) && retryCount > 0 ) {
        retryCount = retryCount - 1;
        // Determine retry interval
        let retryInterval = this.parseRetryHeader( reason ) || this.retryInterval;
        // Send again after some interval
        // TODO exponential backoff
        setTimeout( () => {
          // Recurse till we get it right
          sendPromise.then( success ).catch( retry );
        }, retryInterval );
      } else {
        // Nothing we can do, pop it
        popPromise();
        // Return failure
        resultCallback( {
          code: ExportResultCode.FAILED,
          error: reason,
        } );
      }
    };
    // Send the payload
    sendPromise.then( success ).catch( retry );
  }
  /**
      * Calculate the retry interval based on response headers, if any
      * @param response
      */
  parseRetryHeader( response ) {
    // If we got a Retry-After response header (usually
    // with a status 429 or 503), use the value as the
    // retry interval
    const retryAfter = response.headers.get( 'Retry-After' );
    let interval = null;
    if ( retryAfter ) {
      try {
        // If numeric, convert to ms
        interval = Number.parseInt( retryAfter, 10 ) * 1000;
      } catch ( err ) {
        // If a date, get the number of ms till that date
        try {
          let date = Date.parse( retryAfter );
          interval = date - this.clock.now();
        } catch ( err2 ) {
          // Date format error
          interval = null;
        }
      }
    }
    return interval;
  }
  /**
     * Indicates whether an error/status from a send can be retried
     * @param reason
     * @returns
     */
  isRetryable( reason ) {
    if ( reason.status ) {
      return this.retryableMap[ reason.status ] !== undefined;
    }
    // TODO attempt to retry on network errors
    return false;
  }
  shutdown() {
    return Promise.resolve();
  }
  /**
     * Flush any pending requests
     * @returns
     */
  forceFlush() {
    // Flush any pending sends
    return Promise.all( this.sendPromises ).then( ( /* results */ ) => {
      // Do nothing with output at this point
    } );
  }
}
