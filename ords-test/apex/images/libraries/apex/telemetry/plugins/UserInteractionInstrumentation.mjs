import { InstrumentationBase } from '@apexthirdparty/opentelemetry-instrumentation';

/**
 * Replacement for @opentelemetry/instrumentation-user-interaction,
 * due to a bug that presents in APEX where a single click event will
 * generate multiple event spans.
 *
 * See https://github.com/open-telemetry/opentelemetry-js-contrib/issues/1368
 *
 * Note: This instrumentation plugin is not currently Zone-aware.
 * It uses queueMicrotask to approximate the end of an event's timing,
 * but will not be accurate in many cases (especially for async behavior).
 */
export class UserInteractionInstrumentation extends InstrumentationBase {
  constructor( config ) {
    super( '@apex/instrumentation-user-interaction', '15.1.0', config );
    this._boundEventHandler = undefined;
  }

  /**
   * Generate a selector for the given element. If the element
   * has an ID, that will be returned. Otherwise, it will
   * return the element's tag and concatenated class list.
   *
   * @param {HTMLElement} element
   * @returns {string} selector
   */
  _getSelectorForElement( element ) {
    let selector = element.id ? `#${ element.id }` : '';
    if ( !selector ) {
      const classes = element.classList.length ? `.${ Array.from( element.classList ).join( '.' ) }` : '';
      selector = `${ element.tagName.toLowerCase() }${ classes }`;
    }
    return selector;
  }

  /**
   * Generate a selector chain for the given element, where
   * the root is an element with an ID or the body.
   *
   * @param {HTMLElement} element
   * @returns {string} selector chain
   */
  _getSelectorChainForElement( element ) {
    const selectors = [];
    let current = element;
    while ( current ) {
      selectors.unshift( this._getSelectorForElement( current ) );
      if ( current.id || current === document.body ) {
        break;
      }
      current = current.parentElement;
    }
    return selectors.join( ' > ' );
  }

  /**
   * Get the Redwood trigger attributes for a given UI event.
   * This will return attributes in the Redwood format.
   * If desired, this could return in the OTel format instead, and
   * a span processor could do the transformation to Redwood.
   *
   * @param {UIEvent} event
   * @returns {object} trigger attributes
   */
  _getTriggerAttributesForEvent( event ) {
    const { target, type } = event;
    // find the nearest label; exclude the html tag (page title) to prevent reporting many components with the same label
    const label = target.closest( '[data-otel-label]:not(html)' )?.dataset?.otelLabel;
    return {
      'trigger.label': label,
      'trigger.tag_name': target.tagName.toLowerCase(),
      'trigger.target': this._getSelectorChainForElement( target ),
      'trigger.type': type,
    };
  }

  /**
   * Handle the given UI event;
   * - filter synthetic clicks
   * - generate the appropriate span attributes
   * - start the span
   * - queue the span close for later
   *
   * See
   * https://w3c.github.io/pointerevents/#pointerevent-interface
   * https://w3c.github.io/pointerevents/#event-attributes
   *
   * @param {UIEvent} event
   */
  _handleEvent( event ) {
    const { target } = event;
    if ( target && target instanceof HTMLElement ) {
      // filter synthetic events (e.g. refocus on an input field, after clicking a label)
      const { pointerId, pointerType } = event;
      if ( pointerId !== -1 && pointerType !== '' ) { // from W3C spec: `id = -1` and `type = ''` are reserved for non-pointer events
        const trigger = this._getTriggerAttributesForEvent( event );
        // create the span with redwood attributes; skip otel attributes for now (e.g., `event_type`, `http.url`, `target_element`, `target_xpath`)
        const span = this.tracer.startSpan( 'click', {
          attributes: {
            'container.event': 'click', // TODO -- more descriptive name?
            ...trigger,
          },
        } );
        /**
         * Temporary event handler that will be attached to the target of the original event and executed once.
         * Used to delay the closing the span, to attempt to capture better timing information for synchronous events.
         */
        const tempHandler = () => {
          queueMicrotask( () => {
            span.end();
          } );
        };
        target.addEventListener( 'click', tempHandler, { once: true, passive: true } );
      }
    }
  }

  /**
   * Enable the instrumentation plugin;
   * add the event listener if it doesn't already exist.
   */
  enable() {
    if ( !this._boundEventHandler ) {
      const boundEventHandler = this._handleEvent.bind( this );
      document.addEventListener( 'click', boundEventHandler, { capture: true, passive: true } );
      this._boundEventHandler = boundEventHandler;
    }
  }

  /**
   * Disable the instrumentation plugin;
   * clean up the event listener if it exists.
   */
  disable() {
    if ( this._boundEventHandler ) {
      document.removeEventListener( 'click', this._boundEventHandler, { capture: true } );
      this._boundEventHandler = undefined;
    }
  }
}
