/* eslint no-unused-vars: [ "error", { "argsIgnorePattern": "^_" } ] */
import { trace } from '@apexthirdparty/opentelemetry-api';
import { EventNames } from '@apexthirdparty/opentelemetry-instrumentation-xml-http-request/build/esnext/enums/EventNames';

const DOCUMENT_FETCH_SPAN_KEY = Symbol.for( 'documentFetchSpan' );
const PERFORMANCE_NAVIGATION_TIMING_KEY = Symbol.for( 'PerformanceNavigationTiming' );
export const PERFORMANCE_RESOURCE_TIMING_KEY = Symbol.for( 'PerformanceResourceTiming' );
export const REQUEST_KEY = Symbol.for( 'request' );
export const RESPONSE_OR_ERROR_KEY = Symbol.for( 'responseOrError' );
export const XHR_KEY = Symbol.for( 'xhr' );

/**
 * Span processor {@link SpanProcessor} that maps the OpenTelemetry span format
 * to the Redwood Telemetry schema.
 *
 * Accepts another span processor (e.g. OpenTelemetry's
 * BatchSpanProcessor, SimpleSpanPocessor, MultiSpanProcessor),
 * which would then accept the exporter.
 *
 * Can be removed once the CLS and downstream supports
 * directly ingesting the OpenTelemetry Format.
 *
 * Span format mappings:
 *   OpenTelemetry     | Redwood Telemetry
 *   ---               | ---
 *   documentLoad  [1] | navigation (hard)
 *   documentFetch [1] | n/a
 *   resourceFetch [1] | resource
 *   HTTP GET [2]      | fetch
 *   GET [3]           | fetch
 *   click [4]         | componentEvent
 *
 * Source instrumentations:
 *   1] @opentelemetry/instrumentation-document-load
 *   2] @opentelemetry/instrumentation-fetch
 *   3] @opentelemetry/instrumentation-xml-http-request
 *   4] @opentelemetry/instrumentation-user-interaction /
 *      @apex/instrumentation-user-interaction
 */
export class RedwoodSpanProcessor {
  constructor( config ) {
    const { spanProcessor, applyCustomAttributesOnSpan } = config;
    this._spanProcessor = spanProcessor;
    this._applyCustomAttributesOnSpan = applyCustomAttributesOnSpan;

    // map of instrumentation names to a span filter list and start/end handlers;
    //   this could be rewriten as a factory for cleanliness
    this._instrumentationMap = new Map( [
      [ '@opentelemetry/instrumentation-document-load', { filter: [ 'documentFetch' ], onStart: this._onStartDocumentLoad, onEnd: this._onEndDocumentLoad } ],
      [ '@opentelemetry/instrumentation-fetch', { filter: [], onEnd: this._onEndFetch } ],
      [ '@opentelemetry/instrumentation-xml-http-request', { filter: [], onEnd: this._onEndXHR } ],
      [ '@opentelemetry/instrumentation-user-interaction', { filter: [], onEnd: this._onEndUserInteraction } ],
      [ '@apex/instrumentation-user-interaction', { filter: [], onEnd: this._onEndUserInteraction } ],
    ] );
  }

  /**
   * Set performance resource timing attributes on the provided span attributes reference.
   * PerformanceNavigationTiming extends PerformanceResourceTiming, so both are supported.
   *
   * @param {SpanAttributes} attributes
   * @param {PerformanceResourceTiming} performanceEntry
   */
  _setPerformanceResourceTimingAttributes( attributes, performanceEntry ) {
    // attributes[ 'http.url' ] = performanceEntry.name; // should already be present
    attributes[ 'http.first_byte_time' ] = performanceEntry.responseStart;
    attributes[ 'http.response.decoded_size' ] = performanceEntry.decodedBodySize || undefined;
    attributes[ 'http.response.encoded_size' ] = performanceEntry.encodedBodySize || undefined;
    attributes[ 'http.response.size' ] = performanceEntry.transferSize || undefined;
  }

  /**
   * Set screen and viewport attributes on the provided span attributes reference.
   *
   * @param {SpanAttributes} attributes
   */
  _setScreenAndViewportAttributes( attributes ) {
    attributes[ 'screen.height' ] = window.screen.height;
    attributes[ 'screen.orientationType' ] = window.screen.orientation.type;
    attributes[ 'screen.width' ] = window.screen.width;
    attributes[ 'viewport.height' ] = window.top.visualViewport.height;
    attributes[ 'viewport.width' ] = window.top.visualViewport.width;
  }

