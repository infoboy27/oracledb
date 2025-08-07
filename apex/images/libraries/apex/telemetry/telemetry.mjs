/* eslint no-unused-vars: [ "error", { "argsIgnorePattern": "^_" } ] */
/* eslint no-void: [ "error", { "allowAsStatement": true } ] */
import { StackContextManager, WebTracerProvider } from '@apexthirdparty/opentelemetry-sdk-trace-web';
import { ConsoleSpanExporter, SimpleSpanProcessor } from '@apexthirdparty/opentelemetry-sdk-trace-base';
import { DocumentLoadInstrumentation } from '@apexthirdparty/opentelemetry-instrumentation-document-load';
import { FetchInstrumentation } from '@apexthirdparty/opentelemetry-instrumentation-fetch';
import { MultiSpanProcessor } from '@apexthirdparty/opentelemetry-sdk-trace-base/build/esnext/MultiSpanProcessor';
import { registerInstrumentations } from '@apexthirdparty/opentelemetry-instrumentation';
import { XMLHttpRequestInstrumentation } from '@apexthirdparty/opentelemetry-instrumentation-xml-http-request';
import { AutoFlushBatchSpanProcessor } from './processors/AutoFlushBatchSpanProcessor.mjs';
import { ClsExporter } from './exporters/ClsExporter.mjs';
import { ContextProviderSpanProcessor } from './processors/ContextProviderSpanProcessor.mjs';
import { DebugFlags } from './utils/DebugFlags.mjs';
import { PERFORMANCE_RESOURCE_TIMING_KEY, REQUEST_KEY, RESPONSE_OR_ERROR_KEY, RedwoodSpanProcessor, XHR_KEY } from './processors/RedwoodSpanProcessor.mjs';
import { UserInteractionInstrumentation as APEXUserInteractionInstrumentation } from './plugins/UserInteractionInstrumentation.mjs';
import { TokenRelayHookHandler } from './handlers/TokenRelayHookHandler.mjs';

