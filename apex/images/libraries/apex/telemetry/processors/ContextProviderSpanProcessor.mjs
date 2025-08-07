/* eslint no-unused-vars: [ "error", { "argsIgnorePattern": "^_" } ] */
import { hrTimeToMilliseconds } from '@apexthirdparty/opentelemetry-core';

const MAX_DELAY = 1000; // max delay between spans, in ms, to allow for relaxed matching

/**
 * Span processor {@link SpanProcessor} that checks if a child span
 * is missing a parent span reference. If so, a best effort attempt
 * is made to find a valid parent and update the span.
 *
 * Accepts another span processor (e.g. OpenTelemetry's
 * BatchSpanProcessor, SimpleSpanPocessor, MultiSpanProcessor),
 * which would then accept the exporter.
 *
 * Span format mappings:
 *   OpenTelemetry     | Redwood Telemetry | Root or child
 *   ---               | ---               | ---
 *   documentLoad  [1] | navigation (hard) | root
 *   documentFetch [1] | n/a               | child (parent already set by instrumentation)
 *   resourceFetch [1] | resource          | child (parent already set by instrumentation)
 *   HTTP GET [2]      | fetch             | child
 *   GET [3]           | fetch             | child
 *   click [4]         | componentEvent    | root
 *
 * Source instrumentations:
 *   1] @opentelemetry/instrumentation-document-load
 *   2] @opentelemetry/instrumentation-fetch
 *   3] @opentelemetry/instrumentation-xml-http-request
 *   4] @opentelemetry/instrumentation-user-interaction /
 *      @apex/instrumentation-user-interaction
 */
export class ContextProviderSpanProcessor {
  constructor( config ) {
    const { spanProcessor } = config;
    this._spanProcessor = spanProcessor;

    // map of instrumentation names to start/end handlers
    this._instrumentationMap = new Map( [
      [ '@opentelemetry/instrumentation-document-load', { onStart: this._onStartDocumentLoad } ],
      [ '@opentelemetry/instrumentation-fetch', { onStart: this._onStartOrEndFetchXHR, onEnd: this._onStartOrEndFetchXHR } ],
      [ '@opentelemetry/instrumentation-xml-http-request', { onStart: this._onStartOrEndFetchXHR, onEnd: this._onStartOrEndFetchXHR } ],
      [ '@opentelemetry/instrumentation-user-interaction', { onEnd: this._onStartUserInteraction } ],
      [ '@apex/instrumentation-user-interaction', { onStart: this._onStartUserInteraction } ],
    ] );

    this._lastNavigationSpan = null;
    this._lastUserInteractionSpan = null;
  }

  /**
   * Checks if the provided spans are a valid parent-child match.
   *
   * @param {Span} span
   * @param {Span} parentSpan
   */
  _isValidParentSpan( span, parentSpan ) {
    let isValid = false;
    if ( parentSpan ) {
      const parentStart = hrTimeToMilliseconds( parentSpan.startTime );
      const spanStart = hrTimeToMilliseconds( span.startTime );
      if ( parentStart <= spanStart ) {
        const parentEnd = hrTimeToMilliseconds( parentSpan.endTime );
        if ( parentEnd === 0 || spanStart <= parentEnd ) {
          isValid = true;
        }
      }
    }
    return isValid;
  }

  /**
   * Finds a valid parent span for the provided span reference.
   *
   * @param {Span} span
   */
  _findParentSpan( span ) {
    // there will be more user interactions than navigations, so start with those
    let parentSpan = this._lastUserInteractionSpan;
    if ( !this._isValidParentSpan( span, parentSpan ) ) {
      parentSpan = this._lastNavigationSpan;
      if ( !this._isValidParentSpan( span, parentSpan ) ) {
        parentSpan = undefined;
        // fallback to find the nearest root span that occurred within the MAX_DELAY
        //   this was written quick and is a bit ugly -- clean up as time permits
        const spanStart = hrTimeToMilliseconds( span.startTime );
        const userInteractionStart = this._lastUserInteractionSpan ? hrTimeToMilliseconds( this._lastUserInteractionSpan.startTime ) : 0;
        const navigationStart = this._lastNavigationSpan ? hrTimeToMilliseconds( this._lastNavigationSpan.startTime ) : 0;

        const userInteractionValid = userInteractionStart !== 0 && userInteractionStart <= spanStart;
        const navigationValid = navigationStart !== 0 && navigationStart <= spanStart;
        if ( userInteractionValid && navigationValid ) {
          const userInteractionOffset = spanStart - userInteractionStart;
          const navigationOffset = spanStart - navigationStart;
          if ( userInteractionOffset <= navigationOffset && userInteractionOffset <= MAX_DELAY ) {
            parentSpan = this._lastUserInteractionSpan;
          } else if ( navigationOffset <= MAX_DELAY ) {
            parentSpan = this._lastNavigationSpan;
          }
        } else if ( userInteractionValid && ( spanStart - userInteractionStart ) <= MAX_DELAY ) {
          parentSpan = this._lastUserInteractionSpan;
        } else if ( navigationValid && ( spanStart - navigationStart ) <= MAX_DELAY ) {
          parentSpan = this._lastNavigationSpan;
        }
      }
    }
    return parentSpan;
  }

  /**
   * Updates a span with the provided parent span reference.
   *
   * @param {Span} span
   * @param {Span} parentSpan
   */
  _setParentSpan( span, parentSpan ) {
    const { spanId: parentSpanId, traceId: parentTraceId } = parentSpan.spanContext();
    span.parentSpanId = parentSpanId;
    span._spanContext.traceId = parentTraceId;
  }

  /**
   * onStart handler for events instrumented by the document load plugin.
   *
   * @param {Span} span
   * @param {Context} context
   */
  _onStartDocumentLoad( span, _context ) {
    const { name } = span;
    if ( name === 'documentLoad' ) {
      this._lastNavigationSpan = span;
    }
  }

  /**
   * onStart handler for events instrumented by the user interaction plugin.
   *
   * @param {Span} span
   * @param {Context} context
   */
  _onStartUserInteraction( span, _context ) {
    this._lastUserInteractionSpan = span;
  }

  /**
   * onStart handler for events instrumented by the fetch and XHR plugins.
   *
   * @param {Span} span
   * @param {Context} context
   */
  _onStartOrEndFetchXHR( span, _context ) {
    if ( !span.parentSpanId ) {
      const parentSpan = this._findParentSpan( span );
      if ( parentSpan ) {
        this._setParentSpan( span, parentSpan );
      }
    }
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
        instrumentationEntry.onStart?.call( this, span, context );
      }
    }
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
    // perform any instrumentation-specific event handling
    const { instrumentationLibrary } = span;
    if ( instrumentationLibrary ) {
      const { name: instrumentationName } = instrumentationLibrary;
      const instrumentationEntry = this._instrumentationMap.get( instrumentationName );
      if ( instrumentationEntry ) {
        instrumentationEntry.onEnd?.call( this, span );
      }
    }
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