  /**
   * Debugging method to sort an object's keys; used to read span attributes more easily
   *
   * @param {{}} object
   * @returns
   */
  _sortObjectByKeys( object ) {
    const entries = Object.entries( object );
    const sorted = entries.toSorted( ( a, b ) => a[ 0 ] === b[ 0 ] ? 0 : a[ 0 ] < b[ 0 ] ? -1 : 1 );
    const newObj = Object.fromEntries( sorted );
    return JSON.stringify( newObj, null, 2 );
  }

  /**
   * Truncates string values that exceed the maximum attribute length (1024)
   *
   * @param {String} value
   * @returns truncated string
   */
  _truncateStringValue( value ) {
    const MAX_ATTRIBUTE_LENGTH = 1024;
    return value.length > MAX_ATTRIBUTE_LENGTH ? value.substring( 0, MAX_ATTRIBUTE_LENGTH ) : value;
  }

  /**
   * onStart handler for events instrumented by the document load plugin.
   *
   * Used to add some additional properties for later processing in the onEnd handler.
   *
   * @param {Span} span
   * @param {Context} context
   */
  _onStartDocumentLoad( span, context ) {
    const { name } = span;
    if ( name === 'documentLoad' ) {
      const navigationTiming = window.performance.getEntriesByType( 'navigation' )?.[ 0 ];
      if ( navigationTiming ) {
        // add a reference to the performance nav timing entry
        Object.defineProperty( span, PERFORMANCE_NAVIGATION_TIMING_KEY, {
          value: navigationTiming,
          configurable: false,
          enumerable: false,
          writable: false,
        } );
      }
    } else if ( name === 'documentFetch' && context ) {
      // check if we have a reference to the parent `documentLoad` event
      const parentSpan = trace.getSpan( context );
      if ( parentSpan ) {
        // add a reference to the `documentFetch` span on the parent
        Object.defineProperty( parentSpan, DOCUMENT_FETCH_SPAN_KEY, {
          value: span,
          configurable: false,
          enumerable: false,
          writable: false,
        } );
      }
    } else if ( name === 'resourceFetch' ) {
      // do nothing, the performance resource timing entry was already added in the instrumentation's `resourceFetch` callback
    }
  }

  /**
   * onEnd handler for events instrumented by the document load plugin.
   *
   * @param {Span} span
   */
  _onEndDocumentLoad( span ) {
    const { name, attributes } = span;
    if ( name === 'documentLoad' ) {
      span.name = 'navigation';

      // populate `http.*` and `nav.*` attributes from the performance navigation timing entry
      const navigationTiming = span[ PERFORMANCE_NAVIGATION_TIMING_KEY ];
      if ( navigationTiming ) {
        this._setPerformanceResourceTimingAttributes( attributes, navigationTiming );
        attributes[ 'nav.domcomplete_time' ] = navigationTiming.domComplete;
      } else {
        // if the perf nav timing entries were not present, populate from the child `documentFetch` span
        const documentFetch = span[ DOCUMENT_FETCH_SPAN_KEY ];
        if ( documentFetch ) {
          // const responseStart = documentFetch.events.find( entry => entry.name === 'responseStart' )?.time;
          // attributes[ 'http.first_byte_time' ] = undefined; // TODO -- determine how to convert otel's HR time back to an offset
          attributes[ 'http.response.encoded_size' ] = documentFetch.attributes[ 'http.response_content_length' ] || undefined;
          attributes[ 'http.response.decoded_size' ] = documentFetch.attributes[ 'http.response_content_length_uncompressed' ] || attributes[ 'http.response.encoded_size' ];
          // attributes[ 'http.response.size' ] = undefined; // we don't have a way to access the `transferSize` here
        }

        // const domComplete = span.events.find( entry => entry.name === 'domComplete' )?.time;
        attributes[ 'nav.domcomplete_time' ] = undefined; // TODO -- determine how to convert otel's HR time back to an offset
      }

      attributes[ 'nav.char_set' ] = document.characterSet;
      attributes[ 'nav.compat_mode' ] = document.compatMode;
      attributes[ 'nav.content_type' ] = document.contentType;
      attributes[ 'nav.referrer' ] = document.referrer || undefined;
      // attributes[ 'nav.title' ] = '#deprecated'; // deprecated in latest RW Telemetry Schema
      this._setScreenAndViewportAttributes( attributes );
    } else if ( name === 'documentFetch' ) {
      // do nothing, `documentFetch` events will not be sent downstream
    } else if ( name === 'resourceFetch' ) {
      span.name = 'resource';

      // populate `http.*` and `nav.*` attributes from the performance resource timing entry
      const resourceTiming = span[ PERFORMANCE_RESOURCE_TIMING_KEY ];
      if ( resourceTiming ) {
        this._setPerformanceResourceTimingAttributes( attributes, resourceTiming );

        // suppress the default otel attributes
        delete attributes[ 'http.response_content_length' ];
        delete attributes[ 'http.response_content_length_uncompressed' ];
      }
    }
  }