( async () => {
    /**
     * Retrieves and validates the CLS and token relay configuration.
     *
     * @returns { clsUrl, tokenRelayUrl } - An object of URL strings.
     */
    const getURLs = () => {
        let clsUrl = apex.telemetry.clsUrl;
        try {
            void new URL( clsUrl );
        } catch ( error ) {
            // TODO polish logging
            apex.debug.error( `CLS ${ clsUrl } is invalid or missing`, error );
            clsUrl = undefined;
        }

        let tokenRelayUrl = apex.telemetry.tokenRelayUrl;
        try {
            void new URL( tokenRelayUrl );
        } catch ( error ) {
            // TODO polish logging
            apex.debug.error( `Token ${ tokenRelayUrl } is invalid or missing`, error );
            tokenRelayUrl = undefined;
        }

        return { clsUrl, tokenRelayUrl };
    };
    const { clsUrl, tokenRelayUrl } = getURLs();

    // TODO check if debug mode was enabled -- if so, let it continue and don't include ClsExporter / TokenRelayHandler if URLs were invalid
    if ( clsUrl && tokenRelayUrl ) {
        /**
         * Computes the SHA-1 hash for a given string.
         * This function is not cryptographically secure and is intended for basic obfuscation.
         *
         * @param {string} str - The input string to be hashed.
         * @returns {number} - The resulting SHA-1 hash.
         */
        const hashValue = async ( str ) => {
            let result = undefined;
            try {
                const encoded = new TextEncoder().encode( str );
                const digest = await window.crypto.subtle.digest( 'SHA-1', encoded );
                const hash = Array.from( new Uint8Array( digest ) );
                result = hash.map( ( b ) => b.toString( 16 ).padStart( 2, '0' ) ).join( '' );
            } catch ( e ) { // eslint-disable-line no-unused-vars
            // do nothing
            }
            return result;
        };
        const userGUID = await hashValue( apex.env.APP_USER );

      /**
       * Sanitizes container info based on Redwood Telemetry schema expectations:
       *
       * - lower kebab case preferred
       * - whitespace is not allowed
       * - No PII, record IDs, or other data labels
       * - allowed - ASCII letters, numbers, -_.#%+=@!?
       * - not allowed - space, asterisk, colon, other symbols
       */
        const sanitizeContainerId = ( containerId ) => {
            let sanitizedId = undefined;
            if ( containerId ) {
                sanitizedId = containerId.toLowerCase(); // convert to lowercase before encoding, to preserve the case of encoded values
                // encode all characters except: A to Z a to z 0 to 9 - _ . ! ~ * ' ( )
                sanitizedId = encodeURIComponent( sanitizedId );
                // encode additional characters that are not permitted by the redwood schema [~*'()]
                sanitizedId = sanitizedId.replace( /[~*'()]/g, ( char ) => {
                    return `%${ char.charCodeAt( 0 ).toString( 16 ).toUpperCase() }`;
                } );
                // decode any characters that are permitted by the redwood schema and were previously encoded [#+=@?]
                sanitizedId = sanitizedId.replace( /%(23|2B|3D|3F|40)/g, ( _str, hex ) => {
                    return String.fromCharCode( parseInt( hex, 16 ) );
                } );
            }
            return sanitizedId;
        };

       /**
        * Constructs an object of base span attributes, to be used for span decoration in a span processor.
        */
        const getSpanAttributes = () => {
            const spanAttributes = {};

            // container
            const pageAlias = sanitizeContainerId( document.querySelector( 'meta[name="app-page-alias"]' )?.content );
            let parentPageAlias = undefined;
            if ( window !== window.parent ) {
                // if we need to support more than one level deep, we could traverse up to `window.top`
                parentPageAlias = sanitizeContainerId( window.parent.document.querySelector( 'meta[name="app-page-alias"]' )?.content );
            }
            // filter values by truthiness so we don't end up with empty path segments, e.g. '/page' when there is no parent
            const containerPath = [ parentPageAlias, pageAlias ].filter( ( entry ) => !!entry ).join( '/' ) || undefined;
            spanAttributes[ 'container.id' ] = pageAlias;
            spanAttributes[ 'container.parent_id' ] = parentPageAlias;
            spanAttributes[ 'container.path' ] = containerPath;
            spanAttributes[ 'container.type' ] = 'Page'; // Hardcoded

            // customer
            spanAttributes[ 'customer.id' ] = document.querySelector( 'meta[name="app-tenant-id"]' )?.content;

            // environment
            spanAttributes[ 'environment.id' ] = window.location.hostname;

            // platform
            spanAttributes[ 'platform.version' ] = apex.redwood?.version || apex.env.APEX_VERSION;

            // product
            const appAlias = document.querySelector( 'meta[name="app-alias"]' )?.content; // TODO should this be app name instead?
            spanAttributes[ 'product.name' ] = appAlias;
            spanAttributes[ 'product.family' ] = apex.telemetry.productFamily;
            spanAttributes[ 'product.version' ] = document.querySelector( 'meta[name="app-version"]' )?.content;

            // session
            const sessionIdSuffix = appAlias ? `_${ appAlias }` : '';
            spanAttributes.session_id = `${ apex.env.APP_SESSION }${ sessionIdSuffix }`;

            // user
            spanAttributes[ 'user.guid' ] = userGUID;

            return spanAttributes;
        };
        const spanAttributes = getSpanAttributes();

        /**
         * Decorates the provided span with the base span attributes, and any dynamic span attributes where applicable.
         *
         * @param {Span} span OpenTelemetry span
         * @returns {Promise<void>}
         */
        const setSpanAttributes = ( span ) => {
                // base span attributes
                span.setAttributes( spanAttributes );
        };

        const clsTokenRelayHandler = new TokenRelayHookHandler( tokenRelayUrl );

        window.clsFetch = window.fetch;
        window.fetch = async ( req, init ) => {
            const url = req.url || req;
            if ( url === clsUrl ) {
                // If this is CLS request, add the token
                let request = new Request( req, init );
                request = await clsTokenRelayHandler.handleRequestHook( request );
                return window.clsFetch( request );
            } else {
                // Let all other fetches through normallv
                return window.clsFetch( req, init );
            }
        };

        // Initialize and configure the OpenTelemetry Web Tracer Provider
        const provider = new WebTracerProvider();

        let spanProcessor = new AutoFlushBatchSpanProcessor(
            new ClsExporter( {
                endpoint: clsUrl,
                compress: DebugFlags.isClsCompressionEnabled(),
                getExportHeaders: () => ( {
                    'X-ORCL-CLS-APP-INFO': spanAttributes[ 'product.name' ],
                    'X-ORCL-CLS-CLIENT-INFO': spanAttributes[ 'platform.version' ],
                } ),
            } ), {
                scheduledDelayMillis: 15000,
            },
        );

        if ( DebugFlags.isConsoleExporterEnabled() ) {
            spanProcessor = new MultiSpanProcessor( [
                spanProcessor,
                new ContextProviderSpanProcessor( {
                    spanProcessor: new SimpleSpanProcessor(
                        new ConsoleSpanExporter(),
                    ),
                } ),
            ] );
        }

        provider.addSpanProcessor(
            new ContextProviderSpanProcessor( {
                spanProcessor: new RedwoodSpanProcessor( {
                    spanProcessor,
                    applyCustomAttributesOnSpan: setSpanAttributes,
                } ),
            } ),
        );
        provider.register( {
            contextManager: new StackContextManager(),
        } );

        // suppress span generation for the CLS and token relay URLs
        const ignoreUrls = [ clsUrl, tokenRelayUrl ];

        // Register various instrumentations to capture telemetry data
        registerInstrumentations( {
            instrumentations: [
                // Instrumentation for capturing document load and resource fetch timings
                new DocumentLoadInstrumentation( {
                    applyCustomAttributesOnSpan: {
                        resourceFetch: ( span, performanceResourceTiming ) => {
                            // add a reference to the performance resource timing entry for later processing
                            if ( performanceResourceTiming ) {
                                Object.defineProperty( span, PERFORMANCE_RESOURCE_TIMING_KEY, {
                                    value: performanceResourceTiming,
                                    configurable: false,
                                    enumerable: false,
                                    writable: false,
                                } );
                            }
                        },
                    },
                } ),
                // instrumentation for requests via fetch
                new FetchInstrumentation( {
                    ignoreUrls,
                    applyCustomAttributesOnSpan: ( span, request, responseOrError ) => {
                        // add a reference to the request for later processing
                        Object.defineProperty( span, REQUEST_KEY, {
                            value: request,
                            configurable: false,
                            enumerable: false,
                            writable: false,
                        } );

                        // add a reference to the result for later processing
                        Object.defineProperty( span, RESPONSE_OR_ERROR_KEY, {
                            value: responseOrError,
                            configurable: false,
                            enumerable: false,
                            writable: false,
                        } );

                        // don't add a reference to the performance resource timing here; it may be too soon to retrieve it
                    },
                } ),
                // Instrumentation for capturing user interactions (e.g., clicks)
                new APEXUserInteractionInstrumentation(),
                // instrumentation for requests via XHR
                new XMLHttpRequestInstrumentation( {
                    ignoreUrls,
                    applyCustomAttributesOnSpan: ( span, xhr ) => {
                        // add a reference to the xhr for later processing
                        Object.defineProperty( span, XHR_KEY, {
                            value: xhr,
                            configurable: false,
                            enumerable: false,
                            writable: false,
                        } );
                    },
                } ),
            ],
        } );
    }
} )();
