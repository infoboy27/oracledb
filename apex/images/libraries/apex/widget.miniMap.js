/*!
 * Copyright (c) 2021, 2024, Oracle and/or its affiliates.
 */
/**
 * @fileOverview
 * miniMap is a basic implementaion of the underlying maplibregl library to display maps pointing to given coordinates
 *
 * The markup expected by this widget is simply a empty div element. Optionally all provided options could also
 * be set by using data-* attributes.
 *
 * Supported options:
 * - background:                    String which supplies name of the background map,
 *                                  "default" uses "osm-bright" and for dark mode "osm-dark-matter"
 *                                  Valid values: "default", "osm-bright", "osm-positron", "bi-world-map",
 *                                                "osm-dark-matter", "world-map", "shared-component"
 * - center:                        An array containing the coordinates with latitude & longitude
 *                                  [ longitude, latitude ], [ -122.26516, 37.52938 ]
 * - zoom:                          [Defaults 16] The zoom level of the map, range between 0 and 18
 *                                  additional values will add to the existing selection.
 * - marker:                        [Defaults true] Whether to show a marker or not
 * - markerColor:                   Color of the marker, if empty default color of maplibre is used
 * - controls:                      [Defaults false] Whether to show controls or not
 * - interactive:                   [Defaults true] Whether to have an interactive map or not
 * - tooltip:                       If supplied, shows a tooltip popup above a marker, which is visible when the marker was clicked
 *                                  The tooltip also supports HTML markup and APEX template directives
 * - useCustomBackground            [Default false] Whether to use a custom map from shared components
 * - customBackgroundName           String which supplies name of the custom background map
 * - customBackgroundType           Type of the map tile layer retrieved from custom background URL.
 *                                  One of "RASTER", "VECTOR" or "OGCWMS"
 * - customBackgroundUrl            URL used to fetch a custom map tile layer
 * - customBackgroundAttribution    Attribution text to display on the custom map
 * - customBackgroundApiKey         API Key value that can be set in the custom background URL, if required by the provider.
 * - customBackgroundHeaders        Custom background HTTP headers required by the provider. Comma separated key=value pairs.
 * - customBackgroundMinZoom        [Defaults 0] The minimum zoom level of the map (0-24) with 0 being the lowest zoom level (fully zoomed out)
 *                                  and 24 being the highest (fully zoomed in).
 * - customBackgroundMaxZoom        [Defaults 18] The maximum zoom level of the map (0-24) with 0 being the lowest zoom level (fully zoomed out)
 *                                  and 24 being the highest (fully zoomed in).
 *
 * File URL to reference: #APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.miniMap#MIN#.js
 *
 * Open Issues:
 *
 * Future:
 *
 *
 * Depends:
 *      jquery-3.5.1.js
 *      jquery.ui.core.js
 *      jquery.ui.widget.js
 *      core.js
 *      debug.js
 *      maplibre-gl.js
 *
 * @example <caption>Create miniMap using options</caption>
 *
 * <div id="myMap" style="width:100%;height:300px"></div>
 *
 * $( "#myMap" ).miniMap( {
 *     center: [ -122.26516, 37.52938 ],
 *     background: "osm-bright",
 *     zoom: 14,
 *     marker: true,
 *     markerColor: "red",
 *     controls: true,
 *     interactive: true,
 *     tooltip: "Oracle Redwood Shores"
 * } );
 *
 * @example <caption>Create miniMap with custom background using options</caption>
 *
 *  * <div id="myMap" style="width:100%;height:300px"></div>
 *
 * $( "#myMap" ).miniMap( {
 *     center: [ -122.26516, 37.52938 ],
 *     background: "shared-component",
 *     zoom: 14,
 *     marker: true,
 *     markerColor: "red",
 *     controls: true,
 *     interactive: true,
 *     tooltip: "Oracle Redwood Shores",
 *     useCustomBackground: true,
 *     customBackgroundName: "Custom Map",
 *     customBackgroundType: "VECTOR",
 *     customBackgroundUrl: "https://example.com/maps/basic-v2/style.json?key={api-key}",
 *     customBackgroundAttribution: "Copyright Notice Here",
 *     customBackgroundApiKey: "Your API key here",
 *     customBackgroundHeaders: "key=value",
 *     customBackgroundMinZoom: 3,
 *     customBackgroundMaxZoom: 15
 * } );
 *
 * @example <caption>Create miniMap using data attributes</caption>
 *
 * <div id="myMap"
 *     data-center="[-122.26516, 37.52938]"
 *     data-background="osm-bright"
 *     data-zoom="14"
 *     data-marker="true"
 *     data-marker-color="red"
 *     data-controls="true"
 *     data-interactive="true"
 *     data-tooltip="Oracle Redwood Shores"
 *     style="width:100%;height:300px">
 * </div>
 *
 * $( "#myMap" ).miniMap();
 *
 * @example <caption>Create miniMap with custom background using data attributes</caption>
 *
 * <div id="myMap"
 *     data-center="[-122.26516, 37.52938]"
 *     data-background="shared-component"
 *     data-zoom="14"
 *     data-marker="true"
 *     data-marker-color="red"
 *     data-controls="true"
 *     data-interactive="true"
 *     data-tooltip="Oracle Redwood Shores"
 *     data-custom-map-bg="true"
 *     data-custom-map-bg-name="Custom Map"
 *     data-custom-map-bg-type="VECTOR"
 *     data-custom-map-bg-url="https://example.com/maps/basic-v2/style.json?key={api-key}"
 *     data-custom-map-bg-attribution="Copyright Notice Here"
 *     data-custom-map-bg-api-key="Your API key here"
 *     data-custom-map-bg-http-headers="key=value"
 *     data-custom-map-bg-zoom-min="3"
 *     data-custom-map-bg-zoom-max="15"
 *     style="width:100%;height:300px">
 * </div>
 *
 * $( "#myMap" ).miniMap();
 */