  /**
   * onEnd handler for events instrumented by the fetch plugin.
   *
   * @param {Span} span
   */
  _onEndFetch( span ) {
    span.name = 'fetch';

    const { attributes } = span;

    const request = span[ REQUEST_KEY ];
    if ( request ) {
      const { body } = request;
      if ( body ) {
        // the request object exposed by the insturmentation doesn't contain all request properties;
        //   check the length of the body as a fallback if necessary
        let contentLength = request.headers?.[ 'Content-Length' ];
        if ( !contentLength ) {
          contentLength = body.byteLength ?? body.size ?? body.length;
        }
        attributes[ 'http.request.size' ] = contentLength || undefined;
      }
    }

    const responseOrError = span[ RESPONSE_OR_ERROR_KEY ];
    if ( responseOrError ) {
      if ( responseOrError instanceof Response ) {
        attributes.error = false;
        const contentType = responseOrError.headers?.get( 'Content-Type' ) || undefined;
        attributes[ 'http.response.content_type' ] = contentType;

        const url = span.attributes[ 'http.url' ];
        const resourceTiming = window.performance.getEntriesByType( 'resource' ).findLast( entry => entry.initiatorType === 'fetch' && entry.name === url );
        if ( resourceTiming ) {
          this._setPerformanceResourceTimingAttributes( attributes, resourceTiming );
        } else {
          // const responseStart = span.events.find( entry => entry.name === 'responseStart' )?.time;
          // attributes[ 'http.first_byte_time' ] = undefined; // TODO -- determine how to convert otel's HR time back to an offset
          attributes[ 'http.response.encoded_size' ] = attributes[ 'http.response_content_length' ] || undefined;
          attributes[ 'http.response.decoded_size' ] = attributes[ 'http.response_content_length_uncompressed' ] || attributes[ 'http.response.encoded_size' ];
          // attributes[ 'http.response.size' ] = undefined; // we don't have a way to access the `transferSize` here
        }
      } else {
        attributes.error = true;
        if ( responseOrError instanceof Error ) {
          attributes[ 'error.kind' ] = responseOrError.name || 'unknownError';
          attributes[ 'error.message' ] = responseOrError.message || undefined;

          const { stack } = responseOrError;
          if ( stack && typeof stack === 'string' ) {
            attributes[ 'error.stack' ] = this._truncateStringValue( stack );
          }

          // suppress the default otel attributes
          delete attributes[ 'http.status_code' ];
          delete attributes[ 'http.status_text' ];
        }
      }
    }

    // suppress the default otel attributes
    delete attributes[ 'http.host' ];
    delete attributes[ 'http.response_content_length' ];
    delete attributes[ 'http.response_content_length_uncompressed' ];
    delete attributes[ 'http.scheme' ];

    this._setScreenAndViewportAttributes( attributes );
  }

  /**
   * onEnd handler for events instrumented by the XHR plugin.
   *
   * @param {Span} span
   */
  _onEndXHR( span ) {
    span.name = 'fetch';

    const { attributes } = span;

    const xhr = span[ XHR_KEY ];
    if ( xhr ) {
      // handle successful requests;
      //   if the request finished and we got a status code, it's considered a success
      if ( xhr.readyState === XMLHttpRequest.DONE && xhr.status ) {
        attributes.error = false;

        const responseContentType = xhr.getResponseHeader( 'Content-Type' );
        attributes[ 'http.response.content_type' ] = responseContentType || undefined;

        const url = span.attributes[ 'http.url' ];
        const resourceTiming = window.performance.getEntriesByType( 'resource' ).findLast( entry => entry.initiatorType === 'xmlhttprequest' && entry.name === url );
        if ( resourceTiming ) {
          this._setPerformanceResourceTimingAttributes( attributes, resourceTiming );
        } else {
          // TODO -- fallback logic?
        }
      } else {
        attributes.error = true;

        let errorKind = undefined;
        let errorMessage = undefined;

        const lastEventName = span.events[ span.events.length - 1 ].name;
        if ( lastEventName === EventNames.EVENT_ABORT ) {
          errorKind = 'AbortError';
          errorMessage = 'Request was aborted.';
        } else if ( lastEventName === EventNames.EVENT_TIMEOUT ) {
          errorKind = 'TimeoutError';
          errorMessage = 'Request timed out.';
        } else { // implied: if ( lastEventName === EventNames.EVENT_ERROR ) {
          // we don't have visibility of what the specific error could be, so set a generic error
          errorKind = 'UnknownError';
          errorMessage = 'Request failed with an unknown error.';
        }

        attributes[ 'error.kind' ] = errorKind;
        attributes[ 'error.message' ] = errorMessage;
        // attributes [ 'error.stack' ] = undefined; // nothing to populate here

        // suppress the default otel attributes
        delete attributes[ 'http.status_code' ];
        delete attributes[ 'http.status_text' ];
      }
    }

    // suppress the default otel attributes
    delete attributes[ 'http.host' ];
    delete attributes[ 'http.response_content_length' ];
    delete attributes[ 'http.response_content_length_uncompressed' ];
    delete attributes[ 'http.scheme' ];

    this._setScreenAndViewportAttributes( attributes );
  }

