import { AnchoredClock } from '@apexthirdparty/opentelemetry-core';
/**
 * Cache flag for idle-time support to avoid any polyfills overriding
 * behavior later
 */
const idleSupported = () => window.requestIdleCallback !== undefined;
// Setup a clock
const clock = new AnchoredClock( Date, window.performance || Date );
/**
 * Schedules an idle callback with an optional timeout.  If Idle requests are not
 * supported in this browser (ie. Safari) the call will be emulated by a macrotask
 * @param handler
 * @param options
 * @returns Handle to idle callback, can be used to cancel
 * @see https://developer.mozilla.org/en-US/docs/Web/API/Background_Tasks_API
 */
export function onIdle( handler, options ) {
  if ( idleSupported() ) {
    return window.requestIdleCallback( handler, options );
  } else {
    // Emulate idle callback
    let startTime = clock.now();
    return window.setTimeout( () => {
      handler( {
        didTimeout: false,
        timeRemaining: function () {
          return Math.max( 0, 50.0 - ( clock.now() - startTime ) );
        },
      } );
    }, 1 );
  }
}
/**
 * Cancels the idle callback identified by the specified handle
 * @param handle
 */
export function cancelIdle( handle ) {
  if ( idleSupported() ) {
    return window.cancelIdleCallback( handle );
  } else {
    return window.clearTimeout( handle );
  }
}
