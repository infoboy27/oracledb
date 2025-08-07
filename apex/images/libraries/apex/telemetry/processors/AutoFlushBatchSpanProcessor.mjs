/* eslint no-void: [ "error", { "allowAsStatement": true } ] */
import { BatchSpanProcessorBase } from '@apexthirdparty/opentelemetry-sdk-trace-base/build/src/export/BatchSpanProcessorBase';

/**
 * Span processor {@link SpanProcessor} that auto-flushes on the following browser events:
 *  - `visibilitychange` to `hidden` -- covers most scenarios for changing or closing a tab, and internal navigations
 *  - `pagehide` -- as a fallback for Safari
 *  - `beforeunload` -- covers corner-cases for external navigations
 *
 * This class extends {@link BatchSpanProcessorBase} and duplicates functionality of
 * {@link BatchSpanProcessor}, to avoid an issue where event listeners were
 * attached and executed multiple times.
 */
export class AutoFlushBatchSpanProcessor extends BatchSpanProcessorBase {
  constructor( exporter, config ) {
    super( exporter, config );
    this.onInit();
  }

  /**
   * Initialize the span processor by setting up the event listeners.
   *
   * This may call `forceFlush()` multiple times if multiple listeners are triggered
   * for a given event. This appears to be fine -- the first call "wins" and subsequent
   * calls do nothing. It may be possible to use another feature like `bindOnceFuture`
   * to debounce calls, but some internal state may be needed to reset the bound
   * functions on refocus, which could be unreliable and introduce inconsistencies.
   */
  onInit() {
    if ( typeof document !== 'undefined' ) {
      this._visibilityChangeListener = () => {
        if ( document.visibilityState === 'hidden' ) {
          void this.forceFlush();
        }
      };
      this._pageHideListener = () => {
        void this.forceFlush();
      };
      document.addEventListener( 'visibilitychange', this._visibilityChangeListener );
      document.addEventListener( 'pagehide', this._pageHideListener );
    }
    if ( typeof window !== 'undefined' ) {
      this._beforeUnloadListener = () => {
        void this.forceFlush();
      };
      window.addEventListener( 'beforeunload', this._beforeUnloadListener );
    }
  }

  /**
   * Callback executed on tracer `shutdown`.
   *
   * Used to cleanup event listeners.
   */
  onShutdown() {
    if ( typeof document !== 'undefined' ) {
      if ( this._visibilityChangeListener ) {
        document.removeEventListener( 'visibilitychange', this._visibilityChangeListener );
      }
      if ( this._pageHideListener ) {
        document.removeEventListener( 'pagehide', this._pageHideListener );
      }
    }
    if ( typeof window !== 'undefined' ) {
      if ( this._beforeUnloadListener ) {
        window.removeEventListener( 'beforeunload', this._beforeUnloadListener );
      }
    }
  }
}