  /**
   * onEnd handler for events instrumented by the user interaction plugin.
   *
   * @param {Span} span
   */
  _onEndUserInteraction( span ) {
    // most of the redwood attributes will have already been set by the @apex/instrumentation-user-interaction plugin,
    //   if the plugin is replaced with otel's equivalent then this will need updating
    const { attributes } = span;
    if ( !attributes[ 'container.event' ] ) {
      attributes[ 'container.event' ] = span.name;
    }
    span.name = 'componentEvent';
    this._setScreenAndViewportAttributes( attributes );
  }

  /**
   * Override for span processor method that executes on a forced tracer flush.
   *
   * @returns {Promise<void>}
   */
  forceFlush() {
    return this._spanProcessor.forceFlush();
  }

  /**
   * Override for span processor method that executes on span start.
   * Span is recording and can be updated with `setAttribute()`.
   *
   * @param {Span} span
   * @param {Context} context
   */
  onStart( span, context ) {
    // perform any instrumentation-specific event handling
    const { instrumentationLibrary } = span;
    if ( instrumentationLibrary ) {
      const { name: instrumentationName } = instrumentationLibrary;
      const instrumentationEntry = this._instrumentationMap.get( instrumentationName );
      if ( instrumentationEntry ) {
        // always call any onStart handler that was specified,
        //   we may need to perform some setup even if the specific event won't continue downstream
        instrumentationEntry.onStart?.call( this, span, context );

        // check if the event type should be filtered and not send to the downstream
        if ( instrumentationEntry.filter?.includes( span.name ) ) {
          return;
        }
      }
    }

    // decorate the span with any custom attributes that may have been specified
    this._applyCustomAttributesOnSpan?.( span ); // NOTE -- if this call moves to the `onEnd` handler, the consumer cannot use `span.setAttribute/s()`

    this._spanProcessor.onStart( span, context );
  }

  /**
   * Override for span processor method that executes on span end.
   * Span is no longer recording and must be updated with direct writes,
   * as `setAttribute()` becomes no-op.
   *
   * @param {ReadableSpan} span
   */
  onEnd( span ) {
    const { attributes } = span;

    // perform any instrumentation-specific event handling
    const { instrumentationLibrary } = span;
    if ( instrumentationLibrary ) {
      const { name: instrumentationName } = instrumentationLibrary;

      // set `component` to the full instrumentation name
      attributes.component = instrumentationName;

      const instrumentationEntry = this._instrumentationMap.get( instrumentationName );
      if ( instrumentationEntry ) {
        // check if the event type should be filtered and return early
        if ( instrumentationEntry.filter?.includes( span.name ) ) {
          return;
        }

        // call any instrumentation-specific onEnd handler
        instrumentationEntry.onEnd?.call( this, span );
      }
    }

    // TODO -- determine where to set `error`: false for navigation, componentEvent, and resource spans

    // filter `http.url` for credentials or search params to prevent accidentally collecting any PII
    const httpUrl = attributes[ 'http.url' ];
    if ( httpUrl ) {
      const cleanUrl = new URL( httpUrl );
      cleanUrl.username = '';
      cleanUrl.password = '';
      cleanUrl.search = '';
      attributes[ 'http.url' ] = cleanUrl.toString();
    }

    // suppress `http.user_agent`, it will be enriched by the CLS instead
    delete attributes[ 'http.user_agent' ];

    this._spanProcessor.onEnd( span );
  }

  /**
   * Override for span processor method that executes on tracer shutdown.
   *
   * @returns {Promise<void>}
   */
  shutdown() {
    return this._spanProcessor.shutdown();
  }
}