/* global maplibregl */

( function ( $, widget, util, env, lang, server, debug, libVersions ) {
    "use strict";

    // Constants
    const MINIMAP = "miniMap",
          MINIMAP_CLASS = "apex-minimap",
          MAPLIBRE_BASE_PATH = env.APEX_FILES + `libraries/maplibre-gl-js/${libVersions.maplibre}/`,
          MAPBOX_GL_RTL_TEXT_SOURCE = env.APEX_FILES + `libraries/mapbox-gl-rtl-text/${libVersions.mapboxGlRtlText}/mapbox-gl-rtl-text.js`,
          DEFAULT_MARKER_COLOR = "var(--a-palette-primary, #006BD8)",
          DEFAULT_ELOCATION = "elocation-osm-bright",
          ELOCATIONS_VECTOR_TILE_LAYERS = {
              "elocation-osm-bright": "https://elocation.oracle.com/appidGC000110/mapviewer/pvt/res/style/osm-bright/style.json",
              "elocation-osm-positron": "https://elocation.oracle.com/appidGC000110/mapviewer/pvt/res/style/osm-positron/style.json",
              "elocation-osm-dark-matter": "https://elocation.oracle.com/appidGC000110/mapviewer/pvt/res/style/osm-dark-matter/style.json"
          },
          ELOCATIONS_RASTER_TILE_LAYERS = {
              version: 8,
              id: "elocation-osm-raster-tiles",
              name: "OSM Bright (Oracle)",
              metadata: {
                  "sgtech:version": "19.1.0",
                  "sgtech:sources:type": "raster"
              },
              sources: {
                  "elocation-osm-bright": {
                      type: "raster",
                      name: "OSM Bright (Oracle)",
                      attribution: "",
                      tiles: ["https://elocation.oracle.com/appidGC000110/mapviewer/mcserver/ELOCATION_MERCATOR/osm_bright/{z}/{y}/{x}.png"],
                      tileSize: 256
                  },
                  "elocation-osm-positron": {
                      type: "raster",
                      name: "OSM Positron (Oracle)",
                      attribution: "",
                      tiles: ["https://elocation.oracle.com/appidGC000110/mapviewer/mcserver/ELOCATION_MERCATOR/osm_positron/{z}/{y}/{x}.png"],
                      tileSize: 256
                  },
                  "elocation-bi-world-map": {
                      type: "raster",
                      name: "Bi World Map (Oracle)",
                      attribution: "",
                      tiles: ["https://elocation.oracle.com/appidGC000110/mapviewer/mcserver/ELOCATION_MERCATOR/bi_world_map_mb/{z}/{y}/{x}.png"],
                      tileSize: 256
                  },
                  "elocation-osm-dark-matter": {
                      type: "raster",
                      name: "OSM Dark Matter (Oracle)",
                      attribution: "",
                      tiles: ["https://elocation.oracle.com/appidGC000110/mapviewer/mcserver/ELOCATION_MERCATOR/osm_darkmatter/{z}/{y}/{x}.png"],
                      tileSize: 256
                  },
                  "elocation-world-map": {
                      type: "raster",
                      name: "World Map (Oracle)",
                      attribution: "",
                      tiles: ["https://elocation.oracle.com/appidGC000110/mapviewer/mcserver/ELOCATION_MERCATOR/world_map_mb/{z}/{y}/{x}.png"],
                      tileSize: 256
                  }
              },
              layers: [
                  {
                      id: "elocation-osm-bright-layer",
                      type: "raster",
                      source: DEFAULT_ELOCATION,
                      minzoom: 0,
                      maxzoom: 18.01
                  }
              ]
          };

    $.widget( "apex." + MINIMAP, {
        widgetEventPrefix: MINIMAP,
        options: {
            background: "default",
            center: [0, 0],
            zoom: 16,
            marker: true,
            markerColor: "",
            controls: false,
            interactive: true,
            tooltip: "",
            useCustomBackground: false,
            customBackgroundName: "",
            customBackgroundType: "",
            customBackgroundUrl: "",
            customBackgroundAttribution: "",
            customBackgroundApiKey: "",
            customBackgroundHeaders: "",
            customBackgroundMinZoom: 0,
            customBackgroundMaxZoom: 18
        },
        _create: function () {
            let el$ = this.element;

            if ( el$.hasClass( MINIMAP_CLASS ) ) {
                debug.warn( "Map is already initialized." );
                return;
            }

            if( el$.attr( 'data-map-height' ) ) {
                this._setMapHeight();
            } else {
                this._setAutoHeight();
            }

            this._createMap();
            el$.addClass( MINIMAP_CLASS );
        },
        _getCreateOptions: function () {
            let options = {},
                el$ = this.element;

            if ( el$[0].hasAttribute( "data-background" ) ) {
                options.background = el$.data( "background" );
            }
            if ( el$[0].hasAttribute( "data-center" ) ) {
                options.center = el$.data( "center" );
            }
            if ( el$[0].hasAttribute( "data-zoom" ) ) {
                options.zoom = el$.data( "zoom" );
            }
            if ( el$[0].hasAttribute( "data-marker" ) ) {
                options.marker = el$.data( "marker" );
            }
            if ( el$[0].hasAttribute( "data-marker-color" ) ) {
                options.markerColor = el$.data( "marker-color" );
            }
            if ( el$[0].hasAttribute( "data-controls" ) ) {
                options.controls = el$.data( "controls" );
            }
            if ( el$[0].hasAttribute( "data-interactive" ) ) {
                options.interactive = el$.data( "interactive" );
            }
            if ( el$[0].hasAttribute( "data-tooltip" ) ) {
                options.tooltip = el$.data( "tooltip" );
            }
            if ( el$[0].hasAttribute( "data-custom-map-bg" ) ) {
                options.useCustomBackground = el$.data( "custom-map-bg" );
            }
            if ( el$[0].hasAttribute( "data-custom-map-bg-name" ) ) {
                options.customBackgroundName = el$.data( "custom-map-bg-name" );
            }
            if ( el$[0].hasAttribute( "data-custom-map-bg-type" ) ) {
                options.customBackgroundType = el$.data( "custom-map-bg-type" );
            }
            if ( el$[0].hasAttribute( "data-custom-map-bg-url" ) ) {
                options.customBackgroundUrl = el$.data( "custom-map-bg-url" );
            }
            if ( el$[0].hasAttribute( "data-custom-map-bg-attribution" ) ) {
                options.customBackgroundAttribution = el$.data( "custom-map-bg-attribution" );
            }
            if ( el$[0].hasAttribute( "data-custom-map-bg-api-key" ) ) {
                options.customBackgroundApiKey = el$.data( "custom-map-bg-api-key" );
            }
            if ( el$[0].hasAttribute( "data-custom-map-bg-http-headers" ) ) {
                options.customBackgroundHeaders = el$.data( "custom-map-bg-http-headers" );
            }
            if ( el$[0].hasAttribute( "data-custom-map-bg-zoom-min" ) ) {
                options.customBackgroundMinZoom= el$.data( "custom-map-bg-zoom-min" );
            }
            if ( el$[0].hasAttribute( "data-custom-map-bg-zoom-max" ) ) {
                options.customBackgroundMaxZoom = el$.data( "custom-map-bg-zoom-max" );
            }

            return options;
        },
        _setOption: function ( key, value ) {
            let el$ = this.element;

            this._super( key, value );

            if ( !this.map ) {
                debug.warn( "miniMap map object is not initialized yet." );
                return;
            }

            switch ( key ) {
            case "background":
                ( async () => {
                    let elocation = await this._getElocation();

                    this.map.setStyle( elocation );
                    if ( el$[0].hasAttribute( "data-background" ) ) {
                        el$.data( "background", value );
                    }
                } )();
                break;
            case "center":
                this.map.setCenter( value );
                if ( this.marker ) {
                    this.marker.setLngLat( value ).addTo( this.map );
                }
                if ( el$[0].hasAttribute( "data-center" ) ) {
                    el$.data( "center", value );
                }
                break;
            case "zoom":
                this.map.setZoom( value );
                if ( el$[0].hasAttribute( "data-zoom" ) ) {
                    el$.data( "zoom", value );
                }
                break;
            case "marker":
                if ( this.marker ) {
                    if ( !value ) {
                        this.marker.remove();
                        this.marker = null;
                        this.popup = null;
                    }
                } else {
                    if ( value ) {
                        this._createMapMarker();
                    }
                }
                if ( el$[0].hasAttribute( "data-marker" ) ) {
                    el$.data( "marker", value );
                }
                break;
            case "markerColor":
                if ( this.marker ) {
                    this.marker.remove();
                    this.marker = null;
                    this.popup = null;
                    this._createMapMarker();
                }
                if ( el$[0].hasAttribute( "data-marker-color" ) ) {
                    el$.data( "marker-color", value );
                }
                break;
            case "tooltip":
                if ( this.popup ) {
                    if ( value ) {
                        this.popup.setHTML( util.applyTemplate( value ) );
                    } else {
                        this.popup.setText( "" );
                        this.popup.remove();
                        this.popup = null;
                    }
                } else {
                    if ( value ) {
                        if ( this.marker ) {
                            this._createMapPopup();
                        }
                    }
                }
                if ( el$[0].hasAttribute( "data-tooltip" ) ) {
                    el$.data( "tooltip", value );
                }
                break;
            case "controls":
                if ( this.controls ) {
                    if ( !value ) {
                        this.map.removeControl( this.controls );
                        this.controls = null;
                    }
                } else {
                    if ( value ) {
                        this._createMapControls();
                    }
                }
                if ( el$[0].hasAttribute( "data-controls" ) ) {
                    el$.data( "controls", value );
                }
                break;
            case "interactive":
                this.map.remove();
                this.map = null;
                this.marker = null;
                this.popup = null;
                this.controls = null;
                this.attribution = null;
                this._createMap();
                if ( el$[0].hasAttribute( "data-interactive" ) ) {
                    el$.data( "interactive", value );
                }
                break;
            }
        },
        _destroy: function () {
            this.map.remove();
            this.element.empty();
            this.element.removeClass( MINIMAP_CLASS );
            this.map = null;
            this.marker = null;
            this.popup = null;
            this.controls = null;
            this.attribution = null;
        },
        _setAutoHeight: function () {
            let el$ = this.element;

            // set automatic height (3:2 aspect ratio) if not provided as inline style
            // set timeout because theme adjustments to displayed width during page load
            if ( !el$[0].style.height || el$.height() === 0 ) {
                setTimeout( function () {
                    el$.css( "height", el$.width() * ( 2 / 3 ) );
                }, 20 );
            }
        },
        _loadMaplibreFiles: function () {
            let deferred = $.Deferred();

            function _loadScript( callback ) {
                if ( typeof require === "undefined" ) {
                    server.loadScript(
                        {
                            path: MAPLIBRE_BASE_PATH + "maplibre-gl.js"
                        },
                        function () {
                            callback();
                        }
                    );
                } else {
                    require.config( {
                        paths: {
                            maplibre: MAPLIBRE_BASE_PATH + "maplibre-gl"
                        },
                        shim: {
                            maplibre: {
                                exports: ["maplibregl"]
                            }
                        }
                    } );

                    require( ["maplibre"], function ( maplibregl ) {
                        window.maplibregl = maplibregl;
                        callback();
                    } );
                }
            }

            if ( typeof maplibregl === "undefined" ) {
                // load css
                if ( $( "link[href='" + MAPLIBRE_BASE_PATH + "maplibre-gl-apex.css']" ).length === 0 ) {
                    $( "<link/>", {
                        rel: "stylesheet",
                        type: "text/css",
                        href: MAPLIBRE_BASE_PATH + "maplibre-gl-apex.css"
                    } ).appendTo( "head" );
                }

                // load js
                _loadScript( function () {
                    deferred.resolve();
                } );
            } else {
                deferred.resolve();
            }
            return deferred.promise();
        },
        _getElocationName: function () {
            const ELOCATION_PREFIX = "elocation-";

            let options = this.options,
                elocationName = "";

            function _isDarkMode() {
                return $( "body" ).hasClass( "apex-theme-vita-dark" );
            }

            if ( options.useCustomBackground ) {
                elocationName = ELOCATION_PREFIX + options.customBackgroundName.toLowerCase().replace(/ +/g, "-");
            } else if ( !options.background || options.background === "default" ) {
                elocationName = _isDarkMode() ? "elocation-osm-dark-matter" : DEFAULT_ELOCATION;
            } else {
                elocationName = ELOCATION_PREFIX + options.background;
            }

            return elocationName;
        },
        _useVectorTyleLayers: function () {
            let elocationName = this._getElocationName() || "",
                vectorTileLayer = ELOCATIONS_VECTOR_TILE_LAYERS[elocationName];

            return vectorTileLayer ? true : false;
        },
        _getElocation: async function () {
            let elocations = $.extend( true, {}, ELOCATIONS_RASTER_TILE_LAYERS ),
                elocationName = this._getElocationName() || "";

            function _handleRasterTileLayers() {
                elocations.layers[0].id = elocationName + "-layer";
                elocations.layers[0].source = elocationName;
                elocations.name = elocations.sources[elocationName].name;
            }

            async function _fetchVectorLayerData( url ) {
                if ( url ) {
                    let response = await fetch( url, {
                        credentials: "omit",
                        cache: "no-store",
                        referrerPolicy: "no-referrer"
                    } );

                    if ( response.ok ) {

                        let layerData = await response.json();
                        let { sources = {} } = layerData;

                        /*
                         * The atribution control would add the attribution prop value from the elacation layer data
                         * We already provide this value on the copyrightNotice option, so we remove this property
                         * from Oracle vector object to avoid duplicated attribution values
                         */
                        if ( sources.openmaptiles && sources.openmaptiles.attribution ) {
                            sources.openmaptiles.attribution = "";
                        }

                        return layerData;

                    } else {
                        debug.error( "An error has occured while fetching: " + response.url + " Status: " + response.status );
                    }
                }
            }

            if ( this.options.useCustomBackground ) {
                const WMS = "OGCWMS",
                    LAYER_TYPE = this.options.customBackgroundType;

                let layerUrl = this.options.customBackgroundUrl.replace( "{api-key}", this.options.customBackgroundApiKey );

                if ( LAYER_TYPE === "VECTOR" ) {
                    elocations = _fetchVectorLayerData( layerUrl );
                } else if ( [ "RASTER", WMS ].includes( LAYER_TYPE ) ) {
                   /*
                    * WMS URL used to fetch a map tile layer from the Web Map Service - Open Geospatial Consortium.
                    * In order to properly render the tile layer the following WMS parameters will be added
                    * automatically by Mini Map:
                    * - BBOX
                    * - WIDTH
                    * - HEIGHT
                    * - REQUEST
                    * - FORMAT
                    * - SRS / CRS
                    */
                    if ( LAYER_TYPE === WMS ) {
                        let versionMatch = layerUrl.match(/(^|[&])version=([^&]*)/),
                            referenceSys = ( versionMatch !== null && parseFloat( versionMatch[2] ) >= 1.3 )
                                         ? "crs" : "srs";

                        layerUrl += "&request=GetMap&bbox={bbox-epsg-3857}&format=image/png&"
                            + referenceSys + "=EPSG:3857&width=256&height=256";
                    }

                    elocations.sources[ elocationName ] = {
                        type: "raster",
                        name: this.options.customBackgroundName,
                        attribution: '',
                        tiles: [ layerUrl ],
                        tileSize: 256
                    };

                    _handleRasterTileLayers();
                }
            } else {
                if ( this._useVectorTyleLayers() ) {
                    elocations = _fetchVectorLayerData( ELOCATIONS_VECTOR_TILE_LAYERS[elocationName] );
                } else {
                    _handleRasterTileLayers();
                }
            }

            return elocations;
        },
        _addCopyrightNotice: function () {
            const { customBackgroundAttribution } = this.options;

            let attrBtn$,
                options = this.options,
                map = this.map,
                toggleMessage = apex.lang.getMessage( "APEX.MAPS.TOGGLE_COPYRIGHT" ),
                customBackgroundAttrib = customBackgroundAttribution ? customBackgroundAttribution : null,
                showOSMCopyright = !options.background || options.background === "default" || options.background.includes( "osm" ),
                copyrightMessage = options.useCustomBackground ?
                    customBackgroundAttrib : showOSMCopyright ?
                        lang.getMessage( "APEX.MAPS.OSM_MAP_COPYRIGHT" ) : lang.getMessage( "APEX.MAPS.ORACLE_MAP_COPYRIGHT" );

            this.attribution = new maplibregl.AttributionControl( {
                customAttribution: copyrightMessage
            } );

            map.addControl( this.attribution );

            // When map is small a button will be displayed to toggle copyright text
            attrBtn$ = $( this.attribution._container ).find( "button" );
            attrBtn$.attr( {
                "type": "button",
                "title": toggleMessage,
                "aria-label": toggleMessage
            } );
        },
        _createMapMarker: function () {
            let options = this.options,
                map = this.map;

            if ( options.marker ) {
                this.marker = new maplibregl.Marker( { color: options.markerColor || DEFAULT_MARKER_COLOR } ).setLngLat( options.center ).addTo( map );
                this._createMapPopup();
            }
        },
        _createMapPopup: function () {
            let self = this,
                options = this.options;

            if ( options.marker ) {
                if ( options.tooltip ) {
                    this.popup = new maplibregl.Popup( { offset: 25 } ).setHTML( util.applyTemplate( options.tooltip ) );
                    this.marker.setPopup( this.popup );
                    this.popup.on( "open", function () {
                        if ( self.popup && self.popup.getElement() ) {
                            $( self.popup.getElement() ).css( "color", "#000" );
                        }
                    } );
                }
            }
        },
        _createMapControls: function () {
            let options = this.options,
                map = this.map;

            if ( options.controls ) {
                this.controls = new maplibregl.NavigationControl( {
                    showCompass: options.interactive
                } );
                map.addControl( this.controls );
            }
        },
        _createMap: function () {
            let self = this,
                options = self.options,
                useVectorTyleLayers = this._useVectorTyleLayers(),
                mapOptions = {},
                elocation;

            function _getCustomHeaders() {
                let headers = {},
                    re = /([^=]+)=([^,]+),?/g,
                    match = re.exec( options.customBackgroundHeaders );

                while ( match ) {
                    headers[ match[ 1 ] ] = match[ 2 ];

                    match = re.exec( options.customBackgroundHeaders );
                }

                return Object.keys( headers ).length > 0 ? headers : null;
            }

            function _getTransformRequestCallback() {
                let headers = options.useCustomBackground ?
                        _getCustomHeaders() : useVectorTyleLayers ?
                            { 'x-oracle-pvtile' : 'OracleSpatial' } : null;

                if ( headers ) {
                    return ( url, resourceType ) => {
                        let reqParameters = { url };

                        if ( resourceType === "Tile" ) {
                            // Set headers and set the credentials property for cross-origin requests
                            reqParameters.credentials = 'include';
                            reqParameters.headers = headers;
                        }

                        return reqParameters;
                    };
                }
            }

            function _getMinMaxZoomLevels() {
                let hasMinZoom = Number.isInteger( options.customBackgroundMinZoom ),
                    hasMaxZoom = Number.isInteger( options.customBackgroundMaxZoom );

                return {
                    minZoom: options.useCustomBackground ?
                        hasMinZoom ?
                            options.customBackgroundMinZoom : null : 0,
                    maxZoom: options.useCustomBackground ?
                        hasMaxZoom ?
                            options.customBackgroundMaxZoom : null : 18,
                };
            }

            ( async () => {
                elocation = await self._getElocation();
                mapOptions = {
                    container: self.element[0],
                    style: elocation,
                    center: options.center,
                    zoom: options.zoom,
                    interactive: options.interactive,
                    attributionControl: false,
                    locale: {
                        'Map.Title': lang.getMessage( "APEX.MAPS.MAP" ) // Map <canvas> aria-label
                    },
                    transformRequest: _getTransformRequestCallback(),
                    ..._getMinMaxZoomLevels()
                };

                await self._loadMaplibreFiles();
                /*
                 * Set the RTL text plugin to support right-to-left text rendering.
                 * This will make right-to-left labels such as in Arabic and Hebrew
                 * to display correctly using the built-in OpenStreetMap map backgrounds.
                 */
                if ( maplibregl.getRTLTextPluginStatus() === 'unavailable' ) {
                    // Only load the plugin once if there are multiple maps
                    maplibregl.setRTLTextPlugin( 
                        MAPBOX_GL_RTL_TEXT_SOURCE,
                        true // Lazy load the plugin
                    );
                    window.addEventListener( "unhandledrejection", function( promiseRejectionEvent ) { 
                        if( promiseRejectionEvent.reason.message.startsWith( 'RTL Text Plugin failed to import scripts from' ) 
                            && maplibregl.getRTLTextPluginStatus() === 'loaded' ) {
                            // The `setRTLTextPlugin` function  which loads the RTL plugin in version 4.0.1 and all the available versions of maplibre-gl 
                            // trigger a console error `Error: RTL Text Plugin failed to import scripts from ..` when using an async type of RTL plugin,
                            // which is the case for the RTL plugin version 0.3.0 we are using.
                            // The plugin is still loaded and the RTL labels displays correctly on the map,
                            // so the error is considered a false positive and we are ignoring it if the plugin is loaded.
                            // This is a known issue and is tracked in the maplibre-gl-js repository: https://github.com/maplibre/maplibre-gl-js/issues/4252
                            promiseRejectionEvent.preventDefault();
                        }
                    });
                }
                
                self.map = new maplibregl.Map( mapOptions );

                self._createMapMarker();
                self._createMapControls();
                self._addCopyrightNotice();
            } )();

            // resize the map when container was resized
            widget.util.onElementResize( self.element[0], function () {
                if ( self.map ) {
                    self.map.resize();
                }
            } );

            // resize the map when an inline dialog is resized
            // widget.util.onElementResize does not work properly in inline dialogs
            // we should consider fixing this more generic or on theme level in future
            self.element.closest( ".js-regionDialog" ).on( "dialogresize", function () {
                if ( self.map ) {
                    self.map.resize();
                }
            } );

            // set automatic height when map becomes visible
            widget.util.onVisibilityChange( self.element[0], function () {
                self._setAutoHeight();
                if ( self.map ) {
                    self.map.resize();
                }
            } );
        },
        _setMapHeight: function() {
            let mapHeigth = this.element.attr( 'data-map-height' );

            if ( mapHeigth ) {
                this.element.css( 'block-size', mapHeigth );
            }
        }
    } );
} )( apex.jQuery, apex.widget, apex.util, apex.env, apex.lang, apex.server, apex.debug, apex.libVersions );
