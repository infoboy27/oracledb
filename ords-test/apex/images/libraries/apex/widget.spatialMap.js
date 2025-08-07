/*!
 * Copyright (c) 2021, 2024, Oracle and/or its affiliates. All rights reserved.
 */

/* global maplibregl */

/**
 * @interface mapRegion
 * @since 21.2
 * @extends {region}
 * @classdesc
 * <p>The mapRegion interface is used to access the properties and methods of the spatialMap API.
 * You get access to the mapRegion interface with the {@link apex.region} function when passed
 * the regionId (static ID) of a Map Region. This region uses the 3rd party {@link https://maplibre.org/ MapLibre GL JS}
 * library and exposes it via the {@link mapRegion#getMapObject} method. Developer code that uses the MapLibre API
 * may not be forward compatible should the MapLibre API change.
 * </p>
 */

 ( function ( util, env, debug, lang, locale, $, actions, widgetUtil, region, libVersions ) {
    "use strict";

    const MAPBOX_GL_RTL_TEXT_SOURCE = env.APEX_FILES + `libraries/mapbox-gl-rtl-text/${libVersions.mapboxGlRtlText}/mapbox-gl-rtl-text.js`;

    const C_DISTANCE_CONTAINER = "a-MapRegion-distance",
        C_MAPLIBRE_CTRL = "maplibregl-ctrl maplibregl-ctrl-group",
        C_LEGEND_ITEM = "a-MapRegion-legendItem",
        C_ICON = "a-Icon",
        C_TWO_D_MODE = "icon-2d-mode",
        C_CL_POPUP = "a-MapRegion-popup",
        C_INFO_W = "a-MapRegion-popup--info",
        C_TOOLTIP = "a-MapRegion-popup--tooltip",
        C_POPUP_TITLE = "a-MapRegion-popupTitle",
        C_POPUP_CONTENT = "a-MapRegion-popupContent",
        C_NAV_BAR_POS = "a-MapRegion--zoomControlsStart", // Used to position distance container and nav control side by side
        C_HIDDEN = "u-hidden";

    const DARK_MATTER_TILE_LAYER = "osm-dark-matter",
        SHARED_COMPONENT_TYPE = "shared-component",
        POLYGONS_LYR_TYPE = "polygons",
        LINES_LYR_TYPE = "lines",
        HEAT_MAP_LYR_TYPE = "heatMap",
        EXTRUDED_LYR_TYPE = "3d",
        SVG_LYR_TYPE = "svg",
        ICON_LYR_TYPE = "icon",
        ICON_IMG_LAYER_TYPE = "url-image";

    const POINTS_GEOM_TYPE = "Point";

    const POPUP_ADV_FMT = "ADV_FORMATTING",
        POPUP_TITLE_BODY = "TITLE_BODY";

    const TOOLTIP_TYPE = "tooltip",
        INFO_WINDOW_TYPE = "infoWindow";

    const MARKER_ID = "Default",
        CAMERA_ID = "Camera",
        CIRCLE_ID = "Circle",
        CIRCLE_ALT = "Circle Alternative",
        FACE_FROWN = "Face Frown",
        FACE_MEH = "Face Meh",
        FACE_SMILE = "Face Smile",
        SQUARE = "Square",
        SQUARE_ALT = "Square Alternative",
        PIN_CIRCLE = "Pin Circle",
        HEART = "Heart",
        PENTAGON = "Pentagon",
        PIN_SQUARE = "Pin Square",
        TRIANGLE = "Triangle",
        CHECK = "Check",
        HOME = "Home",
        SLASH = "Slash",
        SHINE = "Shine",
        STREET_VIEW = "Street View",
        FLAG_PENNANT = "Flag Pennant",
        FLAG_SWALLOWTAIL = "Flag Swallowtail";

    const ZOOM_FACTOR = 3;

    const SVG_MARKER =  {
        "name": MARKER_ID,
        "width": 20,
        "height": 20,
        "paint-order": "stroke",
        "viewBox": "0 0 20 20",
        "elements": [
            {
                "type": "path",
                "d": "M10 2C6.7 2 4 4.7 4 8c0 4.6 5.4 9.7 5.7 9.9.2.2.5.2.7 0 .2-.2 5.6-5.3 5.6-9.9 0-3.3-2.7-6-6-6zm0 7.9c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2z"
            }
        ]
    },
    SVG_CAMERA = {
        "name": CAMERA_ID,
        "width": 20,
        "height": 20,
        "paint-order": "stroke",
        "viewBox": "0 0 20 20",
        "elements": [
            {
                "type": "path",
                "d": "M15 4h-1.2l-.9-1.2c-.4-.5-1-.8-1.6-.8H8.8c-.7 0-1.3.3-1.6.8L6.2 4H5c-1.1 0-2 .9-2 2v5c0 1.1.9 2 2 2h2.2l2.4 4.7c.1.2.4.3.7.2.1 0 .2-.1.2-.2l2.4-4.7H15c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm-5 7c-1.4 0-2.5-1.1-2.5-2.5S8.6 6 10 6s2.5 1.1 2.5 2.5S11.4 11 10 11z"
            }
        ]
    },
    SVG_CIRCLE = {
        "name": CIRCLE_ID,
        "width": 20,
        "height": 20,
        "paint-order": "stroke",
        "viewBox": "0 0 20 20",
        "elements": [
            {
                "type": "path",
                "d": "M10 2C6.7 2 4 4.7 4 8c0 2.5 1.6 4.7 3.9 5.6l1.6 4.1c.1.3.4.4.7.3l.3-.3 1.6-4.1c3.1-1.2 4.7-4.6 3.5-7.7C14.7 3.6 12.5 2 10 2zm0 8c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2z"
            }
        ]
    },
    SVG_CIRCLE_ALT = {
        "name": CIRCLE_ALT,
        "width": 20,
        "height": 20,
        "paint-order": "stroke",
        "viewBox": "0 0 20 20",
        "elements": [
            {
                "type": "path",
                "d": "M10 2C6.7 2 4 4.7 4 8v9.5c0 .2.1.4.3.5h.2c.1 0 .3-.1.4-.2l3.7-4c3.2.8 6.5-1.2 7.3-4.4.8-3.2-1.2-6.5-4.4-7.3-.5 0-1-.1-1.5-.1zm0 8c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2z"
            }
        ]
    },
    SVG_FACE_FROWN = {
        "name": FACE_FROWN,
        "width": 20,
        "height": 20,
        "paint-order": "stroke",
        "viewBox": "0 0 20 20",
        "elements": [
            {
                "type": "path",
                "d": "M10 2C6.7 2 4 4.7 4 8c0 3.7 5.4 9.6 5.6 9.8.2.2.5.2.7 0 .3-.2 5.7-6.1 5.7-9.8 0-3.3-2.7-6-6-6zM7.2 7c0-.4.3-.8.8-.8.4 0 .8.3.8.8s-.4.8-.8.8-.8-.4-.8-.8zm5 3.8c-.2.1-.4.1-.5-.1-.7-.9-2-1.1-3-.4-.2.1-.3.3-.4.4-.1.2-.4.2-.5.1-.2-.1-.2-.4-.1-.5 1-1.3 2.8-1.5 4-.6l.6.6c.1.1.1.4-.1.5zm-.2-3c-.4 0-.8-.3-.8-.8s.3-.8.8-.8.8.3.8.8-.4.8-.8.8z"
            }
        ]
    },
    SVG_FACE_MEH = {
        "name": FACE_MEH,
        "width": 20,
        "height": 20,
        "paint-order": "stroke",
        "viewBox": "0 0 20 20",
        "elements": [
            {
                "type": "path",
                "d": "M10 2C6.7 2 4 4.7 4 8c0 3.7 5.4 9.6 5.6 9.8.2.2.5.2.7 0 .3-.2 5.7-6.1 5.7-9.8 0-3.3-2.7-6-6-6zM7.2 7c0-.4.3-.8.8-.8.4 0 .8.3.8.8s-.4.8-.8.8-.8-.4-.8-.8zm4.3 3.9h-3c-.2 0-.4-.2-.4-.4s.2-.4.4-.4h3c.2 0 .4.2.4.4s-.2.4-.4.4zm.5-3.1c-.4 0-.8-.3-.8-.8s.3-.8.8-.8.8.3.8.8-.4.8-.8.8z"
            }
        ]
    },
    SVG_FACE_SMILE = {
        "name": FACE_SMILE,
        "width": 20,
        "height": 20,
        "paint-order": "stroke",
        "viewBox": "0 0 20 20",
        "elements": [
            {
                "type": "path",
                "d": "M10 2C6.7 2 4 4.7 4 8c0 3.7 5.4 9.6 5.6 9.8.2.2.5.2.7 0 .3-.2 5.7-6.1 5.7-9.8 0-3.3-2.7-6-6-6zM7.2 7c0-.4.3-.8.8-.8.4 0 .8.3.8.8s-.4.8-.8.8-.8-.4-.8-.8zm5.1 2.7c-1 1.3-2.8 1.5-4 .6l-.6-.6c-.1-.1-.1-.4.1-.5.2-.1.4-.1.5.1.7.9 2 1.1 3 .4.2-.1.3-.3.4-.4.1-.2.4-.2.5-.1s.2.4.1.5zM12 7.8c-.4 0-.8-.3-.8-.8s.3-.8.8-.8.8.3.8.8-.4.8-.8.8z"
            }
        ]
    },
    SVG_SQUARE = {
        "name": SQUARE,
        "width": 20,
        "height": 20,
        "paint-order": "stroke",
        "viewBox": "0 0 20 20",
        "elements": [
            {
                "type": "path",
                "d": "M14 2H6c-1.1 0-2 .9-2 2v8c0 1.1.9 2 2 2h2.1l1.5 3.7c.1.3.4.4.7.3l.3-.3 1.5-3.7H14c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm-4 8c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2z"
            }
        ]
    },
    SVG_SQUARE_ALT = {
        "name": SQUARE_ALT,
        "width": 20,
        "height": 20,
        "paint-order": "stroke",
        "viewBox": "0 0 20 20",
        "elements": [
            {
                "type": "path",
                "d": "M14 2H6c-1.1 0-2 .9-2 2v13.5c0 .2.1.4.3.5h.2c.1 0 .3-.1.4-.2L8.4 14H14c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm-4 8c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2z"
            }
        ]
    },
    SVG_PIN_CIRCLE = {
        "name": PIN_CIRCLE,
        "width": 20,
        "height": 20,
        "paint-order": "stroke",
        "viewBox": "0 0 20 20",
        "elements": [
            {
                "type": "path",
                "d": "M10 2C7.2 2 5 4.2 5 7c0 2.6 1.9 4.7 4.5 5v5.6c0 .3.2.5.5.5s.5-.2.5-.5V12c2.7-.3 4.7-2.7 4.5-5.4-.3-2.7-2.4-4.6-5-4.6z"
            }
        ]
    },
    SVG_HEART = {
        "name": HEART,
        "width": 20,
        "height": 20,
        "paint-order": "stroke",
        "viewBox": "0 0 20 20",
        "elements": [
            {
                "type": "path",
                "d": "M16 5c0-.8-.3-1.6-.9-2.1-1.2-1.2-3.1-1.2-4.3 0l-.8.8-.8-.8C8 1.7 6.1 1.7 4.9 2.9c-1.2 1.1-1.2 3 0 4.2l4.6 4.6v5.8c0 .3.2.5.5.5s.5-.2.5-.5v-5.8l4.6-4.6c.6-.5.9-1.3.9-2.1z"
            }
        ]
    },
    SVG_PENTAGON = {
        "name": PENTAGON,
        "width": 20,
        "height": 20,
        "paint-order": "stroke",
        "viewBox": "0 0 20 20",
        "elements": [
            {
                "type": "path",
                "d": "M15 5.5l-4.7-3.4c-.2-.1-.4-.1-.6 0L5 5.5c-.2.2-.3.4-.2.6l1.8 5.6c.1.2.3.3.5.3h2.4v5.5c0 .3.2.5.5.5s.5-.2.5-.5V12h2.4c.2 0 .4-.1.5-.3l1.8-5.6c.1-.2 0-.4-.2-.6z"
            }
        ]
    },
    SVG_PIN_SQUARE = {
        "name": PIN_SQUARE,
        "width": 20,
        "height": 20,
        "paint-order": "stroke",
        "viewBox": "0 0 20 20",
        "elements": [
            {
                "type": "path",
                "d": "M13 2H7c-1.1 0-2 .9-2 2v6c0 1.1.9 2 2 2h2.5v5.5c0 .3.2.5.5.5s.5-.2.5-.5V12H13c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2z"
            }
        ]
    },
    SVG_TRIANGLE = {
        "name": TRIANGLE,
        "width": 20,
        "height": 20,
        "paint-order": "stroke",
        "viewBox": "0 0 20 20",
        "elements": [
            {
                "type": "path",
                "d": "M15.9 11.2l-5.5-9c-.1-.2-.5-.3-.7-.1-.1 0-.1.1-.1.1l-5.5 9c-.1.2-.1.5.2.7 0 .1.1.1.2.1h5v5.5c0 .3.2.5.5.5s.5-.2.5-.5V12h5c.3 0 .5-.2.5-.5 0-.1 0-.2-.1-.3z"
            }
        ]
    },
    SVG_CHECK = {
        "name": CHECK,
        "width": 20,
        "height": 20,
        "paint-order": "stroke",
        "viewBox": "0 0 20 20",
        "elements": [
            {
                "type": "path",
                "d": "M10 2C6.7 2 4 4.7 4 8c0 3.7 5.4 9.6 5.6 9.8.2.2.5.2.7 0 .3-.2 5.7-6.1 5.7-9.8 0-3.3-2.7-6-6-6zm2.9 4.9l-3 3c-.2.1-.6.1-.8 0L7.6 8.4c-.2-.2-.2-.5 0-.7s.5-.2.7 0l1.1 1.1L12 6.2c.2-.2.5-.2.7 0s.3.5.2.7z"
            }
        ]
    },
    SVG_HOME = {
        "name": HOME,
        "width": 20,
        "height": 20,
        "paint-order": "stroke",
        "viewBox": "0 0 20 20",
        "elements": [
            {
                "type": "path",
                "d": "M17.8 7.6l-7.5-5.5c-.2-.1-.4-.1-.6 0L2.2 7.5c-.2.2-.3.5-.1.7.2.2.5.3.7.1L4 7.5v6c0 .3.2.5.5.5h3.2l1.9 3.7c.1.2.4.3.7.2.1 0 .2-.1.2-.2l1.9-3.7h3.2c.3 0 .5-.2.5-.5v-6l1.2.9c.2.2.5.1.7-.1.1-.3 0-.6-.2-.7z"
            },
            {
                "type": "path",
                "d": "M8.5 8.5v2c0 .3.2.5.5.5h2c.3 0 .5-.2.5-.5v-2c0-.3-.2-.5-.5-.5H9c-.3 0-.5.2-.5.5z",
                "fill": "#fff"
            }
        ]
    },
    SVG_SLASH = {
        "name": SLASH,
        "width": 20,
        "height": 20,
        "paint-order": "stroke",
        "viewBox": "0 0 20 20",
        "elements": [
            {
                "type": "path",
                "d": "M17.9 2.1c-.2-.2-.5-.2-.7 0l-2.3 2.3C13 1.7 9.2 1.1 6.5 3.1 4.9 4.3 4 6.1 4 8c.1 1.9.8 3.8 1.9 5.4l-3.8 3.8c-.2.2-.2.5 0 .7s.5.2.7 0l15-15c.2-.2.2-.6.1-.8zM9.5 9.8c-1.1-.3-1.7-1.4-1.4-2.4S9.5 5.7 10.5 6c.7.2 1.2.7 1.4 1.4L9.5 9.8zM7.1 15c.8 1 1.6 2 2.6 2.8.2.2.5.2.7 0 .2-.1 5.6-5.2 5.6-9.8 0-.6-.1-1.1-.2-1.6L7.1 15z"
            }
        ]
    },
    SVG_SHINE = {
        "name": SHINE,
        "width": 20,
        "height": 20,
        "paint-order": "stroke",
        "viewBox": "0 0 20 20",
        "elements": [
            {
                "type": "path",
                "d": "M10 7c-2.2 0-4 1.8-4 4 0 2.3 3.2 6.4 3.6 6.8.2.2.5.2.7.1l.1-.1c.4-.5 3.6-4.5 3.6-6.8 0-2.2-1.8-4-4-4zm0 5c-.6 0-1-.4-1-1s.4-1 1-1 1 .4 1 1-.4 1-1 1zM3.6 4.9c-.2-.1-.5-.1-.7.1-.2.3-.1.6.1.7l1.9 1.4c0 .1.1.1.3.1.3 0 .5-.2.5-.5 0-.2-.1-.3-.2-.4L3.6 4.9zm4 .1c.1.2.3.3.5.3h.2c.3-.1.4-.4.3-.6l-.9-2.4c0-.2-.3-.4-.6-.3-.3.1-.4.4-.3.6L7.6 5zm9.5 0c-.2-.2-.5-.3-.7-.1l-1.9 1.4c-.2.2-.3.5-.1.7.1.1.2.2.4.2.1 0 .2 0 .3-.1L17 5.7c.2-.1.3-.4.1-.7zm-5.3.3h.2c.2 0 .4-.1.5-.3l.8-2.3c.1-.3 0-.5-.3-.6-.3-.1-.5 0-.6.3l-.8 2.3c-.2.2-.1.5.2.6z"
            }
        ]
    },
    SVG_STREET_VIEW = {
        "name": STREET_VIEW,
        "width": 20,
        "height": 20,
        "paint-order": "stroke",
        "viewBox": "0 0 20 20",
        "elements": [
            {
                "type": "path",
                "d": "M14.7 11.6c-.3-.1-.5.1-.6.3s.1.5.3.6c1.6.5 2.6 1.2 2.6 1.9 0 1.2-2.9 2.5-7 2.5s-7-1.3-7-2.5c0-.7 1-1.4 2.6-1.9.3 0 .4-.3.3-.5-.1-.3-.4-.4-.6-.3-2.1.6-3.3 1.6-3.3 2.8 0 2 3.4 3.5 8 3.5s8-1.5 8-3.5c0-1.2-1.2-2.2-3.3-2.9z"
            },
            {
                "type": "path",
                "d": "M7.7 10.9c.2.2.3.5.3.7V14c0 .6.4 1 1 1h2c.6 0 1-.4 1-1v-2.4c0-.3.1-.5.3-.7l.1-.1c.4-.4.6-.9.6-1.4V7.8c0-.7-.3-1.3-.9-1.6-1.2 1.2-3.1 1.2-4.2 0-.6.3-.9.9-.9 1.6v1.6c0 .5.2 1 .6 1.4l.1.1z"
            },
            {
                "type": "circle",
                "cx": 10,
                "cy": 4,
                "r": 2
            }
        ]
    },
    SVG_FLAG_PENNANT = {
        "name": FLAG_PENNANT,
        "width": 20,
        "height": 20,
        "paint-order": "stroke",
        "viewBox": "0 0 20 20",
        "elements": [
            {
                "type": "path",
                "d": "M16.7 6.5L3.7 2c-.3-.1-.6.1-.7.3v15.2c0 .3.2.5.5.5s.5-.2.5-.5v-5.6l12.7-4.4c.3-.1.4-.4.3-.6-.1-.2-.2-.3-.3-.4z"
            }
        ]
    },
    SVG_FLAG_SWALLOWTAIL = {
        "name": FLAG_SWALLOWTAIL,
        "width": 20,
        "height": 20,
        "paint-order": "stroke",
        "viewBox": "0 0 20 20",
        "elements": [
            {
                "type": "path",
                "d": "M13.2 7l3.7-4.2c.2-.2.2-.5 0-.7-.2-.1-.3-.1-.4-.1h-13c-.3 0-.5.2-.5.5v15c0 .3.2.5.5.5s.5-.2.5-.5V12h12.5c.3 0 .5-.2.5-.5 0-.1 0-.2-.1-.3L13.2 7z"
            }
        ]
    },
    NATIVE_SVG_SHAPES = {
        "Default": SVG_MARKER,
        "Camera": SVG_CAMERA,
        "Circle": SVG_CIRCLE,
        "Circle Alternative": SVG_CIRCLE_ALT,
        "Face Frown": SVG_FACE_FROWN,
        "Face Meh": SVG_FACE_MEH,
        "Face Smile": SVG_FACE_SMILE,
        "Square": SVG_SQUARE,
        "Square Alternative": SVG_SQUARE_ALT,
        "Pin Circle": SVG_PIN_CIRCLE,
        "Heart": SVG_HEART,
        "Pentagon": SVG_PENTAGON,
        "Pin Square": SVG_PIN_SQUARE,
        "Triangle": SVG_TRIANGLE,
        "Check": SVG_CHECK,
        "Home": SVG_HOME,
        "Slash": SVG_SLASH,
        "Shine": SVG_SHINE,
        "Street View": SVG_STREET_VIEW,
        "Flag Pennant": SVG_FLAG_PENNANT,
        "Flag Swallowtail" : SVG_FLAG_SWALLOWTAIL
    };

    const COLOR_SPECTRUM_LIST = {
        'Burg' : ['#ffc6c4','#f4a3a8','#e38191','#cc607d','#ad466c','#8b3058','#672044'],
        'BurgYl' : ['#fbe6c5','#f5ba98','#ee8a82','#dc7176','#c8586c','#9c3f5d','#70284a'],
        'RedOr' : ['#f6d2a9','#f5b78e','#f19c7c','#ea8171','#dd686c','#ca5268','#b13f64'],
        'OrYel' : ['#ecda9a','#efc47e','#f3ad6a','#f7945d','#f97b57','#f66356','#ee4d5a'],
        'Peach' : ['#fde0c5','#facba6','#f8b58b','#f59e72','#f2855d','#ef6a4c','#eb4a40'],
        'PinkYl' : ['#fef6b5','#ffdd9a','#ffc285','#ffa679','#fa8a76','#f16d7a','#e15383'],
        'Mint' : ['#e4f1e1','#b4d9cc','#89c0b6','#63a6a0','#448c8a','#287274','#0d585f'],
        'BluGrn' : ['#c4e6c3','#96d2a4','#6dbc90','#4da284','#36877a','#266b6e','#1d4f60'],
        'DarkMint' : ['#d2fbd4','#a5dbc2','#7bbcb0','#559c9e','#3a7c89','#235d72','#123f5a'],
        'Emrld' : ['#d3f2a3','#97e196','#6cc08b','#4c9b82','#217a79','#105965','#074050'],
        'BluYl' : ['#f7feae','#b7e6a5','#7ccba2','#46aea0','#089099','#00718b','#045275'],
        'Teal' : ['#d1eeea','#a8dbd9','#85c4c9','#68abb8','#4f90a6','#3b738f','#2a5674'],
        'TealGrn' : ['#b0f2bc','#89e8ac','#67dba5','#4cc8a3','#38b2a3','#2c98a0','#257d98'],
        'Purp' : ['#f3e0f7','#e4c7f1','#d1afe8','#b998dd','#9f82ce','#826dba','#63589f'],
        'PurpOr' : ['#f9ddda','#f2b9c4','#e597b9','#ce78b3','#ad5fad','#834ba0','#573b88'],
        'Sunset' : ['#f3e79b','#fac484','#f8a07e','#eb7f86','#ce6693','#a059a0','#5c53a5'],
        'Magenta' : ['#f3cbd3','#eaa9bd','#dd88ac','#ca699d','#b14d8e','#91357d','#6c2167'],
        'SunsetDark' : ['#fcde9c','#faa476','#f0746e','#e34f6f','#dc3977','#b9257a','#7c1d6f'],
        'BrwnYl' : ['#ede5cf','#e0c2a2','#d39c83','#c1766f','#a65461','#813753','#541f3f'],
        'ArmyRose' : ['#798234','#a3ad62','#d0d3a2','#fdfbe4','#f0c6c3','#df91a3','#d46780'],
        'Fall' : ['#3d5941','#778868','#b5b991','#f6edbd','#edbb8a','#de8a5a','#ca562c'],
        'Geyser' : ['#008080','#70a494','#b4c8a8','#f6edbd','#edbb8a','#de8a5a','#ca562c'],
        'Temps' : ['#009392','#39b185','#9ccb86','#e9e29c','#eeb479','#e88471','#cf597e'],
        'TealRose' : ['#009392','#72aaa1','#b1c7b3','#f1eac8','#e5b9ad','#d98994','#d0587e'],
        'Tropic' : ['#009B9E','#42B7B9','#A7D3D4','#F1F1F1','#E4C1D9','#D691C1','#C75DAB'],
        'Earth' : ['#A16928','#bd925a','#d6bd8d','#edeac2','#b5c8b8','#79a7ac','#2887a1'],
        'Antique': ['#855C75', '#D9AF6B', '#AF6458', '#736F4C', '#526A83', '#625377', '#7C7C7C'],
        'Bold': ['#7F3C8D', '#11A579', '#3969AC', '#F2B701', '#E73F74', '#80BA5A', '#A5AA99'],
        'Pastel': ['#66C5CC', '#F6CF71', '#F89C74', '#DCB0F2', '#87C55F', '#9EB9F3', '#B3B3B3'],
        'Prism': ['#5F4690', '#1D6996', '#38A6A5', '#0F8554', '#73AF48', '#EDAD08', '#666666'],
        'Safe': ['#88CCEE', '#CC6677', '#DDCC77', '#117733', '#332288', '#AA4499', '#888888'],
        'Vivid': ['#E58606', '#5D69B1', '#52BCA3', '#99C945', '#CC61B0', '#24796C', '#A5AA99']
    };

    // Earth Radius used with the Harvesine formula and approximates using a spherical (non-ellipsoid) Earth.
    const EARTH_RADIUS = 6371008.8,
        UNIT_SYSTEMS = {
            metric: EARTH_RADIUS / 1000,
            imperial: EARTH_RADIUS / 1609.344
        };

    const DEFAULT_MIN_ZOOM = 0,
        DEFAULT_MAX_ZOOM = 24; // 24 is the max zoom level allowed on map Libre

    const DEFAULT_STROKE = "#000000",
        DEFAULT_ICON = "a-Icon icon-map-layer";

    const GET_IMG = ["get", "imageId"], // MapLibre expression to get image by id
        GET_SIZE = ["get", "size"]; // MapLibre expression to get size

    const ZOOM_KEY = "zoomState",
        LNG_KEY = "lngState",
        LAT_KEY = "latState",
        BEARING_KEY = "bearingState",
        PITCH_KEY = "pitchState";

    const SOURCE_SUFFIX = "-source",
        LEG_TTL_ID_SUFFIX = "_legend_title",
        MSG_PREFIX = "APEX.MAPS.",
        LEGEND_ITEM_ID_SUFFIX = "_legend_item";

    const EVENT_MAP_INITIALIZED = "initialized",
        EVENT_MAP_CHANGED = "changed",
        EVENT_MAP_OBJ_CLICKED = "objectclick",
        EVENT_MAP_CLICK = "click",
        EVENT_CIRCLE_DRAWN = "circledrawn",
        EVENT_CIRCLE_REMOVED = "circleremoved",
        EVENT_ROTATE = "map-rotate";

    const VISIBILITY = "visibility",
        LYR_VISIBLE = "visible",
        BACKGROUND_COLOR = "--a-map-legend-selector-color",
        A_CONTENT = "content",
        A_ELEMENTS = "elements",
        A_LBLBY = "aria-labelledby",
        A_LABEL = "aria-label",
        CROSSHAIR = "crosshair",
        POINTER = "pointer"; // Cursor type

    const CIRCLE_TOOL_SRC = "circle-src",
        DIST_TOOL_SRC = "measure-points-src",
        CIRCLE_TOOL_LYR = "circle-lyr",
        DIST_POINTS_LYR = "measure-points-lyr",
        DIST_LINES_LYR = "measure-lines-lyr";

    const INVALID_LAYER_ID_MSG = "Invalid layer ID",
        INVALID_FEATURE_ID_MSG = "Invalid feature ID",
        MAP_NOT_READY_MSG = "Map initialization has not been completed";

    const ELOCATIONS_VECTOR_TILE_LAYERS = {
        "elocation-osm-bright": "https://elocation.oracle.com/appidGC000110/mapviewer/pvt/res/style/osm-bright/style.json",
        "elocation-osm-positron": "https://elocation.oracle.com/appidGC000110/mapviewer/pvt/res/style/osm-positron/style.json",
        "elocation-osm-dark-matter": "https://elocation.oracle.com/appidGC000110/mapviewer/pvt/res/style/osm-dark-matter/style.json"
    };

    // All raster tile layers will be referenced using this obj
    const ELOCATIONS_RASTER_TILE_LAYERS = {
        "version": 8,
        "id"     : "elocation-osm-raster-tiles",
        "name"   : "OSM Bright (Oracle)",
        "metadata" : {
            "sgtech:version": "19.1.0",
            "sgtech:sources:type": "raster"
        },
        "sources": {
            "elocation-osm-bright": {
                "type": "raster",
                "name": "OSM Bright (Oracle)",
                "attribution": "",
                "tiles": [
                    "https://elocation.oracle.com/appidGC000110/mapviewer/mcserver/ELOCATION_MERCATOR/osm_bright/{z}/{y}/{x}.png"
                ],
                "tileSize": 256
            },
            "elocation-osm-positron": {
                "type": "raster",
                "name": "OSM Positron (Oracle)",
                "attribution": "",
                "tiles": [
                    "https://elocation.oracle.com/appidGC000110/mapviewer/mcserver/ELOCATION_MERCATOR/osm_positron/{z}/{y}/{x}.png"
                ],
                "tileSize": 256
            },
            "elocation-bi-world-map": {
                "type": "raster",
                "name": "Bi World Map (Oracle)",
                "attribution": "",
                "tiles": [
                    "https://elocation.oracle.com/appidGC000110/mapviewer/mcserver/ELOCATION_MERCATOR/bi_world_map_mb/{z}/{y}/{x}.png"
                ],
                "tileSize": 256
            },
            "elocation-osm-dark-matter": {
                "type": "raster",
                "name": "OSM Dark Matter (Oracle)",
                "attribution": "",
                "tiles": [
                    "https://elocation.oracle.com/appidGC000110/mapviewer/mcserver/ELOCATION_MERCATOR/osm_darkmatter/{z}/{y}/{x}.png"
                ],
                "tileSize": 256
            },
            "elocation-world-map": {
                "type": "raster",
                "name": "World Map (Oracle)",
                "attribution": "",
                "tiles": [
                    "https://elocation.oracle.com/appidGC000110/mapviewer/mcserver/ELOCATION_MERCATOR/world_map_mb/{z}/{y}/{x}.png"
                ],
                "tileSize": 256
            }
        },
        "layers": [ {
            "id": "elocation-osm-bright-layer",
            "type": "raster",
            "source": "elocation-osm-bright",
            "minzoom": 0,
            "maxzoom": 18.01
        } ]
    };

    function CircleTool( { scopedActions } ) {
        CircleTool.numInstances = ( CircleTool.numInstances || 0 ) + 1;

        const ACTIVATE_ACTION = "activate-circle",
              C_CLEAR_ACTION = "clear-circle";

        this.onAdd = map => {
            this.container = document.createElement("div");
            this.container.className = C_MAPLIBRE_CTRL;
            this.canvas = map.getCanvasContainer();
            this.startPos = {};
            this.center = [];
            this.radius = null;
            this.geoJSONCircle = null;
            this.isDrawing = false;
            this.isActive = false;
            this.isKeyboard = false; // Whether tool is used through keyboard or not
            this.clearBtn$ = null;
            this.startBtn$ = null;

            const IS_ACTIVE_CLASS = "is-active";

            this.addControls = () => {
                let self = this,
                    clearBtnId = "clear_cir_btn_" + CircleTool.numInstances,
                    startBtnId = "start_cir_btn_" + CircleTool.numInstances;

                self.clearBtn$ = createControlBtn( getMessage( "CLEAR_CIRCLE" ), "icon-ban", clearBtnId, false );
                self.startBtn$ = createControlBtn( getMessage( "DRAW_CIRCLE" ), "icon-draw-circle", startBtnId );

                self.clearBtn$.attr("disabled", true);

                self.startBtn$.on( 'click', function() {
                    self.isActive = !self.isActive;

                    if ( self.isActive ) {
                        self.addListeners();

                        self.removeCircleLayer();

                        self.clearBtn$.attr( "disabled", true );

                        // Update button icon color to indicate circle tool is active
                        $( this )
                            .addClass( IS_ACTIVE_CLASS )
                            .attr( "aria-pressed", true );
                    } else {
                        self.clear( true );
                    }
                 } );

                 self.clearBtn$.on( 'click', function() {
                     self.clear( true );
                 } );

                 $( self.container ).append( self.startBtn$ );
                 $( self.container ).append( self.clearBtn$ );
            };
            this.addActions = () => {
                scopedActions.add([{
                        name: ACTIVATE_ACTION,
                        shortcut: "C",
                        action: () => {
                            if ( !this.isActive ) {
                                this.startBtn$.trigger( "click" );
                                // Set initial postition of circle
                                this.begin();
                                this.drawShape();
                            }
                        }
                    },
                    {
                        name: C_CLEAR_ACTION,
                        shortcut: "D",
                        action: () => {
                            this.clearBtn$.trigger( "click" );
                        }
                    }
                ]);
            };
            this.begin = e => {
                // Get start position from mouse when click event is triggered
                if ( e ) {
                    this.isKeyboard = false;
                    // Capture the first xy coordinates
                    this.startPos = mousePosToPoint( e.originalEvent, this.canvas );
                } else { // When keyboard is used, set start and end position at the center of canvas
                    let lCanvas$ = $( map.getCanvas() );

                    this.isKeyboard = true;
                    this.radius = 30;
                    this.startPos = {
                        x: lCanvas$.width() / 2,
                        y: lCanvas$.height() / 2
                    };
                }
                // Disable default drag zooming.
                map.dragPan.disable();

                this.center = [ this.startPos.x, this.startPos.y ];

                this.isDrawing = true;
            };
            this.createGeoJSONCircle = () => {
                let lLngRight, lLngLeft, lLeftSign, lRightSign, lCircleSize,
                    lCenter = { // Center of circle (pixels)
                        y: this.center[1],
                        x: this.center[0]
                    },
                    lCoords = [];

                // Get position for 360 angles ( circle )
                for( let ang = 0; ang < 359; ang++ ) {
                    let x, y, latlng;

                    if ( ang === 0 ) {
                        x = 0;
                        y = this.radius;
                    } else if ( ang === 90 ) {
                        x = this.radius;
                        y = 0;
                        lLngRight = map.unproject( [ x + lCenter.x, y + lCenter.y ] ).lng;
                        lRightSign = Math.sign( lLngRight );
                    } else if ( ang === 270 ) {
                        x = this.radius * ( - 1 );
                        y = 0;
                        lLngLeft = map.unproject( [ x + lCenter.x, y + lCenter.y ] ).lng;
                        lLeftSign = Math.sign( lLngLeft );
                    } else {
                        let radians = ang * ( Math.PI/180 );

                        x = this.radius * Math.sin( radians );
                        y = x / Math.tan( radians );
                     }

                     latlng = map.unproject( [ x + lCenter.x, y + lCenter.y ] ); // Convert pixel position (x, y) to lat an lng coords

                     lCoords.push( [ latlng.lng, latlng.lat ] );
                }
                // Close circle
                lCoords.push( lCoords[0] );

                // Get circle size based on left and right lng
                if ( lLeftSign >= 0 && lRightSign >= 0 ) { // Both positives
                    lCircleSize = lLngRight - lLngLeft;
                } else if ( lLeftSign === -1 && lRightSign === -1 ) { // Both negatives
                    lCircleSize = Math.abs( lLngLeft ) + lLngRight;
                } else if ( lLeftSign === -1 && lRightSign >= 0 ) { //  Negative and positive
                    lCircleSize = Math.abs( lLngLeft ) + lLngRight;
                }

                // If size exceeds 360 degrees stop drawing circle
                if ( lCircleSize >= 360 ) {
                    this.isDrawing = false;
                }

                this.geoJSONCircle = {
                    'type': 'geojson',
                    'data': {
                        'type': 'Feature',
                        'geometry': {
                            'type': 'Polygon',
                            'coordinates': [ lCoords ]
                        }
                    }
                };

                return this.geoJSONCircle;
            };
            this.drawShape = (e) => {
                // Capture the ongoing xy coordinates and draw circle.
                if ( this.isDrawing ) {
                    if ( !this.isKeyboard ) {
                        let lCurrentPos = mousePosToPoint( e.originalEvent, this.canvas ),
                            lMinX = Math.min( this.startPos.x, lCurrentPos.x ),
                            lMaxX = Math.max( this.startPos.x, lCurrentPos.x ),
                            lMinY = Math.min( this.startPos.y, lCurrentPos.y ),
                            lMaxY = Math.max( this.startPos.y, lCurrentPos.y ),
                            lWidth = ( lMaxX - lMinX ),
                            lHeight = ( lMaxY - lMinY );

                        this.radius = Math.sqrt( Math.pow( lWidth, 2 ) + Math.pow( lHeight, 2 ) );
                    }

                    // Only add source if it does not exist
                    if ( !map.getSource( CIRCLE_TOOL_SRC ) ) {
                        map.addSource( CIRCLE_TOOL_SRC, this.createGeoJSONCircle() );
                    } else {
                        // Update source data
                        map.getSource( CIRCLE_TOOL_SRC ).setData( this.createGeoJSONCircle().data );
                    }

                    // Only add layer if it does not exist
                    if ( !map.getLayer( CIRCLE_TOOL_LYR ) ) {
                        map.addLayer( {
                            'id': CIRCLE_TOOL_LYR,
                            'type': 'fill',
                            'source': CIRCLE_TOOL_SRC,
                            'layout': {},
                            'paint': {
                                'fill-color': '#3887c8',
                                'fill-opacity': 0.3,
                                'fill-outline-color': '#014c8a'
                            }
                        } );
                    }
                }
            };

            // Fix bug 32999325
            this.keysHandler = e => {
                if ( this.isActive ) {
                    if ( e.key === "Escape" ) {
                        this.clear( true );
                    } else if ( e.key === 'Enter' ) {
                        if ( e.ctrlKey ) {
                            // Set initial postition of circle
                            this.begin();
                            // Avoid submit page
                            e.preventDefault();
                        } else if ( this.isKeyboard ) {
                            this.isKeyboard = false;

                            this.finish();
                            // Avoid submit page
                            e.preventDefault();
                        }
                    }

                    // Update circle
                    if ( this.isKeyboard ) {
                        let lLeftEdge, lRightEdge, lBottomEdge, lTopEdge,
                            lStartPos = { ...this.startPos }, // Clone start pos to validate its new value
                            lRadius = this.radius,
                            lCanvas$ = $( map.getCanvas() ),
                            lMapWidth = lCanvas$.width(),
                            lMapHeight = lCanvas$.height();

                        if ( e.key === 'ArrowUp' ) {
                            if ( e.shiftKey ) {
                                lRadius += 3;
                            } else {
                                lStartPos.y -= 3;
                            }
                        } else if ( e.key === 'ArrowLeft' ) {
                            lStartPos.x -= 3;
                        } else if ( e.key === 'ArrowDown' ) {
                            if ( e.shiftKey ) {
                                lRadius -= 3;
                            } else {
                                lStartPos.y += 3;
                            }
                        } else if ( e.key === 'ArrowRight' ) {
                            lStartPos.x += 3;
                        }

                        lLeftEdge = lStartPos.x - lRadius;
                        lRightEdge = lStartPos.x + lRadius;
                        lBottomEdge = lStartPos.y - lRadius;
                        lTopEdge = lStartPos.y + lRadius;

                        // Stop drawing circle if it exceeds canvas boundaries
                        if ( lLeftEdge > 0 && lRightEdge < lMapWidth &&
                             lBottomEdge > 0 && lTopEdge < lMapHeight &&
                             lRadius >= 10 ) {

                            // Update position values
                            this.startPos = { ...lStartPos };
                            this.radius = lRadius;
                            this.center = [ this.startPos.x, this.startPos.y ];

                            // Draw circle with new position values
                            this.drawShape();
                        }

                        e.preventDefault();
                    }
                }
            };
            this.fixPosition = () => {
                if ( this.isActive && this.isKeyboard ) {
                    let lCanvas$ = $( map.getCanvas() ),
                        lMapWidth = lCanvas$.width(),
                        lMapHeight = lCanvas$.height();

                    // If circle is positioned outside canvas right boundary
                    // we have to update circle "x" position to make it visible
                    if ( ( this.startPos.x + this.radius ) > lMapWidth ) {
                        this.startPos.x = lMapWidth - this.radius;
                    } else if ( ( this.startPos.y + this.radius ) > lMapHeight ) { // If circle is positioned outside canvas bottom boundary
                                                                               // we have to update circle "y" position to make it visible
                        this.startPos.y = lMapHeight - this.radius;
                    }

                    this.center = [ this.startPos.x, this.startPos.y ];

                    this.drawShape();
                }
            };
            this.addListeners = () => {
                map.on( 'mousedown', this.begin );
                map.on( 'mousemove', this.drawShape );
                // mouseup event most be trigger even if cursor is outside map
                // otherwise tool won't be deactivated if cursor is outside map
                $( document ).on( 'mouseup', this.finish );
                $( document ).on( 'keydown', this.keysHandler );
                // Disable default map dragging
                map.dragPan.disable();
                map.keyboard.disable();
            };
            this.removeListeners = () => {
                map.off( 'mousedown', this.begin );
                map.off( 'mousemove', this.drawShape );
                $( document ).off( 'mouseup', this.finish );
                $( document ).off( 'keydown', this.keysHandler );
            };
            this.finish = () => {
                if ( !this.isKeyboard && this.geoJSONCircle ) {

                    this.clear( false );

                    // Fire event
                    $( this.container ).trigger( EVENT_CIRCLE_DRAWN, this.geoJSONCircle );
                }
            };
            this.removeCircleLayer = () => {
                this.geoJSONCircle = null;
                this.isKeyboard = false;

                // If "circle-layer" layer exist remove it
                if ( map.getLayer( CIRCLE_TOOL_LYR ) ) {
                    map.removeLayer( CIRCLE_TOOL_LYR ).removeSource( CIRCLE_TOOL_SRC );
                }

                $( this.container ).trigger( EVENT_CIRCLE_REMOVED, this.geoJSONCircle );
            };

            this.clear = pRemoveCircle => {

                map.dragPan.enable();
                map.keyboard.enable();

                this.removeListeners();

                if ( pRemoveCircle ) {
                    this.removeCircleLayer();
                }

                // Disable clear button and
                // update button icon color to indicate circle tool is unactive
                this.clearBtn$.attr( "disabled", pRemoveCircle );

                this.startBtn$
                    .removeClass( IS_ACTIVE_CLASS )
                    .attr( "aria-pressed", false )
                    .trigger( "focus" );

                this.isActive = false;
                this.isDrawing = false;
            };

            this.addControls();
            this.addActions();

            return this.container;
        };

        this.onRemove = () => {
            this.container.parentNode.removeChild(this.container);

            scopedActions.remove( C_CLEAR_ACTION );
            scopedActions.remove( ACTIVATE_ACTION );
        };
    }

    function RectangleZoomTool({ scopedActions }) {
        RectangleZoomTool.numInstances = ( RectangleZoomTool.numInstances || 0 ) + 1;

        const ACTIVATE_ACTION = "activate-rectangle";

        this.onAdd = map => {
            this.container = document.createElement("div");
            this.container.className = C_MAPLIBRE_CTRL;
            this.isActive = false; // Whether tool is active or not
            this.isDrawing = false;
            this.isKeyboard = false; // Whether tool is used through keyboard or not
            this.box = null; // Rectangle drawn
            this.startPos = {}; // Start pixels position of rectangle
            this.endPos = {}; // End pixels position of rectangle
            this.startLatLng = null; // Start coords
            this.button$ = null;
            this.canvasCont = map.getCanvasContainer();

            this.addControls = () => {
                let self = this,
                    buttonId = "start_rect_btn_" + RectangleZoomTool.numInstances;

                this.button$ = createControlBtn( getMessage( "RECTANGLE_ZOOM" ), "icon-zoom-draw", buttonId );

                this.button$.on( 'click', function() {
                    self.isActive = !self.isActive;

                    if ( self.isActive ) {

                        self.addListeners();

                        map.getCanvas().style.cursor = CROSSHAIR;

                        // Update button icon color to indicate rectangle zoom tool is active
                        $( this )
                            .addClass("is-active")
                            .attr( "aria-pressed", true );

                    } else {
                        self.deactivate();
                    }
                } );

                $( self.container ).append( this.button$ );
            };
            this.addAction = () => {
                scopedActions.add( {
                        name: ACTIVATE_ACTION,
                        shortcut: "R",
                        action: () => {
                            if ( !this.isActive ) {
                                this.button$.trigger( "click" );
                                // Set initial postition of rectangle box
                                this.begin();
                                // Draw rectangle box with init position values
                                this.drawRectangle();
                            }
                        }
                } );
            };
            this.begin = event => {
                // Get start position from mouse when click event is triggered
                if ( event ) {
                    const { lngLat, originalEvent } = event;

                    this.isKeyboard = false;
                    this.startLatLng = lngLat;
                    this.startPos = mousePosToPoint( originalEvent, this.canvasCont ); // Capture the first xy coordinates for rectangle element
                } else { // When keyboard is used, set start and end position at the center of canvas
                    let lCanvas$ = $( map.getCanvas() ),
                        x = lCanvas$.width() / 2,
                        y = lCanvas$.height() / 2;

                    this.isKeyboard = true;

                    // Rectangle will have an initial size of 20 by 20 pixels
                    this.startPos = {
                        x: x - 20,
                        y: y - 20
                    };
                    this.endPos = {
                        x: x + 20,
                        y: y + 20
                    };
                    this.startLatLng = map.unproject( [ this.startPos.x, this.startPos.y ] );
                }
                // Start of area selection for rectangle zoom
                this.isDrawing = true;
                // Disable default drag zooming.
                map.dragPan.disable();

            };
            this.drawRectangle = e => {
                let lCursor = map.getCanvas().style.cursor;

                // If other tool cleared cursor then set cursor to 'crosshair'
                if( lCursor !== CROSSHAIR ) {
                    map.getCanvas().style.cursor = CROSSHAIR;
                }

                if ( this.isDrawing ) {
                    let lMinX, lMaxX, lMinY, lMaxY, lPos;

                    if ( !this.isKeyboard ) {
                        this.endPos = mousePosToPoint( e.originalEvent, this.canvasCont ); // Capture the ongoing xy coordinates
                    }

                    // Append the box element if it doesn't exist
                    if ( !this.box ) {
                        this.box = document.createElement("div");
                        this.box.className = "a-MapRegion-zoomOverlay";

                        this.canvasCont.appendChild( this.box );
                    }

                    lMinX = Math.min( this.startPos.x, this.endPos.x );
                    lMaxX = Math.max( this.startPos.x, this.endPos.x );
                    lMinY = Math.min( this.startPos.y, this.endPos.y );
                    lMaxY = Math.max( this.startPos.y, this.endPos.y );

                    // Adjust width and xy position of the box element ongoing
                    lPos = "translate(" + lMinX + "px," + lMinY + "px)";

                    this.box.style.transform = lPos;
                    this.box.style.WebkitTransform = lPos;
                    this.box.style.width = lMaxX - lMinX + "px";
                    this.box.style.height = lMaxY - lMinY + "px";
                }
            };
            this.finish = e => {
                let lEndLatLng = {};

                if ( this.isKeyboard ) {
                    lEndLatLng = map.unproject( [ this.endPos.x, this.endPos.y ] );
                    this.startLatLng = map.unproject( [ this.startPos.x, this.startPos.y ] );
                } else {
                    lEndLatLng = e.lngLat;
                }

                // Fit bounds only if cursor change its position
                if ( this.startLatLng.lat.toFixed(2) !== lEndLatLng.lat.toFixed(2) &&
                     this.startLatLng.lng.toFixed(2) !== lEndLatLng.lng.toFixed(2) ) {

                    let lCoordinates = [
                            [ this.startLatLng.lng, this.startLatLng.lat ],
                            [ lEndLatLng.lng, lEndLatLng.lat ]
                        ],
                       /* Pass the first coordinates in the LineString to `lngLatBounds` &
                        * wrap each coordinate pair in `extend` to include them in the bounds
                        * result. A variation of this technique could be applied to zooming
                        * to the bounds of multiple Points or Polygon geomteries - it just
                        * requires wrapping all the coordinates with the extend method.
                        */
                        lBounds = lCoordinates.reduce( function( bounds, coord ) {
                            return bounds.extend( coord );
                        }, new maplibregl.LngLatBounds( lCoordinates[0], lCoordinates[0] ) );

                    // Go to middle point in the map
                    map.fitBounds( lBounds, {
                        padding: 20,
                        pitch: map.getPitch(),
                        bearing: map.getBearing()
                    } );
                }

                this.deactivate();
            };
            this.deactivate = () => {
                this.removeListeners();

                map.getCanvas().style.cursor = '';

                this.isDrawing = false;
                this.isActive = false;
                this.isKeyboard = false;

                if ( this.box ) {
                    this.box.parentNode.removeChild(this.box);
                    this.box = null;
                }

                // Update button icon color to indicate circle tool is unactive
                this.button$
                    .removeClass("is-active")
                    .attr( "aria-pressed", false );
            };
            this.keysHandler = e => {
                if ( this.isActive ) {
                    if ( e.key === "Escape" ) {
                        this.deactivate();
                    } else if ( e.key === 'Enter' ) {
                        if ( e.ctrlKey ) {
                            // Set initial postition of rectangle box
                            this.begin();
                            // Draw rectangle box with init position values
                            this.drawRectangle();
                            // Avoid submit page
                            e.preventDefault();
                        } else if ( this.isKeyboard ) {
                            this.finish();
                            // Avoid submit page
                            e.preventDefault();
                        }
                    }
                    // Update rectangle box
                    if ( this.isKeyboard ) {
                        let lStartPos = { ...this.startPos },
                            lEndPos = { ...this.endPos },
                            lCanvas$ = $( map.getCanvas() ),
                            lMapWidth = lCanvas$.width(),
                            lMapHeight = lCanvas$.height();

                        if ( e.key === 'ArrowUp' ) {
                            lStartPos.y -= 3; // Is shift key is pressed only 'y' axis from start position will change to update rectangle box size

                            if ( !e.shiftKey ) { // Is shift key is not pressed 'y' axis from start and end position will be updated, this way rectangle box will 'move'
                                lEndPos.y -= 3;
                            }
                        } else if ( e.key === 'ArrowLeft' ) {
                            lEndPos.x -= 3;

                            if ( !e.shiftKey ) {
                                lStartPos.x -= 3;
                            }
                        } else if ( e.key === 'ArrowDown' ) {
                            lStartPos.y += 3;

                            if ( !e.shiftKey ) {
                                lEndPos.y += 3;
                            }
                        } else if ( e.key === 'ArrowRight' ) {
                            lEndPos.x += 3;

                            if ( !e.shiftKey ) {
                                lStartPos.x += 3;
                            }
                        }

                        // Stop drawing rectangle if it exceeds canvas boundaries
                        if ( lStartPos.x > 0 && lStartPos.x < lMapWidth &&
                             lStartPos.y > 0 && lStartPos.y < lMapHeight &&
                             lEndPos.x > 0 && lEndPos.x < lMapWidth &&
                             lEndPos.y > 0 && lEndPos.y < lMapHeight ) {

                            // Update position values
                            this.startPos = { ...lStartPos };
                            this.endPos = { ...lEndPos };

                            // Draw rectangle box with new position values
                            this.drawRectangle();
                        }

                        e.preventDefault();
                    }
                }
            };
            this.fixPosition = () => {
                if ( this.isActive ) {
                    let lCanvas$ = $( map.getCanvas() ),
                        lMapWidth = lCanvas$.width(),
                        lMapHeight = lCanvas$.height(),
                        lStartPos = { ...this.startPos },
                        lEndPos = { ...this.endPos };

                    // If rectangle is positioned outside canvas right boundary
                    // we have to update rectangle "x" position to make it visible
                    if ( lStartPos.x > lMapWidth ||
                         this.endPos.x > lMapWidth ) {

                        this.endPos.x = lMapWidth;
                        this.startPos.x = lMapWidth;

                        if ( lStartPos.x > lEndPos.x ) {
                            this.endPos.x -= ( lStartPos.x - lEndPos.x );
                        } else {
                            this.startPos.x -= ( lEndPos.x - lStartPos.x  );
                        }
                    } else if ( lStartPos.y > lMapHeight ||
                                this.endPos.y > lMapHeight ) { // If rectangle is positioned outside canvas bottom boundary
                                                               // we have to update rectangle "y" position to make it visible

                        this.startPos.y = lMapHeight;
                        this.endPos.y = lMapHeight;

                        if ( lStartPos.y > lEndPos.y ) {
                            this.endPos.y -= ( lStartPos.y - lEndPos.y );
                        } else {
                            this.startPos.y -= ( lEndPos.y - lStartPos.y );
                        }
                    }

                    // Draw rectangle box with new position values
                    this.drawRectangle();
                }
            };
            this.addListeners = () => {
                map.on( 'mousedown', this.begin );
                map.on( 'mousemove', this.drawRectangle );
                map.on( 'mouseup', this.finish );
                $( document ).on( 'keydown', this.keysHandler );
                // Disable default map dragging
                map.dragPan.disable();
                map.keyboard.disable();
            };
            this.removeListeners = () => {
                // Remove event listeners
                map.off( 'mousedown', this.begin );
                map.off( 'mousemove', this.drawRectangle );
                map.off( 'mouseup', this.finish );
                $( document ).off( 'keydown', this.keysHandler );

                // Enable default map dragging
                map.dragPan.enable();
                map.keyboard.enable();
            };

            this.addControls();
            this.addAction();

            return this.container;
        };

        this.onRemove = () => {
            this.container.parentNode.removeChild( this.container );

            scopedActions.remove( ACTIVATE_ACTION );
        };
    }

    function DistanceTool( opts ) {
        DistanceTool.numInstances = ( DistanceTool.numInstances || 0 ) + 1;

        this.tileLayer = opts.tileLayer;
        this.unitSystem = opts.unitSystem;

        this.onAdd = map => {
            this.map = map;
            this.container = document.createElement("div");
            this.container.className = C_MAPLIBRE_CTRL;
            this.isActive = false;
            this.measureFeatures = [];
            this.mapContainerId = $( this.map.getContainer() ).attr("id");
            this.distanceContainer$ = null;
            this.distanceRad = null; // distance in radians
            this.button$ = null;

            this.addControls = () => {
                let self = this,
                    lButtonId = "start_dist_btn_" + DistanceTool.numInstances;

                this.button$ = createControlBtn( getMessage( "DISTANCE_TOOL" ), "icon-ruler", lButtonId );

                this.button$.on( 'click', function() {
                    self.isActive = !self.isActive;

                    if ( self.isActive ) {
                        self.map.getCanvas().style.cursor = CROSSHAIR;

                        // Update button icon color to indicate tool is active
                        $( this )
                            .addClass( "is-active" )
                            .attr( "aria-pressed", true );

                        self.addLayers();

                        self.addDistanceContainer();

                        self.addEventListeners();
                    } else {
                        self.deactivate();
                    }
                } );

                $( self.container ).append( this.button$ );
            };
            this.watchCursor = (e) => {
                let features = this.map.queryRenderedFeatures( e.point, {
                    layers: [ DIST_POINTS_LYR ]
                } );
                // UI indicator for clicking/hovering a point on the map
                this.map.getCanvas().style.cursor = features.length
                    ? POINTER
                    : CROSSHAIR;
            };
            this.setUnit = pUnit => {
                this.unitSystem = pUnit;
                this.updateContainer();
            };
            this.updateDistance = (e) => {
                // Used to draw a line between points
                let lLinestring = {
                    'type': 'Feature',
                    'geometry': {
                        'type': 'LineString',
                        'coordinates': []
                    }
                },
                lFeatures = this.map.queryRenderedFeatures( e.point, {
                    layers: [ DIST_POINTS_LYR ]
                } );

                // Remove the linestring from the group
                // So we can redraw it based on the points collection
                if (this.measureFeatures.length > 1) {
                    this.measureFeatures.pop();
                }

                // If a feature was clicked, remove it from the map
                if ( lFeatures.length ) {
                    let id = lFeatures[0].properties.id;
                    this.measureFeatures = this.measureFeatures.filter( function( point ) {
                        return point.properties.id !== id;
                    } );
                } else {
                    let lPoint = {
                        'type': 'Feature',
                        'geometry': {
                            'type': 'Point',
                            'coordinates': [e.lngLat.lng, e.lngLat.lat]
                        },
                        'properties': {
                            'id': String( Math.random() ) // Needed to remove points
                        }
                    };

                    this.measureFeatures.push( lPoint );
                }

                if ( this.measureFeatures.length > 1) {
                    lLinestring.geometry.coordinates = this.measureFeatures.map( point => {
                        return point.geometry.coordinates;
                    } );

                    this.measureFeatures.push( lLinestring );

                    // get total distance in radians
                    this.distanceRad = this.getTotalDistance( lLinestring );

                    this.updateContainer();
                } else {
                    // Clear the Distance container
                    this.distanceContainer$.html("");
                    this.distanceRad = null;
                }

                // Update layer source data
                this.map.getSource( DIST_TOOL_SRC ).setData( {
                    type: 'FeatureCollection',
                    features: this.measureFeatures
                } );
            };
            this.updateContainer = () => {
                if ( this.distanceRad ) {
                    let lValue = document.createElement("span"),
                        lMiles = getMessage( "MILES" ),
                        lKilometers = getMessage( "KM" );

                    // Clear the Distance container to populate it with a new value
                    this.distanceContainer$ .html("");

                    lValue.textContent = getMessage( "TOTAL_DISTANCE" ) +
                        ": " +
                        this.radiansToUnits( this.distanceRad, this.unitSystem ).toLocaleString() +
                        " " +
                        ( this.unitSystem === "imperial" ? lMiles : lKilometers );

                    this.distanceContainer$.append( lValue );
                }
            };
            this.addLayers = () => {
                let lTileLayer = ( isDarkMode() ? this.tileLayer.darkmodeName : this.tileLayer.name ),
                    lLayerColor = lTileLayer === DARK_MATTER_TILE_LAYER ? "#f0f0f0" : "#000"; // Use bright color for dark title layer

                // Init measure features array
                this.measureFeatures = [];

                this.map.addSource( DIST_TOOL_SRC, {
                    'type': 'geojson',
                    'data': {
                         type: 'FeatureCollection',
                         features: this.measureFeatures
                    }
                } );
                // Add styles to the map
                this.map.addLayer( {
                    id: DIST_POINTS_LYR,
                    type: 'circle',
                    source: DIST_TOOL_SRC,
                    paint: {
                        'circle-radius': 5,
                        'circle-color': lLayerColor
                    },
                    filter: ['in', '$type', 'Point']
                } );
                this.map.addLayer( {
                    id: DIST_LINES_LYR,
                    type: 'line',
                    source: DIST_TOOL_SRC,
                    layout: {
                        'line-cap': 'round',
                        'line-join': 'round'
                    },
                    paint: {
                        'line-color': lLayerColor,
                        'line-width': 2
                    },
                    filter: ['in', '$type', 'LineString']
                } );
            };
            // Get distance in radians between multiple points
            this.getTotalDistance = pGeojson => {
                let lDistance = 0,
                    lCoords = pGeojson.geometry.coordinates,
                    lPrevCoord = lCoords[0];

                // Iterate all coordinates points
                for ( let i = 1; i < lCoords.length; i++ ) {
                    // Get distance between 2 vertex line segments
                    lDistance += this.getSegmentDistance( lPrevCoord, lCoords[i] );
                    lPrevCoord = lCoords[i];
                }

                return lDistance;
            };
            /**
             * Calculates the distance in radians between two points. This uses the
             * Haversine formula ( http://en.wikipedia.org/wiki/Haversine_formula )
             * to account for global curvature.
             */
            this.getSegmentDistance = ( pFrom, pTo ) => {
                let lDistLat = this.degreesToRad( pTo[1] - pFrom[1] ),
                    lDistLng = this.degreesToRad( pTo[0] - pFrom[0] ),
                    lLat1 = this.degreesToRad( pFrom[1] ),
                    lLat2 = this.degreesToRad( pTo[1] ),
                    lHav = Math.pow( Math.sin( lDistLat / 2 ), 2 ) +
                        Math.pow( Math.sin( lDistLng / 2 ), 2 ) *
                        Math.cos( lLat1 ) *
                        Math.cos( lLat2 ),
                    lDistance = 2 * Math.atan2( Math.sqrt( lHav ), Math.sqrt( 1 - lHav ) );

                return lDistance;
            };
            this.degreesToRad = pDegrees => {
                return ( pDegrees % 360 ) * Math.PI / 180;
            };
          /**
            * Convert distance measurement from radians to units
            * ( metric or imperial )
            */
            this.radiansToUnits = ( pRadians, pUnit ) => {
                let lUnitVal;

                if ( pUnit && !isString( pUnit ) ) {
                    debug.warn("Unit system must be a string");
                }

                lUnitVal = UNIT_SYSTEMS[ pUnit || "metric" ];

                if ( !lUnitVal ) {
                    debug.error( pUnit + " unit system is invalid");
                }

                return pRadians * lUnitVal;
            };
            this.removeLayers = () => {
                // Clean all messure features
                this.measureFeatures = [];
                // Remove distance layers and data source
                this.map.removeLayer( DIST_POINTS_LYR );
                this.map.removeLayer( DIST_LINES_LYR );
                this.map.removeSource( DIST_TOOL_SRC );
            };
            this.addDistanceContainer = () => {
                let lMapContainer$ = $( "#" + util.escapeCSS( this.mapContainerId ) );
                // Add container if it does not exist
                if ( lMapContainer$.find( "." + C_DISTANCE_CONTAINER ).length < 1 ) {
                    let lTileLayer = ( isDarkMode() ? this.tileLayer.darkmodeName : this.tileLayer.name );

                    // Create distance container
                    this.distanceContainer$ = $( "<div class='"+ C_DISTANCE_CONTAINER +"'></div>" );

                    // Add distance container
                    lMapContainer$.append( this.distanceContainer$ );

                    // When map uses dark matter tile layer
                    // Distance container will have a bright color to be visible
                    if ( lTileLayer === DARK_MATTER_TILE_LAYER ) {
                        this.distanceContainer$
                            .removeClass( "a-MapRegion-distance--dark" )
                            .addClass( "a-MapRegion-distance--light" );
                    } else {
                        this.distanceContainer$
                             .removeClass( "a-MapRegion-distance--light" )
                             .addClass( "a-MapRegion-distance--dark" );
                    }
                }
            };
            this.removeDistanceContainer = () => {
                // Remove  distance value container
                this.distanceContainer$.remove();
            };
            this.addEventListeners = () => {
                this.map.on( 'click', this.updateDistance );
                this.map.on( 'mousemove', this.watchCursor );
            };
            this.removeEventListeners = () => {
                // Remove event listeners
                this.map.off( 'click', this.updateDistance );
                this.map.off( 'mousemove', this.watchCursor );
            };
            this.deactivate = () => {
                this.map.getCanvas().style.cursor = "";

                // Update button icon color to indicate tool is unactive
                this.button$
                    .removeClass( "is-active" )
                    .attr( "aria-pressed", false );

                this.removeLayers();

                this.removeDistanceContainer();

                this.removeEventListeners();
            };

            this.addControls();

            return this.container;
        };

        this.onRemove = () => {
            this.container.parentNode.removeChild(this.container);
            this.map = undefined;
        };
    }

    function ToggleDimensions() {
        ToggleDimensions.numInstances = ( ToggleDimensions.numInstances || 0 ) + 1;

        this.onAdd = map => {
            this.map = map;
            this.container = document.createElement("div");
            this.container.className = C_MAPLIBRE_CTRL;
            this.isActive = true;
            this.layersIds = []; // Layers to toggle between 3D and 2D dimensions
            this.button$ = null;

            this.addControls = () => {
                let lButtonId = "toggle_dim_btn_" + ToggleDimensions.numInstances,
                    twoDMessage = getMessage( "TOGGLE_2D_MODE" ),
                    threeDMessage = getMessage( "TOGGLE_3D_MODE" );

                this.button$ = createControlBtn( twoDMessage, C_TWO_D_MODE, lButtonId, false );

                this.button$.on( 'click', () => {
                    this.isActive = !this.isActive;

                    this.button$.find("span").removeClass();

                    if ( this.isActive ) {
                        this.setExtrusionHeight( ['get', 'height'] );

                        this.button$
                            .attr({
                                "title" : twoDMessage,
                                "aria-label" : twoDMessage
                            })
                            .find("span").addClass( C_ICON + " " + C_TWO_D_MODE );
                    } else {
                        this.setExtrusionHeight( 0 );

                        this.button$
                            .attr({
                                "title" : threeDMessage,
                                "aria-label" : threeDMessage
                            })
                            .find("span").addClass( C_ICON + " icon-3d-mode" );
                    }
                } );

                $( this.container ).append( this.button$ );
            };

            this.setExtrusionHeight = pHeight => {
                this.layersIds.forEach( id => {
                    this.map.setPaintProperty( id, 'fill-extrusion-height', pHeight );
                } );
            };

            this.addLayerId = pLayerId => {
                this.layersIds.push( pLayerId );
            };

            this.getButton = () => {
                return this.button$;
            };

            this.addControls();

            return this.container;
        };

        this.onRemove = () => {
            this.container.parentNode.removeChild(this.container);
            this.map = undefined;
        };
    }

    function FontIcon( pFontFamily, pIconHeigth, pIconWidth, pFaUnicode, pColor ) {
        this.width = Math.round( pIconWidth + 5 ); // Add 5 extra pixels space, so icon can fit on canvas image
                                                   // and round size to avoid mismatch image size
        this.height = Math.round( pIconHeigth + 5 );
        this.data = new Uint8Array( this.width * this.height * 4 );
        this.fontFamily = pFontFamily;
        this.iconPixels = pIconHeigth;
        this.faUnicode = pFaUnicode;
        this.fillColor = pColor;

        // Get rendering context for the map canvas when layer is added to the map
        this.onAdd = () => {
            this.context = getCanvasContext( this.width, this.height );
        };

        this.render = () => {
            // Draw icon
            this.context.clearRect( 0, 0, this.width, this.height );
            this.context.beginPath();
            this.context.font = `${this.iconPixels}px ${this.fontFamily}`; // Icon pixels and font family (scale)
            this.context.fillStyle = this.fillColor;
            // Positioning icon in center - Icon unicode, "X" position and "Y" position
            this.context.fillText( this.faUnicode, ( this.width/2 ), ( this.height/1.18 ));
            this.context.textAlign = "center";
            this.context.fill();

            // Update this image's data with data from the canvas
            this.data = this.context.getImageData(
                0,
                0,
                this.width,
                this.height
            ).data;

            // return `true` to let the map know that the image was updated
            return true;
        };
    }

    function SvgShape( pSvgShapeJSON ) {
        const { width, height } = pSvgShapeJSON;

        this.width = Math.round( width ); // Round width and height to avoid mismatch image size
        this.height = Math.round( height );
        this.data = new Uint8Array( this.width * this.height * 4 );
        this.svgShapeJSON = pSvgShapeJSON;

        // Get rendering context for the map canvas when layer is added to the map
        this.onAdd = () => {
            this.context = getCanvasContext( this.width, this.height );
        };

        this.render = () => {
            let lSvgString = createSvgShape( this.svgShapeJSON ), // Create html svg shape - string
                lImg = new Image(), // Create an image referencing the URL
                lSvg = new Blob( [ lSvgString ], { type: 'image/svg+xml' } ), // Convert string to blob.
                lUrl = window.URL.createObjectURL( lSvg ); // Create a URL to the blob

            lImg.onload = () => {
                this.context.clearRect( 0, 0, this.width, this.height );

                this.context.drawImage( lImg, 0, 0 );
                // Revoke the URL once the image loads for cleanup.
                window.URL.revokeObjectURL( lUrl );
            };
            lImg.src = lUrl; // Set svg url to image element

            // update this image's data with data from the canvas
            this.data = this.context.getImageData(
                0,
                0,
                this.width,
                this.height
            ).data;

            // return `true` to let the map know that the image was updated
            return true;
        };
    }

    function getTransformRequestCallback( options ) {
        let layer = options.tileLayer,
            headers = layer.type === SHARED_COMPONENT_TYPE ?
                isDarkMode() ? layer.http_headers_dark : layer.http_headers : options.useVectorTileLayers ?
                    { 'x-oracle-pvtile' : 'OracleSpatial' } : null;

        if ( !isEmptyObj( headers ) ) {
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

    function getCanvasContext( pWidth, pHeight ) {
        let lCanvas = document.createElement( "canvas" );
        lCanvas.width = pWidth;
        lCanvas.height = pHeight;

        return lCanvas.getContext( "2d", { willReadFrequently: true } );
    }

    function getSvgElements( pElements ) {
        let out = util.htmlBuilder();
        // Loop all elements for svg shape
        for ( let i = 0; i < pElements.length; i++ ) {
            let lElement = pElements[i];

            out.markup( `<${lElement.type}` ); // Create element
            // Get all attrs in element
            Object.entries( lElement ).forEach( ( [ key, value ] ) => {
                if ( value && ![ "type", A_CONTENT, A_ELEMENTS ].includes( key ) ) {
                    out.attr( key, value ); // Add elements attrs
                }
            } );

            out.markup( '>' );

            // If current svg element has more elements inside, we repeat same process to get those elements
            if ( lElement.elements ) {
                out.markup( getSvgElements( lElement.elements ) );
            }

            if ( lElement.content ) {
                out.content( util.escapeHTML( lElement.content ) );
            }

            out.markup( `</${lElement.type}>` );
        }

        return out.toString();
    }

    function createSvgShape( pData ) {
        let out = util.htmlBuilder();

       /*
        * xmlns = namespace
        */
        out.markup( '<svg xmlns="http://www.w3.org/2000/svg"' );

        Object.entries( pData ).forEach( ( [ key, value ] ) => {
            if ( value && ![ "imgId", A_CONTENT, A_ELEMENTS ].includes( key ) ) {
                // Canvas svg shape instace rounds width and height to avoid mismatch image size,
                // we need to round those values here too, to they have same width and height
                let lAttrVal = ( key === "height" || key === "width" ) ? Math.round( value ) : value;
                // Add svg attrs e.g. height, width, viewbox, etc.
                out.attr( key, lAttrVal );
            }
        } );

        out.markup( '>' )
               .markup( getSvgElements( pData.elements ) );

        if ( pData.content ) {
            out.content( util.escapeHTML( pData.content ) );
        }

        out.markup( '</svg>' );

        return out.toString();
    }

    // Return the xy coordinates of the mouse position
    function mousePosToPoint( pEvent, pCanvas) {
        let lRect = pCanvas.getBoundingClientRect();

        return new maplibregl.Point(
            pEvent.clientX - lRect.left - pCanvas.clientLeft,
            pEvent.clientY - lRect.top - pCanvas.clientTop
        );
    }

    async function fetchVectorLayerData( url ) {
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

    function getClusterColor( pSerie ) {
        let lClusterColor = pSerie.clusterFeatures.color;

        // If cluster color is not found use serie color
        if ( !lClusterColor ) {
            lClusterColor = pSerie.style.color;
        }

        return lClusterColor;
    }

    function getClusterSize( pSerie ) {
        let lClusterSize = 2.5,
            lClusterFeatures = pSerie.clusterFeatures;

        if ( lClusterFeatures ) {
            // If cluster does not have any size use default
            const { clusterSvgShapeSize = 2.5 } = lClusterFeatures;

            lClusterSize = clusterSvgShapeSize;
        }

        // Cluster size limit is 10
        return lClusterSize > 0 && lClusterSize <= 10 ? lClusterSize : 2.5; // If no clusterfeatues are found use default
    }

    function getFillColor( pSerie, pFeat ) {
        let lFillColor = pSerie.style.color;

        if ( !lFillColor ) {
            lFillColor = pFeat.color;
        }

        return lFillColor;
    }

    function getDefaultColorByNum( pColorNum ) {
        return window.getComputedStyle( document.documentElement ).getPropertyValue(`--a-palette-color-${pColorNum}`);
    }

    function hasFillColor( pType, pSerie, pFeat ) {
        let lHasFillColor;

        if ( pType === "feat" ) {
            lHasFillColor = !!pSerie.style.color || !!pFeat.color;
        } else {
            lHasFillColor = !!pSerie.clusterFeatures.color;
        }
        return lHasFillColor;
    }

    function getStrokeColor( pSerie, pFeat, pUseDefault ) {
        let lStrokeColor = pSerie.style.svg.strokeColor;

        if ( !lStrokeColor ) {
            lStrokeColor = pFeat.strokeColor;
        }

        if ( !lStrokeColor && pUseDefault ) {
            lStrokeColor = DEFAULT_STROKE;
        }

        return lStrokeColor;
    }

    function isNativeShape( pShapeName ) {
        return !!NATIVE_SVG_SHAPES[ pShapeName ];
    }

    function getPointSvgShape( pSerie, pFeat ) {
        let lPointSvgShape = pSerie.style.svg.pointSvgShape;

        // If substitutions are used for shape name each feat will contain its own size
        if ( !lPointSvgShape ) {
            lPointSvgShape = pFeat.pointSvgShape ? pFeat.pointSvgShape : MARKER_ID;
        }

        return lPointSvgShape;
    }

    function getPointSize( pSerie, pFeat ) {
       let lPointSize = pSerie.style.svg.pointSvgShapeSize;

       // If substitutions are used for shape size each feat will contain its own size
       if ( !lPointSize ) {
          lPointSize = pFeat.pointSvgShapeSize ? pFeat.pointSvgShapeSize : 1;
       }

       // Shape size limit is 50
       if ( lPointSize > 50 ) {
           debug.warn( "Shape Size of ( " + lPointSize + " ) exceeds maximum." );
           lPointSize = 50;
       }

       return lPointSize > 0 ? lPointSize : 2;
    }

    function getSvgFillOpacity( pSerie ) {
        const { fillOpacity = 1 } = pSerie.style.svg;

        return fillOpacity >= 0 && fillOpacity <= 1 ? fillOpacity : 1;
    }

    function getFeatIconClasses( pSerie, pFeat ) {
        let lIconClasses = pSerie.style.icon.cssClasses;

        if ( !lIconClasses ) {
            lIconClasses = pFeat.cssClasses ? pFeat.cssClasses : DEFAULT_ICON;
        }

        return lIconClasses;
    }

    function getUnicode( pIconElmnt ) {
        let lChar = window.getComputedStyle( // Get the computed style
                pIconElmnt, ':before' // Add the ':before' to get the pseudo element.
            ).content.replace(/['"]/g, ''), // content wraps things in quotes, which we don't want.
            lCharCode = lChar.charCodeAt(0).toString(16);

        return lChar !== "none" ? String.fromCharCode( parseInt( lCharCode, 16 ) ) : null;
    }

    function getTempIcon( pIconClasses ) {
        let lDummyElmnt = document.createElement("span"); // Create a holding element

        lDummyElmnt.className = pIconClasses;
        lDummyElmnt.style.position = "absolute";
        lDummyElmnt.style.visibility = "hidden";

        // We need to append it to the body for it to have its pseudo element created
        document.body.appendChild( lDummyElmnt );

        return lDummyElmnt;
    }

   /*
    * Create an expression to set color to features points
    * based on their values ( for polygons, lines and extruded polygons )
    * or based on points density ( for heatmap )
    * MapLibre expressions defines a formula for computing the value of the property using operators
    */
    function getColorSpectrumExpression( pSerie, pSpectrumColors ) {
        const { style: { layerType } } = pSerie;

        let lColorsExpression = [],
            lColors = pSpectrumColors;

        if ( layerType === HEAT_MAP_LYR_TYPE ) {
            let lDomainUnit = 1/lColors.length; // Domain is 0 (low) to 1 (high).

           /* Begin color ramp at 0-stop with a 0-transparancy color
            * to create a blur-like effect.
            * Also areas with density 0 ( areas with no heat points around )
            * need to use this color, otherwise maplibre would cover this areas
            * with first color from color spectrum.
            */
            lColorsExpression = [
                'interpolate',
                ['linear'],
                ['heatmap-density'],
                0, 'rgba(33,102,172,0)'
            ];

            for ( let i = 0; i < lColors.length; i++ ) {
                lColorsExpression.push( lDomainUnit * ( i + 1 ) ); // Domain
                lColorsExpression.push( lColors[i] );
            }

        } else if ( layerType === POLYGONS_LYR_TYPE || layerType === EXTRUDED_LYR_TYPE ) {
            let lIncrement = getIncrement( pSerie.valueColumn, lColors.length );

            lColorsExpression = [
                'interpolate',
                ['linear'],
                ['get', 'value']
            ];

            if ( lIncrement !== 0 ) {
                for ( let i = 0; i < lColors.length; i++ ) {
                    let featVal = pSerie.valueColumn.min + ( lIncrement * ( i + 1 ) );
                    lColorsExpression.push( featVal );
                    lColorsExpression.push( lColors[i] );
                }
            } else {
                // If all features have the same value set the first
                // color from color spectrum as the default.
                lColorsExpression = lColors[0];
            }
        }
        return lColorsExpression;
    }

    function getColorSpectrumArray( pSerie ) {
        let lColorSpectrumArray = [];

        const { colorSpectrum, colorSpectrumName } = pSerie.style;

        if ( colorSpectrum ) {  // Custom color spectrum list
            let colors = colorSpectrum.replace(/\s/g, "");

            colors.replace(/(#[0-9A-Fa-f]{6})|(#[0-9A-Fa-f]{3})|(rgb\(\d+,\d+,\d+\))/g, function(m, hex, hexShort, rgb) {
                lColorSpectrumArray.push(hex||hexShort||rgb);
                return "";
            } );
        } else { // Color spectrum selected
            lColorSpectrumArray = COLOR_SPECTRUM_LIST[ colorSpectrumName ];
        }

        return lColorSpectrumArray;
    }

    function getIncrement( pValueColumn, pDivider ) {
        let lMin = pValueColumn.min,
            lMax = pValueColumn.max,
            lMinSign = Math.sign( lMin ),
            lMaxSign = Math.sign( lMax ),
            lIncrement = 0; // If min and max value are the same this means that all features will contain the same value.
                            // Increment will be zero, so features weight and radius will have a static value

         if ( lMin !== lMax ) {
             if ( lMinSign >= 0 && lMaxSign >= 0 ) { // Both positives
                 lIncrement = ( lMax - lMin ) / pDivider;
             } else if ( lMinSign === -1 && lMaxSign === -1 ) { // Both negatives
                 lIncrement = ( Math.abs( lMin ) - Math.abs( lMax ) ) / pDivider;
             } else if ( lMinSign === -1 && lMaxSign >= 0 ) { // Negative and positive
                 lIncrement = ( Math.abs( lMin ) + lMax ) / pDivider;
             }
         }

         return lIncrement;
    }

    // Create an expression to set weight to features points based on their values
    // MapLibre expressions defines a formula for computing the value of the property using operators
    function getHeatMapWeight( pIncrement, pMinVal ) {
        let lHeatMapWeights = [
            'interpolate',
            ['linear'],
            ['get', 'value']
        ];

        if ( pIncrement !== 0 ) {
            for ( let i = 0; i <= 10; i++ ) {
                let featVal = pMinVal + ( pIncrement * i );
                lHeatMapWeights.push( featVal );
                lHeatMapWeights.push( ( i + 1 ) * 0.7 );
            }
        } else { // If increment is 0 this means that all points will have the same value
            lHeatMapWeights = 1; // Default to 1, layer needs a value > 0 to be visible
        }

        return lHeatMapWeights;
    }

    // Create an expression to set radius to features points based on zoom level
    // MapLibre expressions defines a formula for computing the value of the property using operators
    function getHeatMapRadius( pIncrement, pMinVal ) {
        let lHeatMapRadius = [
            'interpolate',
            ['linear'],
            ['zoom'],
            1, // From 1 to 12 zoom level
            ['interpolate', ['linear'], ['get', 'value'] ],
            12, // Bigger than 12 zoom level
            ['interpolate', ['linear'], ['get', 'value'] ]
        ];

        if ( pIncrement !== 0 ) {
            for ( let i = 0; i < 10; i++ ) {
                let featVal = pMinVal + ( pIncrement * i );
                // Radius when zoom is lower than 12
                lHeatMapRadius[4].push( featVal );
                // 4 is the max radius that points will have on low zoom levels
                lHeatMapRadius[4].push( ( 4/10 ) * ( i + 1 ) );
                // Radius when zoom is bigger than 12
                lHeatMapRadius[6].push( featVal );
                // 30 is the max radius that points will have on high zoom levels
                lHeatMapRadius[6].push( ( 30/10 ) * ( i + 1 ) );
            }
        } else { // If increment is 0 this means that all points will have the same value
            lHeatMapRadius = 3; // Default radius
        }

        return lHeatMapRadius;
    }

    function getPopupData( pLayer, pFeat, pType ) {
        let lPopupData = {};

        if ( pLayer[ pType ] ) {  // When "Advanced Formatting" is switched on, layer will contain an HTML Expression ( info window/tooltip content )
            lPopupData.type = POPUP_ADV_FMT;
            lPopupData.content = pLayer[ pType ];
            lPopupData.columns = pFeat.columns; // When HTML Expression contains column items substitutions server will provide cols and vals
        } else if ( pFeat[ pType ] ) { // Each feat will contain info window or tooltip values when "Advanced Formatting" is switched off and a column was selected
            lPopupData.type = POPUP_TITLE_BODY;
            lPopupData.content = pFeat[ pType ];
        }

        return lPopupData;
    }
    function createControlBtn( pTitle, pIconClass, pId, pIsToggleBtn = true ) {
        let out = util.htmlBuilder();

        out.markup( "<button type='button'" )
           .attr( "id", pId )
           .attr( "title", pTitle )
           .attr( A_LABEL, pTitle );

        if ( pIsToggleBtn ) {
            out.attr( "aria-pressed", false );
        }

        out.markup( ">" )
               .markup( "<span aria-hidden='true'" )
               .attr( "class", `${C_ICON} ${pIconClass}` )
               .markup( ">" )
               .markup( "</span>" )
           .markup( "</button>" );

        return $( out.toString() );
    }

    function isEmptyObj( pObject ) {
        if ( isString( pObject ) ) {
            pObject = parseJSON( pObject );
        }

        if ( pObject ) {
            return Object.keys( pObject ).length === 0;
        } else {
            return true;
        }
    }

    // Return maplibre expression to get icon images
    function getIconImage( pClusterId ) {
        return [
            'case',
            ['!=', GET_IMG, null ],
            GET_IMG,
            pClusterId
        ];
    }

    function isDarkMode() {
        return $( "body" ).hasClass("apex-theme-vita-dark");
    }

    function isWholeWorldFetched( pLastBboxFetched ) {
        let lBbox = pLastBboxFetched,
            lEastSign = Math.sign( lBbox[2] ),
            lWestSign = Math.sign( lBbox[0] ),
            lTotalngDegrees;

        // Get total lng fetched based on west and east bbox
        if ( lWestSign >= 0 && lEastSign >= 0 ) { // Both positives
            lTotalngDegrees = lBbox[2] - lBbox[0];
        } else if ( lWestSign === -1 && lEastSign === -1 ) { // Both negatives
            lTotalngDegrees = Math.abs( lBbox[0] ) + lBbox[2];
        } else if ( lWestSign === -1 && lEastSign >= 0 ) { // Negative and positive
            lTotalngDegrees = Math.abs( lBbox[0] ) + lBbox[2];
        }

        return ( ( lTotalngDegrees ) >= 360 &&
               ( Math.abs( lBbox[1] ) + Math.abs( lBbox[3] ) ) >= 170 ); // Tiles only reach 170 lat
    }

    function getMessage( key ) {
        return lang.getMessage( MSG_PREFIX + key );
    }

    function parseJSON( pString ) {
        try {
            return JSON.parse( pString );
        } catch (e) {
            return null;
        }
    }

    function isString( pValue ) {
        return typeof pValue === "string";
    }

    function isBoolean( pValue ) {
        return typeof pValue === "boolean";
    }

    function isObject( pValue ) {
        return typeof pValue === "object";
    }

    function isPoint( pType ) {
        return pType === POINTS_GEOM_TYPE || pType === "Multipoint";
    }

    // don't doc methods that don't apply to spatialMap
    /**
     * @ignore
     * @member widgetName
     * @memberOf mapRegion.prototype
     */
    /**
     * @ignore
     * @member parentRegionId
     * @memberOf mapRegion.prototype
     */
    /**
     * @ignore
     * @method call
     * @memberOf mapRegion.prototype
     */
    /**
     * @ignore
     * @method widget
     * @memberOf mapRegion.prototype
     */
    /**
     * @ignore
     * @method alternateLoadingIndicator
     * @memberOf mapRegion.prototype
     */
    $.widget( "apex.spatialMap",
        /**
         * @lends mapRegion.prototype
         */
        {
        widgetEventPrefix: "spatialMap",
        options: {
            /**
             * Spatial map region id. Required.
             *
             * @ignore
             * @memberof mapRegion
             * @instance
             * @type {string}
             * @default null
             */
            regionStaticId: null,
            /**
             * The plug-in ajax identifier. Required.
             *
             * @ignore
             * @memberof mapRegion
             * @instance
             * @type {string}
             * @default null
             */
            ajaxIdentifier: null,
           /**
             * <p>Whether load map data making an ajax request or not. Required.</p>
             *
             * @memberof mapRegion
             * @instance
             * @type {boolean}
             * @default false
             * @exampleGetter
             */
            lazyLoading: false,
            /**
             * <p>Copyright notice html expression.</p>
             *
             * @memberof mapRegion
             * @instance
             * @type {string}
             * @default null
             * @exampleGetter
             */
            copyrightNotice: null,
           /**
             * <p>Unit system that will be used for scale control and distance tool.
             * One of "metric" or "imperial".</p>
             *
             * @memberof mapRegion
             * @instance
             * @type {string}
             * @default "metric"
             * @exampleGetterSetter "metric"
             */
            mapUnitSystem: "metric",
            /**
             * <p>An array of objects with basic information about layers. Required.</p>
             *
             * @memberof mapRegion
             * @instance
             * @type {Object[]}
             * @exampleGetter
             *
             * @property {number} id Layer id.
             * @property {string} label Layer name.
             * @property {boolean} useSpatialIndex If true the widget will only fetch rows for the current map window from the database.
             *                                     This provides a performance benefit when the data source contains a large amount of rows.
             * @property {number} minZoom Specify the minimum zoom level for the layer to become visible.
             * @property {number} maxZoom Specify the maximum zoom level for this layer to remain visible.
             * @property {Object} tooltip Layers features tooltip information.
             * @property {string} tooltip.template If Advanced formatting has been chosen for the tooltip then user needs to provide
             *                                     an HTML expressions to be shown as tooltip when hovering over a layer feature on the map.
             * @property {string} tooltip.cssClasses Additional css classes to be added in tooltip container.
             * @property {Object} infoWindow Layers features info window information.
             * @property {string} infoWindow.template If Advanced formatting has been chosen for the info window then user needs to provide
             *                                        an HTML expressions to be shown as info window when clicking on a layer feature on the map.
             * @property {string} infoWindow.cssClasses Additional css classes to be added in info window container.
             */
            layers: null,
            /**
             * <p>Tyle layer information object. Required.</p>
             *
             * @memberof mapRegion
             * @instance
             * @type {Object}
             * @exampleGetterSetter { name: "osm-bright", darkmodeName: "osm-dark-matter" }
             *
             * @property {string} type One of "oracle-default", default layer from Oracle map server; "oracle-custom", all available layers from Oracle map server;
             *                         and "shared-component", all custom backgrounds created by user.
             * @property {string} name Tile layer name for light mode. One of "osm-bright", "osm-positron", "bi-world-map", "osm-dark-matter" or "world-map".
             * @property {string} darkmodeName Tile layer name for dark mode.  One of "osm-bright", "osm-positron", "bi-world-map", "osm-dark-matter" or "world-map".
             * @property {string} api_key API Key value that can be set in the custom background URL, if required by the provider. Standard mode.
             * @property {string} api_key_dark API Key value that can be set in the custom background URL, if required by the provider. Dark mode.
             * @property {string} attribution Attribution text to display on the custom map. Standard mode.
             * @property {string} attribution_dark Attribution text to display on the custom map. Dark mode.
             * @property {Object} http_headers Custom background HTTP headers required by the provider. Standard mode.
             * @property {Object} http_headers_dark Custom background HTTP headers required by the provider. Dark mode.
             * @property {string} layer_type Type of the map tile layer retrieved from custom background URL.
             *                               One of "RASTER", "VECTOR" or "OGCWMS". Standard mode.
             * @property {string} layer_type_dark Type of the map tile layer retrieved from custom background URL.
             *                                    One of "RASTER", "VECTOR" or "OGCWMS". Dark mode.
             * @property {string} url URL used to fetch a custom map tile layer. Standard mode.
             * @property {string} url_dark URL used to fetch a custom map tile layer. Dark mode.
             * @property {number} zoom_min The minimum zoom level of the map (0-24) with 0 being the lowest zoom level (fully zoomed out)
             *                             and 24 being the highest (fully zoomed in). Standard mode.
             * @property {number} zoom_max The maximum zoom level of the map (0-24) with 0 being the lowest zoom level (fully zoomed out)
             *                             and 24 being the highest (fully zoomed in). Standard mode.
             * @property {number} zoom_min_dark The minimum zoom level of the map (0-24) with 0 being the lowest zoom level (fully zoomed out)
             *                                  and 24 being the highest (fully zoomed in). Dark mode.
             * @property {number} zoom_max_dark The maximum zoom level of the map (0-24) with 0 being the lowest zoom level (fully zoomed out)
             *                                  and 24 being the highest (fully zoomed in). Dark mode.
             */
            tileLayer: null,
            /**
             * <p>Navigation Controls Bar Object. Add zoom and rotation (compass) controls to the map. Required.</p>
             *
             * @memberof mapRegion
             * @instance
             * @type {Object}
             * @exampleGetterSetter { type: "full", position: "top-right" }
             *
             * @property {string} type One of "none", "no-compass" or "full".
             * @property {string} position One of "top-left","top-right" or "bottom-left".
             */
            navigationBar: null,
            /**
             * <p>Map initialization position.</p>
             *
             * @ignore
             * @memberof mapRegion
             * @instance
             * @type {Object}
             * @exampleGetter
             *
             * @property {number} lon Map initial longitud.
             * @property {number} lat Map initial latitud.
             * @property {number} zoom Map initial zoom level.
             * @property {number} bearing Map initial direction user is facing measured clockwise as an angle.
             * @property {number} pitch Map initial tilt in degrees.
             * @property {number} getFromBrowser If true map will use the goelocate control to locate the user on the map.
             * @property {number} basedOnFeatures If true then the map center and zoom level is to be derived from the features returned by the AJAX request ("map.bbox" element).
             */
            initPosition : {
                lon: 0,
                lat: 0,
                zoom: 1,
                bearing: 0,
                pitch: 0,
                getFromBrowser: false,
                basedOnFeatures: false,
                basedOnFeaturesMaxZoom: false
            },
            /**
             * <p>If true map position will be initialized using the specified initial map position (basedOnFeatures, getFromBrowser or static values for longitude, latitude and zoom level).
             * If false widget will initialize map position using session state.</p>
             *
             * @memberof mapRegion
             * @instance
             * @type {boolean}
             * @default false
             * @exampleGetter
             */
            resetMapPosition: false,
            /**
             * <p>Comma separated list of page items on the current page to be set into session state when an AJAX request is made.</p>
             *
             * @memberof mapRegion
             * @instance
             * @type {string}
             * @default null
             * @exampleGetter
             */
            itemsToSubmit: null,
            /**
             * <p>Map tools to be used in the map.</p>
             *
             * @memberof mapRegion
             * @instance
             * @type {Object}
             * @exampleGetterSetter {
             *     mousewheelZoom: true,
             *     scaleBar: true,
             *     circleTool: true,
             *     browserLocation: true,
             *     rectangleZoom: true,
             *     distanceTool: true,
             *     overviewMap: true,
             *     infiniteMap: true
             * }
             *
             * @property {boolean} mousewheelZoom If true scroll zoom will be enabled.
             * @property {boolean} scaleBar If true scale control will be enabled.
             * @property {boolean} circleTool If true  circle tool  will be enabled.
             * @property {boolean} browserLocation If true geolocate control will be enabled.
             * @property {boolean} rectangleZoom If true rectangle zoom tool will be enabled.
             * @property {boolean} distanceTool If true distance tool will be enabled.
             * @property {boolean} overviewMap If true overview map will be displayed on map.
             * @property {boolean} infiniteMap If true MapLibre will render multiple world copies.
             */
            mapFeatures: {
                mousewheelZoom: false,
                scaleBar: false,
                circleTool: false,
                browserLocation :false,
                rectangleZoom: false,
                distanceTool: false,
                overviewMap: false,
                infiniteMap: false
            },
            /**
             * <p>This item will be populated with the current map bbox. So whenever the map is zoomed or dragged,
             * store the current bbox in this item.</p>
             *
             * @memberof mapRegion
             * @instance
             * @type {string}
             * @default null
             * @exampleGetterSetter "P1_STATUS_ITEM"
             */
            mapStatusItem: null,
            /**
             * <p>Position of "No Data Found" and "More Data Found" messages container.</p>
             *
             * @memberof mapRegion
             * @instance
             * @type {Object}
             * @default null
             * @exampleGetterSetter { position: "top" }
             *
             * @property {string} position One of "top" or "bottom".
             * @property {string} selector Selector for the DIV container to display the messages in.
             */
            layerMessages: null,
            /**
             * <p>These styles can be used as the SVG Shape attribute within a Point layer.
             * An array of objects that provide definitions for custom SVG shapes to be used as point markers.</p>
             *
             * @memberof mapRegion
             * @instance
             * @type {Object[]}
             * @exampleGetterSetter [
             *    {
             *        "name": "MyCamera",
             *        "width": 20,
             *        "height": 20,
             *        "paint-order": "stroke",
             *        "viewBox": "0 0 20 20",
             *        "elements": [
             *            {
             *                "type": "path",
             *                "d": "M15 4h-1.2l-.9-1.2c-.4-.5-1-.8-1.6-.8H8.8c-.7 0-1.3.3-1.6.8L6.2 4H5c-1.1 0-2 .9-2 2v5c0 1.1.9 2 2 2h2.2l2.4 4.7c.1.2.4.3.7.2.1 0 .2-.1.2-.2l2.4-4.7H15c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm-5 7c-1.4 0-2.5-1.1-2.5-2.5S8.6 6 10 6s2.5 1.1 2.5 2.5S11.4 11 10 11z"
             *            }
             *        ]
             *     }
             * ]
             *
             * @property {string} type Svg element type
             * @property {string} name Svg shape name that can be used to specify the SVG shape to display point objects.
             * @property {number} width Svg shape width
             * @property {number} height Svg shape height
             * @property {string} viewBox Defines the position and dimension of an SVG viewport.
             * @property {Object[]} elements Array of objects that represent the necessary svg child elements to create the svg shape.
             *                               Each object most contain all the necessary element attrs.
             */
            customStyles: [],
            /**
             * <p>Filter region id.</p>
             *
             * @ignore
             * @memberof mapRegion
             * @instance
             * @type {string}
             * @default null
             */
            filterRegionId: null,
            /**
             * <p>Object returned by the AJAX request.</p>
             *
             * @memberof mapRegion
             * @instance
             * @type {Object}
             * @default null
             * @exampleGetter
             *
             * @property {Object} map Object with map bbox coordinates and series information.
             * @property {Object[]} map.bbox Boundary box. Array of coordinates that describes the map window where all the layers features will be displayed.
             * @property {Object[]} map.series Array of series that represent the layers. Series will contain all the feature points and information about the layers that will be created by MapLibre.
             */
            mapData: null,
            /**
             * <p>Legend area position and styles.</p>
             * @memberof mapRegion
             * @instance
             * @type {Object}
             * @default null
             * @exampleGetterSetter { positon: "start", title: "My layers" }
             *
             * @property {string} position One of "start", "end" or "selector"
             * @property {string} selector JQuery selector to display the legend in.
             * @property {string} title Legend title text.
             * @property {string} cssClasses Additional css classes to be added in lagend container.
             */
            legend: null,
            /**
             * <p>Determines if raster or vector tile layer is used. If false map will use raster tile layers. If true map will use vector tile layers. Vector tiles are better quality. Available vector tile layers are: OpenStreetMap Positron, OpenStreetMap Dark and OpenStreetMap Bright.</p>
             *
             * @memberof mapRegion
             * @instance
             * @type {boolean}
             * @default false
             * @exampleGetter
             */
            useVectorTileLayers: false,
            //
            // events:
            //
            /**
             * <p>Triggered when map is completely initialized (all JS loaded, map is drawn).</p>
             *
             * @event initialized
             * @memberof mapRegion
             * @instance
             * @property {Event} event <code class="prettyprint">jQuery</code> event object.
             *
             * @example <caption>Bind an event listener to the <code class="prettyprint">spatialmapinitialized</code> event:</caption>
             * $( ".selector" ).on( "spatialmapinitialized", function() {
             *     // do something when map region is initialized
             * } );
             *
             */
            initialized: null,
            /**
             * <p>Triggered when the map (not a layer feature) has been clicked.</p>
             *
             * @event click
             * @memberof mapRegion
             * @instance
             * @property {Event} event <code class="prettyprint">jQuery</code> event object.
             * @property {Object} data
             * @property {number} data.lat Latitude where the map was clicked.
             * @property {number} data.lng Longitude where the map was clicked.
             *
             * @example <caption>Bind an event listener to the <code class="prettyprint">spatialmapclick</code> event:</caption>
             * $( ".selector" ).on( "spatialmapclick", function( event, data ) {
             *     // do something with data.lat and data.lng
             * } );
             *
             */
            click: null,
            /**
             * <p>Triggered when one of the spatial features has been clicked.</p>
             *
             * @event objectclick
             * @memberof mapRegion
             * @instance
             * @property {Event} event <code class="prettyprint">jQuery</code> event object.
             * @property {Object} data
             * @property {number} data.id Id of feature. Sent only if feature layer is not a cluster and primary Key column was specified.
             * @property {number} data.lat Latitude of feature point. In case layer feature is not a point, latitude will belong to cursor position at the moment of clicking the layer feature.
             * @property {number} data.lng Longitude of feature point. In case layer feature is not a point, longitude will belong to cursor position at the moment of clicking the layer feature.
             * @property {string} data.tooltip JSON that contains the tooltip data of the layer feature. Sent only if feature layer is not a cluster.
             * @property {string} data.infoWindow JSON that contains the info window data of the layer feature. Sent only if feature layer is not a cluster.
             * @property {number} data.cluster_id Id of cluster feature. Sent only if feature point is a cluster.
             * @property {number} data.point_count Number of points into the cluster. Sent only if festure point is a cluster.
             *
             * @example <caption>Bind an event listener to the <code class="prettyprint">spatialmapobjectclick</code> event:</caption>
             * $( ".selector" ).on( "spatialmapobjectclick", function( event, data ) {
             *     // do something with data.id, data.lat, data.lng, data.tooltip, data.infoWindow, data.cluster_id and data.point_count
             * } );
             *
             */
            objectclick: null,
            /**
             * <p>Triggered when the map area or zoom level has changed.</p>
             * @event changed
             * @memberof mapRegion
             * @instance
             * @property {Event} event <code class="prettyprint">jQuery</code> event object.
             * @property {Object} data
             * @property {string} data.changeType One of "map-drag","map-zoom","toggle-layer","map-rotate","circle-drawn","circle-removed","feature-added","feature-removed","feature-updated"
             * @property {Object[]} data.layers An array of objects with basic information about the visible layers on map.
             * @property {Object[]} data.bbox Boundary box. Array of coordinates that describes the current map window.
             * @property {number} data.zoom Current map zoom level.
             * @property {number} data.pitch Map current direction user is facing measured clockwise as an angle.
             * @property {number} data.bearing Map current tilt in degrees.
             * @property {object} data.circle GeoJSON object with the circle coordinates. Sent only when a circle is drawn.
             *
             * @example <caption>Bind an event listener to the <code class="prettyprint">spatialmapchanged</code> event:</caption>
             * $( ".selector" ).on( "spatialmapchanged", function( event, data ) {
             *     // do something with data.changeType, data.layers, data.bbox, data.zoom, data.pitch, data.bearing and data.circle
             * } );
             *
             */
            changed: null
        },

        _create: function () {
            let o = this.options,
                ctrl$ = this.element;

            this._super();

            this.mapContainerId = o.regionStaticId + "_map";
            this.regionContainer$ = $( "#" + util.escapeCSS( o.regionStaticId ) + "_map_region" );
            this.componentContainer$ = null; // Container for map and legend area
            this.messagesContainer$ = null; // "no data found" and "more date found" messages container
            this.legendContainer$ = null;
            this.overViewMapCont$ = null;
            this.overViewMap = null; // Overview map instance
            this.overviewSquare = null; // Highlighted area in overview map
            this.rectangleZoomTool = {};
            this.distanceTool = {};
            this.circleTool = null;
            this.browserLocationTool = null;
            this.navControl = null;
            this.scaleBar = null;
            this.toggleDimensionsCtrl = null;
            this.attribution = null; // Control presents map's attribution info - copyright notice
            this.map = null; // Map instance
            this.svgStyles = NATIVE_SVG_SHAPES;
            this.topLayer = null;
            this.layersIds = []; // List of layers added based on series data
            this.lastMapStatusOnFetch = {}; // Map status at the moment of refetching
            this.colorNumDef = 0; // Default color number. Widget will set one of the 15 default colors to each layer that does not have a color
            this.setDefaultColor = false; // Whether default color was used or not on a layer
            this.tooltip = new maplibregl.Popup( {
                closeButton: false
            } );
            this.sessionStore = apex.storage.getScopedSessionStorage( {
                prefix: "ORA_WWV_apex.spatialMap",
                useAppId: true,
                usePageId: true,
                regionId: o.regionStaticId
            } );
            this.scopedActions;

            region.create( o.regionStaticId, function( baseRegion ) {
                baseRegion.type = "SpatialMap";
                baseRegion.widgetName = "spatialMap";
                baseRegion.filterRegionId = o.filterRegionId;
                baseRegion.widget = () => {
                    return ctrl$;
                };

                /**
                 * <p>The mapRegion type is "SpatialMap".</p>
                 * @member type
                 * @memberOf mapRegion.prototype
                 * @type {string}
                 */
                 widgetUtil.makeInterfaceFromWidget( baseRegion, ctrl$, "spatialMap", [], ["ajaxIdentifier","filterRegionId","regionStaticId"] );
            } );

            this._render();
            this._setSessionStoreInitPos( !o.resetMapPosition );
            this._initMap( o.resetMapPosition );
        },

        _setSessionStoreInitPos: function( pSetInitPos ) {
            let o = this.options;

            if ( pSetInitPos ) {
                try {
                    let lZoom = parseFloat( this.sessionStore.getItem( ZOOM_KEY ) ),
                        lLng = parseFloat( this.sessionStore.getItem( LNG_KEY ) ),
                        lLat = parseFloat( this.sessionStore.getItem( LAT_KEY ) ),
                        lPitch = parseFloat( this.sessionStore.getItem( PITCH_KEY ) ),
                        lBearing = parseFloat( this.sessionStore.getItem( BEARING_KEY ) );

                    if ( lZoom && !isNaN( lZoom ) && lZoom >= 1 && lZoom <= 18 ) {
                        o.initPosition.zoom = lZoom;
                    }

                    if ( lLng && lLat && !isNaN( lLng ) && !isNaN( lLat ) ) {
                        o.initPosition.lon = lLng;
                        o.initPosition.lat = lLat;
                    }

                    if ( lPitch && !isNaN( lPitch ) ) {
                        o.initPosition.pitch = lPitch;
                    }

                    if ( lBearing && !isNaN( lBearing ) ) {
                        o.initPosition.bearing = lBearing;
                    }

                } catch ( err ) {
                    debug.warn( "Failed to restore map state from session ", err );
                }
            } else {
                this._cleanupSessionStore();
            }
        },

        _render: function() {
            let o = this.options,
                out = util.htmlBuilder(),
                lRegionHeight = this.regionContainer$.attr( "data-map-height" );

            out.markup( "<div class='a-MapRegion-container'" )
               .attr( "style", "height:" + lRegionHeight )
               .markup( ">" )
                    .markup( "<div class='a-MapRegion-map' " )
                    .attr( "id", this.mapContainerId )
                    .attr( "data-action", "useTool" )
                    .markup( "></div>" )
               .markup( "</div>" );

            this.componentContainer$ = $( out.toString() );

            this.regionContainer$.append( this.componentContainer$ );

            if ( o.legend ) {
                this._addLegend();
            }

            if ( o.layerMessages ) {
                this._addMessagesContainer();
            }
        },

        _getElocation: async function() {
            const {
                name,
                darkmodeName,
                type
            } = this.options.tileLayer;

            let lElocations = $.extend( true, {}, ELOCATIONS_RASTER_TILE_LAYERS ),
                lIsDarkMode = isDarkMode(),
                lElocationName = "elocation-";

            function handleRasterTileLayers() {
                lElocations.layers[ 0 ].id = lElocationName + "-layer";
                lElocations.layers[ 0 ].source = lElocationName;
                lElocations.name = lElocations.sources[ lElocationName ].name;
            }

            lElocationName += ( lIsDarkMode ? darkmodeName : name ).toLowerCase().replace(/ +/g, "-");

            if ( type === SHARED_COMPONENT_TYPE ) {
                const API_KEY = "{api-key}",
                      RASTER = "RASTER",
                      WMS = "OGCWMS";

                const {
                    url,
                    url_dark,
                    attribution,
                    attribution_dark,
                    api_key,
                    api_key_dark,
                    layer_type,
                    layer_type_dark
                } = this.options.tileLayer;

                let lLayerAttribution = this.options.copyrightNotice ? null : lIsDarkMode ? attribution_dark : attribution,
                    lLayerUrl = lIsDarkMode ? url_dark.replace( API_KEY, api_key_dark ) : url.replace( API_KEY, api_key ),
                    lLayerType = lIsDarkMode ? layer_type_dark : layer_type;

                if ( lLayerType === "VECTOR" ) {
                    lElocations = fetchVectorLayerData( lLayerUrl );
                } else if ( [ RASTER, WMS ].includes( lLayerType ) ) {
                   /*
                    * WMS URL used to fetch a map tile layer from the Web Map Service - Open Geospatial Consortium.
                    * In order to properly render the tile layer the following WMS parameters will be added
                    * automatically by the Map Region:
                    * - BBOX
                    * - WIDTH
                    * - HEIGHT
                    * - REQUEST
                    * - FORMAT
                    * - SRS / CRS
                    */
                    if ( lLayerType === WMS ) {
                        let versionMatch = lLayerUrl.match(/(^|[&])version=([^&]*)/),
                            referenceSys = ( versionMatch !== null && parseFloat( versionMatch[2] ) >= 1.3 )
                                         ? "crs" : "srs";

                        lLayerUrl += "&request=GetMap&bbox={bbox-epsg-3857}&format=image/png&"
                            + referenceSys + "=EPSG:3857&width=256&height=256";
                    }

                    lElocations.sources[ lElocationName ] = {
                        type: RASTER.toLowerCase(),
                        name: lIsDarkMode ? darkmodeName : name,
                        attribution: lLayerAttribution || '',
                        tiles: [ lLayerUrl ],
                        tileSize: 256
                    };

                    handleRasterTileLayers();
                }
            } else {
                let vectorTileLayer = ELOCATIONS_VECTOR_TILE_LAYERS[ lElocationName ];

                // We only have vector tile layers for Dark, Bright and Positron
                // For Bi World Map and World Map we have to use raster tiles
                if ( this.options.useVectorTileLayers && vectorTileLayer ) {
                    lElocations = fetchVectorLayerData( vectorTileLayer );
                } else {
                    handleRasterTileLayers();
                }
            }

            return lElocations;
        },

        _initMap: function( pResetInitPos ) {

            const { lon, lat, zoom, pitch, bearing } = this.options.initPosition;

            let self = this,
                o = this.options,
                lMapFeatures = o.mapFeatures,
                mapLibreOpts = {
                    container: self.mapContainerId,
                    renderWorldCopies: lMapFeatures.infiniteMap,
                    trackResize: true,
                    center: [ lon, lat ],
                    attributionControl: false,
                    transformRequest: getTransformRequestCallback( o ),
                    bearing,
                    pitch,
                    zoom,
                    ...this._getMinMaxZoomLevels(),
                    locale: {
                        'Map.Title': getMessage( "MAP" )
                    }
                };

            ( async () => {

                mapLibreOpts.style = await self._getElocation(); // Stylesheet location
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
                self.map = new maplibregl.Map( mapLibreOpts );

                // Tools actions context
                this.scopedActions = actions.createContext( "activateTools", self.map.getContainer() );

                self._addNavControl( o.navigationBar.type );

                self._addCopyrightNotice();

                if ( lMapFeatures.rectangleZoom ) {
                    self._addRectangleTool();
                }

                if ( lMapFeatures.scaleBar ) {
                    self._addScaleTool();
                }

                if ( lMapFeatures.overviewMap ) {
                    self._addOverviewMap();
                }

                if ( lMapFeatures.browserLocation ) {
                    self._addBrowserLocation();
                }

                if ( lMapFeatures.circleTool ) {
                    self._addCircleTool();
                }

                if ( lMapFeatures.distanceTool ) {
                    self._addDistanceTool();
                }

                if ( !lMapFeatures.mousewheelZoom ) {
                    self.map.scrollZoom.disable();
                }

                if ( o.customStyles ) {
                    self._addCustomSvgStyles( o.customStyles );
                }

                self.map.on( 'load', function () {
                    const { basedOnFeatures, getFromBrowser } = o.initPosition;
                    // If Lazy Loading is enabled, map fetches feature data from the server using an AJAX request.
                    if ( o.lazyLoading ) {
                        self._fetch( false, () => {
                            if ( !getFromBrowser && basedOnFeatures && pResetInitPos ) {
                                self._fitBounds( o.mapData.map.bbox, o.initPosition.basedOnFeaturesMaxZoom );
                            }
                        } ); // Wait until fetch was completed
                    } else {
                        // If Lazy Loading is disabled all features data will already be fetched on page load and
                        // the server makes the JSON object available mapData object.
                        self._addLayers();

                        if ( !getFromBrowser && basedOnFeatures && pResetInitPos ) {
                            self._fitBounds( o.mapData.map.bbox, o.initPosition.basedOnFeaturesMaxZoom );
                        }

                        self.lastMapStatusOnFetch = self.getMapStatus();
                        self.lastMapStatusOnFetch.center = self.map.getCenter();
                    }

                    if ( getFromBrowser && pResetInitPos ) {
                        self.browserLocationTool.trigger();
                    }

                    self._addMapHandlers();

                    /**
                     * Fix for bug 37207320
                     * Store the initial position and zoom level in session storage,
                     * so that an immediate reload uses correct settings
                     */
                    self._storeMapPosition();

                    // Fire event for dynamic action
                    self._trigger( EVENT_MAP_INITIALIZED, {}, {} );
                } );
            } )();
        },

        _storeMapPosition: function() {
            const center = this.map.getCenter(),
                { bbox, zoom } = this.getMapBboxAndZoomLevel();

            this.sessionStore.setItem( ZOOM_KEY, zoom );
            this.sessionStore.setItem( LNG_KEY, center.lng );
            this.sessionStore.setItem( LAT_KEY, center.lat );

            if ( this.options.mapStatusItem ) {
                this._updateMapStatusItem( { bbox, zoom } );
            }
        },

        _getMinMaxZoomLevels: function() {
            const {
                type,
                zoom_min = DEFAULT_MIN_ZOOM,
                zoom_max = DEFAULT_MAX_ZOOM,
                zoom_min_dark = DEFAULT_MIN_ZOOM,
                zoom_max_dark = DEFAULT_MAX_ZOOM
            } = this.options.tileLayer;

            let lIsCustomBackground = type === SHARED_COMPONENT_TYPE,
                lIsDarkMode = isDarkMode();

            return {
                minZoom: lIsCustomBackground ? lIsDarkMode ? zoom_min_dark : zoom_min : DEFAULT_MIN_ZOOM,
                maxZoom: lIsCustomBackground ? lIsDarkMode ? zoom_max_dark : zoom_max : 18 // 18 is the max zoom for built in map layers
            };
        },

        _addCopyrightNotice: function() {
            let lAttrbBtn$,
                o = this.options;

            this.attribution = new maplibregl.AttributionControl( {
                customAttribution: o.copyrightNotice
            } );

            this.map.addControl( this.attribution );

            lAttrbBtn$ = $( this.attribution._container ).find("button");

            // When map is small a button will be displayed to toggle copyright text
            lAttrbBtn$.attr( {
                "type" : "button",
                "title" : getMessage("TOGGLE_COPYRIGHT"),
                "aria-label" : getMessage("TOGGLE_COPYRIGHT")
            } );
        },

        _addMapHandlers: function() {
            let self = this,
                lIsArrowKeyUp = false;

            // When map container is resized canvas needs to be refreshed
            // otherwise canvas won't have container size
            widgetUtil.onElementResize( util.escapeCSS( self.mapContainerId ), () => {
                self._resize();

                // If rectangle or circle are drawn using keyboard and map is resized ( decrease its size )
                // we have to make sure rectangle and circle are not hidden.
                if ( this.circleTool ) {
                    this.circleTool.fixPosition();
                }

                if ( !isEmptyObj( this.rectangleZoomTool ) ) {
                    this.rectangleZoomTool.fixPosition();
                }
            } );

            widgetUtil.onVisibilityChange( self.regionContainer$[0], ( show ) => {
                if ( show ) {
                    self._resize();
                }
            } );

            // Map can be dragged by pressing arrow keys, widget will trigger change event when key is released and map stop moving.
            $( self.map.getCanvas() ).on("keyup", function(e) {
                if ( self.map.keyboard.isEnabled() && [ 'ArrowUp', 'ArrowDown', 'ArrowLeft', 'ArrowRight' ].includes( e.code ) ) {
                    lIsArrowKeyUp = true;
                }
            } );

            /*  When multiple layers are present in a single area and user clicks on one of them
             *  click event is triggered on the top layer and on beneath layers ( click event to display info window )
             *  In order to avoid overlapping click events we get all layers
             *  and check what is the first layer present ( on top )
             *  then save the layer id in "topLayer", so that way only that layer will handle click event
             *  This is also done for mousemove event, so we display tooltip only for top layer.
             */
            self.map.on( 'click', function(e) {
                self.topLayer = self._getTopLayer( e.point );

                if ( !self.topLayer ) {
                    // Fire event for dynamic action only if user did not click on a layer
                    self._trigger( EVENT_MAP_CLICK, {}, { ...e.lngLat } );
                }
            } ).on( 'mousemove', function(e) {
                self.topLayer = self._getTopLayer( e.point );
            } ).on( 'rotate', function() {
                const { pitch, bearing } = self.getMapPitchAndBearing();

                self.sessionStore.setItem( PITCH_KEY, pitch );
                self.sessionStore.setItem( BEARING_KEY, bearing );

                // If overview map is present update overview map bearing and pith values
                if ( self.overViewMap ) {
                    self.overViewMap.setPitch( pitch );
                    self.overViewMap.setBearing( bearing );
                }
            } ).on( 'rotateend', function() {

                self._fireMapChangedEvent( EVENT_ROTATE );

                self._fetchOnMapRotated();

            } ).on( 'dragend', function() {

                self._fireMapChangedEvent( "map-drag" );

                self._fetchOnMapDragged();

            } ).on( 'move', function() {

                self._storeMapPosition();

                // If overview map is present update overview map center position and zoom value
                if ( self.overViewMap ) {
                    const center = self.map.getCenter(),
                        { zoom } = self.getMapBboxAndZoomLevel();

                    self.overViewMap.setCenter( center );
                    self.overViewMap.setZoom( zoom -  ZOOM_FACTOR );

                    // Update position of highlighted area on overview map
                    self.overviewSquare.setLngLat( center );
                }
            } ).on( 'moveend', function() {
                // Once key is released trigger change event
                if ( lIsArrowKeyUp ) {
                    self._fireMapChangedEvent( "map-drag" );

                    self._fetchOnMapDragged();

                    lIsArrowKeyUp = false;

                }
            } ).on( 'zoomend', function() {

                self._fireMapChangedEvent( "map-zoom" );

                self._fetchOnZoomChanged();

            } ).on( 'resize', function() {

                self._fireMapChangedEvent( "map-resized" );

                self._fetchOnMapDragged();

            } );
        },

        _fetchOnZoomChanged: function() {
            let lLayers = this.options.layers,
                lCurrentZoom = this.map.getZoom();

            if ( lLayers ) {
                let lFetched = false;

                // Check all layers
                for ( let i = 0; i < lLayers.length; i++ ) {
                    let lLayerId = lLayers[i].id;

                    if ( this._isHiddenLayer( lLayerId ) ) {
                        this._hideLegendItem( lLayerId );
                    } else {
                        const { lng, lat } = this.map.getCenter();

                        const { lng: lFetchLng, lat: lFetchtLat } = this.lastMapStatusOnFetch.center;

                        this._showLegendItem( lLayerId );

                        /*
                         * Fix for bug 35780906
                         * Re-fetch when Map is inside the minimal and maximal possible zoom levels for the layer ( it's not hidden ) and:
                         *  - Layer hasn't been added nor fetched yet ( re-fetch is needed to get the data for that layer and add it )
                         *  - Layer use spatial index to only fetch rows for the current map window from the database, this
                         *    provides a performance benefit when the data source contains a large amount of rows.
                         *
                         * Fix for bug 35810116
                         * If layer use spatial index and the current zoom levels are lower than the previous fetch status zoom levels
                         * we will re-fetch because the map window will expand, when the current levels are equals or bigger than the
                         * previous fetch status zoom levels we don't have to re-fetch because the map window will reduce ( getting closer to the surface ),
                         * therefore all the features in that area will be already fetched.
                         * But it might happen aswell that the current zoom levels changed along with the center of the map, this means
                         * that the position of the map window is different, so we have to re-fetch, to get all the mising layer features from that area.
                         */
                         if ( !lFetched
                             && ( ( !this.map.getLayer( lLayerId ) && !lLayers[ i ]._isFetched )
                                || ( lLayers[ i ].useSpatialIndex
                                    && this._isVisibleLayer( lLayerId )
                                    && ( lCurrentZoom < this.lastMapStatusOnFetch.zoom
                                        || ( Math.round( lng ) !== Math.round( lFetchLng )
                                            || Math.round( lat ) !== Math.round( lFetchtLat ) ) ) ) ) ) {

                             this._fetch( true );

                             // Once re-fetch is done no need to do it again
                             lFetched = true;
                         }
                    }
                }
            }

            debug.info(`Map Region ${this.options.regionStaticId}: Zoom level changed to ${lCurrentZoom}`);
        },

        _fetchOnMapRotated: function() {
            let lLayers = this.options.layers;

            const { bbox } = this.lastMapStatusOnFetch;

            if ( lLayers && !isWholeWorldFetched( bbox ) ) {
                let lFetched = false;

                // Check all layers
                for ( let i = 0; i < lLayers.length; i++ ) {
                    let lLayerId = lLayers[i].id;
                    // Users can hide layers using legend items, also layers won't be visible if
                    // the current map zoom level is not inside their min and max zoom limits.
                    // Avoid re-fetch if layer is not visible
                    if ( this._isHiddenLayer( lLayerId ) ) {
                        this._hideLegendItem( lLayerId );
                    } else {
                        this._showLegendItem( lLayerId );

                        if ( !lFetched && lLayers[i].useSpatialIndex && this._isVisibleLayer( lLayerId ) ) {
                            const { pitch, bearing } = this.getMapPitchAndBearing();

                            const {
                                pitch: lLastPitch,
                                bearing: lLastBearing
                            } = this.lastMapStatusOnFetch;

                            if ( ( pitch !== lLastPitch || bearing !== lLastBearing ) ) {

                                this._fetch( true );

                                // Once re-fetch is done no need to do it again
                                lFetched = true;
                            }
                        }
                    }
                }
            }
        },

        _fetchOnMapDragged: function() {
            let lLayers = this.options.layers;

            if ( lLayers ) {
                const { bbox } = this.getMapBboxAndZoomLevel(),
                      { bbox: lastBbox } = this.lastMapStatusOnFetch;

                if ( ( ( bbox[0] < lastBbox[0] ) || // Only refetch data if we display areas we did not fetch so far
                       ( bbox[1] < lastBbox[1] ) ||
                       ( bbox[2] > lastBbox[2] ) ||
                       ( bbox[3] > lastBbox[3] ) ) &&
                       !isWholeWorldFetched( lastBbox ) ) {

                    let lFetched = false;

                    // Check all layers
                    for ( let i = 0; i < lLayers.length; i++ ) {
                        let lLayerId = lLayers[i].id;
                        // Users can hide layers using legend items, also layers won't be visible if
                        // the current map zoom level is not inside their min and max zoom limits.
                        // Avoid re-fetch if layer is not visible
                        if ( this._isHiddenLayer( lLayerId ) ) {
                            this._hideLegendItem( lLayerId );
                        } else {
                            this._showLegendItem( lLayerId);

                            if ( !lFetched && lLayers[i].useSpatialIndex && this._isVisibleLayer( lLayerId ) ) {

                                this._fetch( true );

                                // Once re-fetch is done no need to do it again
                                lFetched = true;
                            }
                        }
                    }
                }
            }
        },

        _getTopLayer: function( pPoint ) {
            let lFeatures = this.map.queryRenderedFeatures( pPoint, { layers: this.layersIds } ),
                lTopLayer;

            if ( lFeatures.length > 0 ) {
                lTopLayer = lFeatures[0].layer.id; // Layer on top
            }

            return lTopLayer;
        },

        _fireMapChangedEvent: function( pType, pCircle ) {
            let lLayers = [],
                lPayload;

            const { bbox, zoom } = this.getMapBboxAndZoomLevel(),
                  { pitch, bearing } = this.getMapPitchAndBearing();

            if ( this.options.layers ) {
                this.options.layers.forEach( layer => {
                    lLayers.push( {
                        id: layer.id,
                        name: layer.name,
                        visible: ( this._isVisibleLayer( layer.id ) && !this._isHiddenLayer( layer.id ) ) } );
                } );
            }

            lPayload = {
                changeType: pType,
                layers: lLayers,
                bbox,
                zoom,
                pitch,
                bearing
            };

            // spatialmapchanged event is also fired when circle tool is used
            // If circle GeoJSON object is present add it to payload
            if ( pCircle ) {
                lPayload.circle = pCircle;
            }

            // Fire event for dynamic action
            this._trigger( EVENT_MAP_CHANGED, {}, lPayload );
        },

       /*
        * This method will check the visibility property of the layer
        * The visibility property is set to 'none' to hide the layer and set to 'visible' to show the layer
        * Users can toggle the layer visibility by clicking on the legend checkbox
        * Map Libre does not update this property dynamically based on the layer min or max zoom levels
        */
        _isVisibleLayer: function( pLayerId ) {
            let lLayerId = pLayerId.toString(),
                lIsLayerVisible = false;

            // Check if layer exist
            // If layer have server side condition = never, or if layer does not have any feats, layer will not be created
            if ( this.map.getLayer( lLayerId ) ) {
                lIsLayerVisible = this.map.getLayoutProperty( lLayerId, VISIBILITY ) === LYR_VISIBLE;
            }

            return lIsLayerVisible;
        },

       /*
        * Fix for bug 35782600
        * This method will check if the layer is hidden based on its min and max zoom levels
        */
        _isHiddenLayer: function( layerId ) {
            let lLayer = this.options.layers.find( layer => Number( layer.id ) === Number( layerId ) ),
                lIsHiddenLayer = false;

            if ( lLayer ) {
                let zoomRounded = Math.round( this.map.getZoom() );

                const {
                    /*
                    * User can set min zoom, max zoom or both
                    * If one of them do not have any val use map default min and max zoom levels
                    */
                    minZoom: lMinZoom,
                    maxZoom: lMaxZoom
                } = this._getMinMaxZoomLevels();

                const {
                    minZoom = lMinZoom,
                    maxZoom = lMaxZoom
                } = lLayer;

                lIsHiddenLayer = !( zoomRounded >= minZoom && zoomRounded <= maxZoom );
            }

            return lIsHiddenLayer;
        },

        _bboxToGeoJSON: function( pBbox ) {
            return {
                type: "Polygon",
                coordinates: [ [ [ pBbox[0], pBbox[1] ],
                                 [ pBbox[2], pBbox[1] ],
                                 [ pBbox[2], pBbox[3] ],
                                 [ pBbox[0], pBbox[3] ],
                                 [ pBbox[0], pBbox[1] ] ] ]
            };
        },

        _updateMapStatusItem: function( pMapStatus ) {
            apex.item( this.options.mapStatusItem ).setValue( JSON.stringify( this._bboxToGeoJSON( pMapStatus.bbox ) ) );
        },

        _addLayers: async function() {
            let o = this.options,
                series = o.mapData.map.series,
                layersUpdated = false,
                layersAdded = false,
                spinner$;

            const C_SCOPE_NAME = o.regionStaticId + "_adding_layers";

            // We avoid display spinner if layers creation lasts a very short time
            util.delayLinger.start( C_SCOPE_NAME, () => {
                spinner$ = util.showSpinner( this.regionContainer$ );
            } );

            // Add Layer for each serie
            for ( let i = 0; i < series.length; i++ ) {
                let lLayerId = series[i].id.toString(),
                    lLayerInfo = this._getLayerInfo( series[i].id ),
                    lHasFeatures = series[i].features.length > 0,
                    lSourceId = lLayerId + SOURCE_SUFFIX,
                    lGeoJSONData = {};

                if ( !lHasFeatures ) {
                    this._addMessageItem( lLayerInfo, series[i].noDataFoundMessage );
                }

                // Get GeoJSON object with all features information.
                // If layer will add url images we have to wait until maplibre loads and creates all images
                // otherwise layer will be added before images exists.
                lGeoJSONData = await this._getGeoJSONData( series[i], lLayerInfo );

                // If layer already exist - update layer data (features)
                if ( this.map.getLayer( lLayerId ) ) {
                    this.map.getSource( lSourceId ).setData( lGeoJSONData );

                    layersUpdated = true;
                } else { // If layer does not exit create it

                    /**
                     * Fix for bug 36441788
                     * Each series contains the data for a layer.
                     * If series is present that means layer has been fetched properly ( Even if layer has no feature points ).
                     * If series is not present that means the map is not currently within the min and max zoom levels range
                     * for that layer, therefore, server does not return any data for it yet.
                     *
                     * The _isFetched flag will let widget knows that map doesn't need to re-fetch
                     * ( to get this layer's data ) after zoom in/out.
                     */
                    lLayerInfo._isFetched = true;

                    // Only create layer if there is at least one feature and GeoJSONData is returned
                    // If layer have server side condition = never, series won't have features.
                    // GeoJSONData won't be returned if there are errors on custom color schemes for color spectrum.
                    if ( lHasFeatures && lGeoJSONData ) {

                        // If layer is extruded type (3D) add control, to toggle layer between 3D and 2D mode
                        if ( series[i].style.layerType === EXTRUDED_LYR_TYPE ) {
                            this._addExtrusionCtrl();
                        }

                        // Add features data to map
                        this.map.addSource( lSourceId, this._getSourceObject( lGeoJSONData, series[i].clusterFeatures ) );

                        // Create GeoJSON layer object and add layer to map
                        // If layer will add cluster url image we have to wait until maplibre loads and creates such image
                        // otherwise layer will be added before cluster image exists.
                        this.map.addLayer( await this._getLayerObject( series[i], lGeoJSONData, lLayerInfo ) );

                        // Add legend item if region attr "legend" and layer attr "Display in Legend" were set to true
                        if ( o.legend && series[i].legend ) {
                            this._addLegendItem( series[i], lLayerInfo, lGeoJSONData );
                        }

                        // Add "More Data Found" message, if any ( server will send this message if more data was found )
                        this._addMessageItem( lLayerInfo, series[i].moreDataFoundMessage );

                        // Add events to layer - Display tooltip and info window popups
                        this._addLayerHandlers( series[i] );

                        // Using js API user will be able to display ( displayPopup function )
                        // and remove ( removeInfoWindow function ) multiple info window popups.
                        // We use this object to track all opened layer popups.
                        lLayerInfo.activePopups = {};

                        this.layersIds.push( lLayerId );

                        layersAdded = true;
                    }
                }
            }

            /**
             * Fix for bug 36182515
             * If map is refreshed and new layers are added we need to
             * make sure each layer is displayed in correct order.
             */
            if ( layersUpdated && layersAdded ) {
                for ( let i = 0; i < series.length; i++ ) {
                    let lLayerId = series[ i ].id.toString();

                    // Move layer at the top
                    if ( this.map.getLayer( lLayerId ) ) {
                        this.map.moveLayer( lLayerId );
                    }

                    // Move legend item at the begining of lagend container
                    if ( o.legend && series[ i ].legend ) {
                        let lLegendItem$ = $( `#${ lLayerId + LEGEND_ITEM_ID_SUFFIX }` );

                        this.legendContainer$.prepend( lLegendItem$ );
                    }
                }
            }

            util.delayLinger.finish( C_SCOPE_NAME, () => {
                if ( spinner$ ) {
                    spinner$.remove();
                }
            } );
        },

        _getSourceObject: function( pData, pClustereFeats ) {
            const { clusterRadius = 80 } = pClustereFeats || {};

            return {
                type: 'geojson',
                data: pData,
                buffer: 1, // Size of the tile buffer on each side. MapLibre defaults is 128. A value of 0 produces no buffer.
                generateId: true, // This ensures that all features have unique IDs
                cluster: !!pClustereFeats, // boolean - If true all point will be clustered when zoomed out
                clusterMaxZoom: 14, // Max zoom to cluster points on
                clusterRadius // Radius of each cluster when clustering points (defaults to 20)
            };
        },

        _getLayerObject: async function( pSerie, pGeoJSONData, pLayerInfo ) {
            const {
                minZoom: mapMinZoom,
                maxZoom: mapMaxZoom
            } = this._getMinMaxZoomLevels();

            const { minZoom = mapMinZoom, maxZoom = mapMaxZoom } = pLayerInfo;

            // This is used to set a zoom margin in min and max zoom levels so layers can be visible
            // a little before the min zoom, and they disappear a little after the max zoom.
            const minZoomMargin = 0.5,
                maxZoomMargin = 0.49;

            let lClusterFeatures = pSerie.clusterFeatures,
                lLayerId = pSerie.id.toString(),
                lSourceId = lLayerId + SOURCE_SUFFIX,
                lClusterImgId = lLayerId + "-cluster",
                lColorsExpression = ["get","fill"], // Layer will get fill color val from feature (point) and assign that color
                lLayerObject = {
                    id: lLayerId,
                    source: lSourceId,
                    minzoom: minZoom > minZoomMargin ? minZoom - minZoomMargin : minZoom,
                    maxzoom: maxZoom < DEFAULT_MAX_ZOOM - maxZoomMargin ? maxZoom + maxZoomMargin : maxZoom,
                    layout: {}
                };

            if ( pSerie.style.useColorSpectrum ) {
                lColorsExpression = getColorSpectrumExpression( pSerie, pGeoJSONData.spectrumColors );
            }

            if ( pGeoJSONData.layerType === ICON_IMG_LAYER_TYPE ) {
                let lSizeExpression = GET_SIZE;

                if ( lClusterFeatures ) {

                    lSizeExpression = [
                        'case',
                        ['!=', GET_SIZE, null ], // If feature (point) has no size GeoJSON property, that means point is a cluster
                        GET_SIZE, // Feature size
                        getClusterSize( pSerie ) * 0.05 // Cluster size
                    ];

                    // Create icon image and add it to map only if it does not exist
                    if ( !this.map.hasImage( lClusterImgId ) ) {
                        // Wait until image is loaded and created
                        // otherwise layer will be added before cluster image exists.
                        await this._addUrlImage( lClusterFeatures.clusterImageUrl, lClusterImgId );
                    }
                }

                lLayerObject.type = 'symbol';
                lLayerObject.layout = {
                    'icon-image': getIconImage( lClusterImgId ),
                    'icon-size': lSizeExpression,
                    'icon-overlap': 'always',
                    'text-overlap': 'always',
                    'icon-anchor': 'bottom'
                };
                lLayerObject.paint = {
                    'icon-opacity': getSvgFillOpacity( pSerie )
                };

            } else if ( pGeoJSONData.layerType === ICON_LYR_TYPE ) {
                if ( lClusterFeatures ) {
                    let lClusterColor = getClusterColor( pSerie );

                    if ( !lClusterColor ) {
                        lClusterColor = getDefaultColorByNum( this.colorNumDef );
                    }
                    // Wait until icon image is created
                    await this._addFontIcon( lClusterImgId, lClusterFeatures.clusterIconCssClasses, lClusterColor );
                }

                lLayerObject.type = 'symbol';
                lLayerObject.layout = {
                    'icon-image': getIconImage( lClusterImgId ),
                    'icon-overlap': 'always',
                    'text-overlap': 'always',
                    'icon-anchor': 'bottom'
                };
                lLayerObject.paint = {
                    'icon-opacity': getSvgFillOpacity( pSerie )
                };

            } else if ( pGeoJSONData.layerType === SVG_LYR_TYPE ) { // If svg shape does not exist return
                if ( lClusterFeatures ) {
                    const { strokeColor, strokeWidth } = pSerie.style.svg;

                    let lClusterColor = hasFillColor( "cluster", pSerie ) ? getClusterColor( pSerie ) : getDefaultColorByNum( this.colorNumDef ),
                        lShapeStroke = strokeColor ? strokeColor : DEFAULT_STROKE, // Clusters will always have stroke color
                        lClusterSvgShape = lClusterFeatures.clusterSvgShape;

                    // Use a default shape if no valid svg shape was provided
                    if ( !this.svgStyles[ lClusterSvgShape ] ) {
                        lClusterSvgShape = MARKER_ID;
                    }

                    this._addSvgShape( {
                        imageId: lClusterImgId,
                        name: lClusterSvgShape,
                        color: lClusterColor,
                        size: getClusterSize( pSerie ),
                        stroke: lShapeStroke,
                        opacity: getSvgFillOpacity( pSerie ),
                        strokeWidth
                    } );
                }

                lLayerObject.type = 'symbol';
                lLayerObject.layout = {
                    'icon-image': getIconImage( lClusterImgId ),
                    'icon-overlap' : 'always',
                    'text-overlap': 'always',
                    'icon-anchor': 'bottom'
                };

            } else if ( pGeoJSONData.layerType === POLYGONS_LYR_TYPE ) {

                lLayerObject.type = 'fill';
                lLayerObject.paint = {
                    'fill-color': lColorsExpression,
                    'fill-opacity': getSvgFillOpacity( pSerie )
                };

                // If stroke color was set add fill-outline-color
                if ( pGeoJSONData.features[0].properties.stroke ) {
                    lLayerObject.paint['fill-outline-color'] = ['get','stroke'];
                }

            } else if ( pGeoJSONData.layerType === LINES_LYR_TYPE ) {
                const C_DASH_ARRAYS_HIGH_ZOOM = {
                    "solid" : [ 1 ],
                    "dotted" : [ 0.1, 2 ],
                    "dashed" : [ 2, 4 ],
                    "dot-dashed": [ 0.1, 2, 2, 2 ]
                },
                C_DASH_ARRAYS_LOW_ZOOM = {
                    "solid" : [ 1 ],
                    "dotted" : [ 0.1, 1 ],
                    "dashed" : [ 1, 2 ],
                    "dot-dashed": [ 0.001, 2, 1, 2 ]
                };

                const { strokeWidth = 4, strokeStyle } = pSerie.style.svg;

                lLayerObject.type = 'line';
                lLayerObject.layout = {
                    'line-join': 'round',
                    'line-cap': 'round'
                };
                lLayerObject.paint = {
                    'line-color': lColorsExpression,
                    'line-width': strokeWidth,
                    'line-dasharray': [
                        'step',
                        ['zoom'],
                        ["literal",C_DASH_ARRAYS_LOW_ZOOM[ strokeStyle ]],
                        1, // From 1 to 4 zoom level
                        ["literal",C_DASH_ARRAYS_LOW_ZOOM[ strokeStyle ]],
                        4, // Bigger than 4 zoom level
                        ["literal",C_DASH_ARRAYS_HIGH_ZOOM[ strokeStyle ]]
                    ]
                };
            } else if ( pGeoJSONData.layerType === HEAT_MAP_LYR_TYPE ) {
                let lHeatMapWeights = 1, // Default to 1, heat layer needs a weight value > 0 to be visible
                    lHeatMapRadius = 3; // Default radius

                if ( pSerie.valueColumn ) {
                    let lIncrement = getIncrement( pSerie.valueColumn, 10 );

                    // Get weight and radius expressions
                    lHeatMapWeights = getHeatMapWeight( lIncrement, pSerie.valueColumn.min );
                    lHeatMapRadius = getHeatMapRadius( lIncrement, pSerie.valueColumn.min );
                }

                lLayerObject.type = 'heatmap';
                lLayerObject.paint = {
                    'heatmap-weight' : lHeatMapWeights,
                    'heatmap-intensity': 1,
                    'heatmap-color': lColorsExpression,
                    'heatmap-radius': lHeatMapRadius,
                    'heatmap-opacity': getSvgFillOpacity( pSerie )
                };
            } else if ( pGeoJSONData.layerType === EXTRUDED_LYR_TYPE ) {

                lLayerObject.type = 'fill-extrusion';
                lLayerObject.paint = {
                    'fill-extrusion-color': lColorsExpression,
                    'fill-extrusion-height': ['get', 'height'],
                    'fill-extrusion-opacity': getSvgFillOpacity( pSerie )
                };

                // Add layer id to indicate control to toggle layer between 3D and 2D mode
                this.toggleDimensionsCtrl.addLayerId( lLayerId );
            }

            // Layer will be displayed
            lLayerObject.layout.visibility = LYR_VISIBLE;

            return lLayerObject;
        },

        _getGeoJSONData: async function( pSerie, pLayerInfo ) {
            let lColorNumDef = this.colorNumDef < 15 ? this.colorNumDef + 1 : 1, // There are 15 available colors, after that we assign first color as default
                lDefaultColor = getDefaultColorByNum( lColorNumDef ), // In case user did not set a color for feats or for layer use default
                lGeoJSONData = {
                    type: "FeatureCollection",
                    features: [],
                    layerType: pSerie.style.layerType
                };

            // Get colors spectrum list
            // List will be used to create mapobox spectrum expression
            // and to assign a color to legend item ( if layer is not using spectrum,
            // legend item will use color from serie or feature point color prop )
            if ( pSerie.style.useColorSpectrum ) {
                let lSpectrumColor = getColorSpectrumArray( pSerie );
                if ( lSpectrumColor.length > 0 ) {
                    lGeoJSONData.spectrumColors = lSpectrumColor;
                } else {
                    // Empty list will be returned if there are erros in custom color scheme list.
                    // If scheme is invalid do not return source data object. Do not create layer.
                    debug.error("Invalid custom color scheme.");

                    return;
                }
            }

            // Add Features to Source Data Object
            for ( let index = 0; index < pSerie.features.length; index++ ) {
                // If feat is a url image we have to wait until maplibre loads and creates such image
                // otherwise layer will be added before images exists.
                lGeoJSONData.features.push( await this._getGeoJSONFeat( pSerie, pSerie.features[ index ], pLayerInfo, lDefaultColor ) );
            }

            // If default color was set, update the default color number
            if ( this.setDefaultColor ) {
                this.colorNumDef = lColorNumDef;

                this.setDefaultColor = false;

                pLayerInfo.defaultColor = lDefaultColor;
            }

            return lGeoJSONData;
        },

        _getGeoJSONFeat: async function( pSerie, pFeat, pLayerInfo, pDefaultColor ) {
            let lLayerType = pSerie.style.layerType,
                lHasDefColor = !!pLayerInfo.defaultColor,
                lGeoJSONFeat = {
                    type: "Feature",
                    properties: {
                        tooltip: getPopupData( pLayerInfo, pFeat, TOOLTIP_TYPE ) ,
                        infoWindow: getPopupData( pLayerInfo, pFeat, INFO_WINDOW_TYPE ),
                    },
                    geometry: pFeat.geometry
                };

            if ( pFeat.id ) {
                lGeoJSONFeat.properties.id = pFeat.id;
            }

            if ( pFeat.link ) {
                lGeoJSONFeat.properties.link = pFeat.link;
            }

            if ( lLayerType === POLYGONS_LYR_TYPE ) {
                if ( pSerie.style.useColorSpectrum ) {
                    lGeoJSONFeat.properties.value = pFeat.featureValue;
                    lGeoJSONFeat.properties.stroke = getStrokeColor( pSerie, pFeat, false );
                } else {
                    let lHasFillColor = hasFillColor( "feat", pSerie, pFeat );

                    if ( lHasFillColor ) {
                        lGeoJSONFeat.properties.fill = getFillColor( pSerie, pFeat );
                    } else {
                        // When layer use spatial index widget will refetch, and features will be updated.
                        // If layer already have default color use it.
                        lGeoJSONFeat.properties.fill = lHasDefColor ? pLayerInfo.defaultColor : pDefaultColor;

                        this.setDefaultColor = !lHasDefColor;
                    }
                    // If no color information is specified ( stroke & fill ) in page designer, the widget should use a default stroke color
                    lGeoJSONFeat.properties.stroke = getStrokeColor( pSerie, pFeat, !lHasFillColor );
                }
            } else if ( lLayerType === LINES_LYR_TYPE ) {
                let lLineColor = getStrokeColor( pSerie, pFeat, false ); // Line colors will be set by "stroke color" attr

                if ( lLineColor ) {
                    lGeoJSONFeat.properties.fill = lLineColor;
                } else {
                    // When layer use spatial index widget will refetch, and features will be updated.
                    // If layer already have default color use it.
                    lGeoJSONFeat.properties.fill = lHasDefColor ? pLayerInfo.defaultColor : pDefaultColor;

                    this.setDefaultColor = !lHasDefColor;
                }
           } else if ( lLayerType === SVG_LYR_TYPE ) {
                let lShapeStroke, lShapeColor,
                    lHasFillColor = hasFillColor( "feat", pSerie, pFeat ),
                    lPointSvgShape = getPointSvgShape( pSerie, pFeat ),
                    lShapeSize = getPointSize( pSerie, pFeat );

                // Use a default shape if no valid svg shape was provided
                if ( !this.svgStyles[ lPointSvgShape ] ) {
                    lPointSvgShape = MARKER_ID;
                }

                if ( lHasFillColor ) {
                    lShapeColor = getFillColor( pSerie, pFeat );

                    lShapeStroke = getStrokeColor( pSerie, pFeat, false );
                } else {
                    // When layer use spatial index widget will refetch, and features will be updated.
                    // If layer already have default color use it.
                    lShapeColor = lHasDefColor ? pLayerInfo.defaultColor : pDefaultColor;

                    this.setDefaultColor = !lHasDefColor;

                    // If no color information is specified ( stroke & fill ) in page designer, and shape is a native shape
                    // we have to use a default stroke color
                    lShapeStroke = getStrokeColor( pSerie, pFeat, isNativeShape( lPointSvgShape ) );
                }

               /*
                * Multiple images will be created based on shape, color, stroke and size
                * Images will be unique
                * Images will be re-used by features
                * This way multiple features can use the same image
                */
                lGeoJSONFeat.properties.imageId = pSerie.id + "-" +
                    lPointSvgShape + "-" +
                    lShapeColor + "-" +
                    lShapeSize +
                    ( lShapeStroke ? `-${lShapeStroke}` : "" ) ;

                this._addSvgShape( {
                    imageId: lGeoJSONFeat.properties.imageId,
                    name: lPointSvgShape,
                    color: lShapeColor,
                    size: lShapeSize,
                    stroke: lShapeStroke,
                    strokeWidth: pSerie.style.svg.strokeWidth,
                    opacity: getSvgFillOpacity( pSerie )
                } );

            } else if ( lLayerType === ICON_IMG_LAYER_TYPE ) {
                let lIconUrl = pSerie.style.icon.imageUrl,
                    lPointUrl = pFeat.pointImageUrl,
                    lImgUrl = lIconUrl ? lIconUrl : lPointUrl,
                    lImgSize = getPointSize( pSerie, pFeat ) * 0.1;

                // Assign default color if user did not set layer color
                // This color will be use for lagend item.
                // Do not set default color if layer already have it.
                // When layer use spatial index widget will refetch, and features will be updated.
                if ( !hasFillColor( "feat", pSerie, pFeat ) && !lHasDefColor ) {
                    this.setDefaultColor = true;
                }
               /*
                * We will use url as image id
                * Images will be unique
                * Images will be reused by features
                * This way multiple features can use the same image
                */
                lGeoJSONFeat.properties.imageId = lImgUrl;
                lGeoJSONFeat.properties.size = lImgSize;

                // Create icon image and add it to map only if it does not exist
                if ( !this.map.hasImage( lGeoJSONFeat.properties.imageId ) ) {
                    // Wait until maplibre loads and creates image
                    // otherwise layer will be added before image exists.
                    await this._addUrlImage( lImgUrl, lGeoJSONFeat.properties.imageId );// Wait until image has been added
                }
            } else if ( lLayerType === ICON_LYR_TYPE ) {
                let lIconClasses = getFeatIconClasses( pSerie, pFeat ),
                    lIconColor = getFillColor( pSerie, pFeat );

                if ( !lIconColor ) {
                    // When layer use spatial index widget will refetch, and features will be updated.
                    // If layer already have default color use it.
                    lIconColor = lHasDefColor ? pLayerInfo.defaultColor : pDefaultColor;

                    this.setDefaultColor = !lHasDefColor;
                }

                /*
                 * Multiple images will be created based on color and icon class
                 * Images will be unique
                 * Images will be reused by features
                 * This way multiple features can use the same image
                 */
                lGeoJSONFeat.properties.imageId = lIconClasses.replace(/\s/g, '-') + "-" + lIconColor;

                // Wait until icon image is created
                await this._addFontIcon( lGeoJSONFeat.properties.imageId, lIconClasses, lIconColor );

            } else if ( lLayerType === HEAT_MAP_LYR_TYPE ) {
                lGeoJSONFeat.properties.value = pFeat.featureValue;
            } else if ( lLayerType === EXTRUDED_LYR_TYPE ) {
                lGeoJSONFeat.properties.height = pFeat.featureValue3d;

                if ( pSerie.style.useColorSpectrum ) {
                   lGeoJSONFeat.properties.value = pFeat.featureValue;
                } else {
                    let lFillColor = getFillColor( pSerie, pFeat );

                    if ( lFillColor ) {
                        lGeoJSONFeat.properties.fill = lFillColor;
                    } else {
                        // When layer use spatial index widget will refetch, and features will be updated.
                        // If layer already have default color use it.
                        lGeoJSONFeat.properties.fill = lHasDefColor ? pLayerInfo.defaultColor : pDefaultColor;

                        this.setDefaultColor = !lHasDefColor;
                    }
                }
            }

            return lGeoJSONFeat;
        },

        _addFontIcon: function( pImageId, pIconClasses, pIconColor ) {
            if ( !this.map.hasImage( pImageId ) ) { // Create icon image and add it to map only if it does not exist
                return new Promise( ( resolve ) => {
                    let lFontFamily, lIconHeight, lIconWidth, lFontIcon,
                        lIconElmnt = getTempIcon( pIconClasses ),
                        lFaUnicode = getUnicode( lIconElmnt );

                    // If no valid icon was provided use a default icon
                    if ( !lFaUnicode ) {
                        lIconElmnt.remove();
                        lIconElmnt = getTempIcon( DEFAULT_ICON );
                        lFaUnicode = getUnicode( lIconElmnt );
                    }

                    // Give icon element a chance to be appended to DOM so we can get its measures (width and height)
                    setTimeout( () => {
                        lFontFamily = window.getComputedStyle( lIconElmnt, ":before" ).getPropertyValue("font-family");
                        lIconHeight = $( lIconElmnt ).height() * 2; // Create an image twice its original size, so we can get a better pixel resolution
                        lIconWidth = $( lIconElmnt ).width() * 2;
                        lFontIcon = new FontIcon( lFontFamily, lIconHeight, lIconWidth, lFaUnicode, pIconColor );

                        lIconElmnt.remove();

                        // pixelRatio: The ratio of pixels in the image to physical pixels on the screen
                        // pixel ration of 2 to decrease image size by half, so it can be displayed with the original size.
                        this.map.addImage( pImageId, lFontIcon ,{ pixelRatio: 2 } );

                        resolve();
                    }, 700);
                } );
            }
        },

        _addSvgShape: function( pShapeInfo ) {
            if ( !this.map.hasImage( pShapeInfo.imageId ) ) {  // Create svg image and add it to map only if it does not exist
                let lSvgShape, lStrokeWidth,
                    lSvgShapeJSON = $.extend( true, {}, this.svgStyles[ pShapeInfo.name ] ); // Copy obj but not memory ref to avoid modify orginal obj

                const { size, color, opacity, stroke, strokeWidth } = pShapeInfo;

                // Stroke width most be proportional to its size
                lStrokeWidth = strokeWidth ? strokeWidth/size : null;

                // Create an image twice its original size (height & width), so we can get a better pixel resolution
                // and also multiply shape width and height by feat size.
                lSvgShapeJSON.width *= size * 2;
                lSvgShapeJSON.height *= size * 2;
                lSvgShapeJSON.fill = color;
                lSvgShapeJSON[ 'fill-opacity' ] = opacity;
                lSvgShapeJSON.stroke = stroke;
                lSvgShapeJSON[ "stroke-width" ] = lStrokeWidth;

                lSvgShape = new SvgShape( lSvgShapeJSON );

                // pixelRatio: The ratio of pixels in the image to physical pixels on the screen
                // pixel ration of 2 to decrease image size by half, so it can be displayed with the original size.
                this.map.addImage( pShapeInfo.imageId, lSvgShape, { pixelRatio: 2 }  );
            }
        },

        _addUrlImage: async function( pUrl, pImageId ) {
            try {
                let image = await this.map.loadImage( pUrl );

                if ( image ) {
                    this.map.addImage( pImageId, image.data );
                }
            } catch( error ) {
                debug.error( "Invalid image URL.", error );
            }
        },

        _addExtrusionCtrl: function() {
            let self = this;
            // Only add control if it does not exit
            if ( !self.toggleDimensionsCtrl ) {
                let lButton$;

                self.toggleDimensionsCtrl = new ToggleDimensions();
                self.map.addControl( self.toggleDimensionsCtrl );

                lButton$ = self.toggleDimensionsCtrl.getButton();

                lButton$.on( 'click', function() {
                    if ( self.toggleDimensionsCtrl.isActive ) {
                        // If map is already "tilted" do not update pitch
                        if ( self.map.getPitch() < 40 ) {
                            self._setMapPitch( 40 );
                            self._fireMapChangedEvent( EVENT_ROTATE );
                        }
                    } else {
                        // If map is not "tilted" do not reset pitch
                        if ( self.map.getPitch() > 0 ) {
                            self._setMapPitch( 0 );
                            self._fireMapChangedEvent( EVENT_ROTATE );
                        }
                    }
                } );

                // Initialize map "tilted"
                if ( self.map.getPitch() < 40 ) {
                    self._setMapPitch( 40 );
                    self._fireMapChangedEvent( EVENT_ROTATE );
                }
            }
        },

        _setMapPitch: function( pValue ) {
            this.map.setPitch( pValue );

            if ( this.overViewMap ) {
                this.overViewMap.setPitch( pValue );
            }

            this.sessionStore.setItem( PITCH_KEY, pValue );
        },

        _addMessagesContainer: function() {
            const { position, selector } = this.options.layerMessages;

            if ( !this.messagesContainer$ ) {
                this.messagesContainer$ = $( `<div class='a-MapRegion-messages' role='region' aria-label='${getMessage( "MAP_MESSAGES" )}'></div>` );
            }

            if ( position === "top" ) {
                this.regionContainer$.prepend( this.messagesContainer$ );
            } else if ( position === "bottom" ) {
                this.regionContainer$.append( this.messagesContainer$ );
            } else if ( position === "selector" )  {
                $( selector ).append( this.messagesContainer$ );
            }
        },

        _addMessageItem: function( pLayerInfo, pMessage ) {
            // Only add message if container was created.
            // Container will be created only if user set
            // at least one error message ( "no data found" or "more data found" )
            if ( this.messagesContainer$ && pMessage ) {
                let lMessageItem$, lCloseBtn$,
                    out = util.htmlBuilder();

                out.markup("<div class='a-MapRegion-message'>" )
                       .markup("<span class='a-MapRegion-messageText' role='alert'>" );

                if ( pLayerInfo.label ) {
                    out.markup( pLayerInfo.label ); // Label will be an html expression, this is under the developers control.
                } else {
                    out.content( pLayerInfo.name );
                }

                out.markup(`: ${pMessage}`)
                   .markup("</span></div>");

                lMessageItem$ = $( out.toString() );

                out.clear();

                out.markup("<button class='a-MapRegion-messageClose'>")
                       .markup("<span class='"+ C_ICON +" icon-remove'" )
                       .attr( A_LABEL, getMessage( "REMOVE_MESSAGE" ) )
                       .markup("></span>")
                   .markup("</button>" );

                lCloseBtn$ = $( out.toString() );

                lCloseBtn$.on("click", function( e ) {
                    // Prevent submit page
                    e.preventDefault();
                    // Remove message
                    $(this).parent().remove();
                } );

                lMessageItem$.prepend( lCloseBtn$ );

                this.messagesContainer$.append( lMessageItem$ );
            }
        },

        _addLegend: function() {
            const { title, cssClasses = "" } = this.options.legend;

            let out = util.htmlBuilder(),
                lLegendClasses = "a-MapRegion-legend " + cssClasses;

            out.markup( "<div" )
                .attr( "class", lLegendClasses.trim() )
                .attr( "id",  this.options.regionStaticId + "_legend" )
                .markup( ">" );

            if ( title ) {
                out.markup( this._getLegendTitle() );
            }

            out.markup( "</div>" );

            this.legendContainer$ = $( out.toString() );

            this._positionLegend();
        },

        _getLegendTitle: function() {
            let out = util.htmlBuilder();

            out.markup( "<div class='a-MapRegion-legendTitle' " )
               .attr( "id", this.options.regionStaticId + LEG_TTL_ID_SUFFIX )
               .markup( ">" )
               .markup( this.options.legend.title ) // Title is under development control, the server makes sure to send safe values. Widget should not escape it.
               .markup( "</div>" );

            return out.toString();
        },

        _positionLegend: function() {
            const { position, selector } = this.options.legend;

            if ( position === "start" ) {
                this.componentContainer$.prepend( this.legendContainer$ );
            } else if ( position === "end" ) {
                this.componentContainer$.append( this.legendContainer$ );
            } else if ( position === "selector" ) {
                $( selector ).append( this.legendContainer$ );
            }
        },

        // Add or update legend container if legend option is present
        _updateLegendContainer: function() {
            let o = this.options;

            if ( o.legend ) {
                const { title, cssClasses = "" } = o.legend;

                let lLegendClasses = "a-MapRegion-legend " + cssClasses,
                    lTitleContId = o.regionStaticId + LEG_TTL_ID_SUFFIX,
                    lTitleContainer$ = $( "#" + util.escapeCSS( lTitleContId ) ),
                    lItems$ = this.legendContainer$.find( "." + C_LEGEND_ITEM ),
                    lLabelledby;

                // Update css clases
                this.legendContainer$.removeClass();
                this.legendContainer$.addClass( lLegendClasses );

                if ( title ) {
                    // If title container does not exits create it
                    if ( lTitleContainer$.length === 0 ) {
                        this.legendContainer$.prepend( this._getLegendTitle() );

                        // Update labelledby attr in legend items
                        lItems$.each( function() {
                            lLabelledby = $( this ).attr( A_LBLBY ).split(" ");

                            // Items will be labelled by title label an it's own label
                            $( this ).attr( A_LBLBY, lTitleContId + " " + lLabelledby[0] );
                        } );
                    } else {
                        // If title container exists just update it.
                        // Title is under development control, the server makes sure to send safe values. Widget should not escape it.
                        lTitleContainer$.text( title );
                    }
                } else {
                    // If title option attr is not present
                    // and title container exists, remove title
                    if ( lTitleContainer$.length > 0 ) {
                        lTitleContainer$.remove();

                        // Update labelledby attr in legend items
                        lItems$.each( function() {
                            lLabelledby = $( this ).attr( A_LBLBY ).split(" ");

                            // Items will be labelled only by it's own label
                            // lLabelledby[1] = item label
                            $( this ).attr( A_LBLBY, lLabelledby[1] );
                        } );
                    }
                }

                this._positionLegend();
            } else {
                // Remove legend container if exists
                this._cleanUpLegend();
            }

            // Give container a chance to be resize first, then resize canvas
            setTimeout( () => {
                this._resize();
            }, 200 );
        },

        _getLegendColor: function( pSerie, pGeoJSONData, pDefaultColor ) {
            let lSpectrumColors = pGeoJSONData.spectrumColors,
                lLegendColor;

            // Only line layers use stroke color as the fill color
            if ( pGeoJSONData.layerType === LINES_LYR_TYPE ) {
                let lStrokeColor = getStrokeColor( pSerie, pSerie.features[0], false );

                lLegendColor = lStrokeColor ? lStrokeColor : pDefaultColor;
            }else { // Rest of layers will use either color spectrum or fill color
                if ( lSpectrumColors ) {
                    lLegendColor = lSpectrumColors[ lSpectrumColors.length - 1 ]; // Last color from color spectrum
                } else {
                    // If feats points have infividual fill colors.
                    // Get only the color from first feat point
                    let lFillColor = getFillColor( pSerie, pSerie.features[0] );

                    lLegendColor = lFillColor ? lFillColor : pDefaultColor;
                }
            }

            return lLegendColor;
        },

        _addLegendItem: function( pSerie, pLayerInfo, pGeoJSONData ) {
            let self = this,
                out = util.htmlBuilder(),
                lIconColor = self._getLegendColor( pSerie, pGeoJSONData, pLayerInfo.defaultColor ),
                lIconCssClasses = pLayerInfo.iconCssClasses,
                lLegendItemId = pSerie.id + LEGEND_ITEM_ID_SUFFIX,
                lLabelId = lLegendItemId + "_label",
                lCheckBoxId = lLegendItemId + "_checkbox",
                lLabelledby = "",
                lCheckbox$;

            // If legend title is present items icon will be labelled by title
            if ( this.options.legend.title ) {
                lLabelledby += this.options.regionStaticId + LEG_TTL_ID_SUFFIX;
            }

            // Items icon will be labelled by its own individual label too
            lLabelledby += " " + lLabelId;

            out.markup( "<div class='" + C_LEGEND_ITEM + "' " )
               .attr( "id", lLegendItemId )
               .attr( A_LBLBY, lLabelledby.trim() )
               .attr( "style", `${BACKGROUND_COLOR}:${lIconColor}` )
               .markup( ">" )
                   .markup( "<input type='checkbox' class='a-MapRegion-legendSelector is-checked' checked" )
                   .attr( "id", lCheckBoxId )
                   .markup( "/>" )
                   .markup( "<label  class='a-MapRegion-legendLabel' " )
                   .attr( "id", lLabelId )
                   .attr( "for", lCheckBoxId )
                   .markup( ">" )
                   .markup( pLayerInfo.label || util.escapeHTML( pLayerInfo.name ) );

            if ( lIconCssClasses ) {
                out.markup( "<span class='a-MapRegion-legendIcon " + lIconCssClasses + "' aria-hidden='true' ></span>");
            }

            out.markup( "</label></div>" );

            this.legendContainer$.append( out.toString() );

            lCheckbox$ = $( "#" + lCheckBoxId );

            if ( pSerie.allowHide ) {
                this.legendContainer$.find( "." + C_LEGEND_ITEM ).addClass( "a-MapRegion-legendItem--hideable" );

                lCheckbox$.on("keydown", function(e) {
                    // When item is selected by tab, only by pressing "Enter" key layer will be hidden/showed
                    if ( e.key === "Enter" ) {
                        lCheckbox$.prop( "checked", !lCheckbox$.is(':checked') ).trigger("change");
                    }
                } ).on("change", function() {
                    if ( this.checked ) {
                        // Display layer agains
                        self.map.setLayoutProperty( pSerie.id, VISIBILITY, LYR_VISIBLE );
                        // Set color legend items
                        $( this ).find(".a-MapRegion-legendSelector").addClass("is-checked");

                        // Refetch data if map position changed while layer was hidden
                        self._fetchOnMapDragged();
                        self._fetchOnZoomChanged();
                        self._fetchOnMapRotated();
                    } else {
                        // Hide layer
                        self.map.setLayoutProperty( pSerie.id, VISIBILITY, "none" );
                        // Remove color from legend item
                        $( this ).find(".a-MapRegion-legendSelector").removeClass("is-checked");
                        // Fix bug 32816875
                        // Close opened info windows
                        self.closeAllInfoWindows( pSerie.id );
                    }

                    self._fireMapChangedEvent( "toggle-layer" );
                } );
            } else {
                // If layer is not hideable checkbox won't change
                lCheckbox$.on( "click", function(e) {
                    e.preventDefault();
                } );
            }
        },

        // Fix for bug 35782600
        _hideLegendItem: function( layerId ) {
            let item$ = $( "#" + layerId + LEGEND_ITEM_ID_SUFFIX );

            if ( !item$.hasClass( C_HIDDEN ) ) {
                item$.addClass( C_HIDDEN );
            }
        },

        // Fix for bug 35782600
        _showLegendItem: function( layerId ) {
            $( "#" + layerId + LEGEND_ITEM_ID_SUFFIX ).removeClass( C_HIDDEN );
        },

        _addLayerHandlers: function( pSerie ) {
            let self = this,
                lLayerId = pSerie.id.toString();

            self.map.on( 'click', lLayerId, function(e) {
                // Multiple layer features can be placed on the same area
                // Only top layer will display info window
                if ( lLayerId === self.topLayer ) {
                    if ( e.features[0].properties.link ) {
                        self._redirect( e.features[0], e.lngLat );
                    } else {
                        self._showInfoWindow( e.features[0], e.lngLat, true );
                    }
                }
            } ).on( 'mousemove', lLayerId, function(e) {
                // Multiple layer features can be placed on the same area
                // Only top layer will display tooltip
                if ( lLayerId !== self.topLayer ) {
                    // Hide tooltip
                    self.tooltip.remove();

                    self.map.getCanvas().style.cursor = "";
                } else {
                    const {
                        infoWindow = {},
                        tooltip = {},
                        link,
                        cluster = false
                    } = e.features[0].properties;
                   /*
                    * Only set cursor to "pointer" if feat will display a popup or will redirect on click
                    * Tooltip will be displayed if feat has tooltip data or if point is a cluster.
                    * Info window will be displayed if feat has info window data.
                    * Also if rectangle zoom tool or distance tool are active do not update cursor
                    * these tools use "crosshair" cursor type when they are active.
                    */
                    if ( !self.distanceTool.isActive &&
                         !self.rectangleZoomTool.isActive &&
                         ( !isEmptyObj( infoWindow ) || !isEmptyObj( tooltip ) || cluster || link ) ) {
                        self.map.getCanvas().style.cursor = POINTER;
                    }

                    self._showTooltip( pSerie, e.features[0], e.lngLat, true );
                }
            } ).on( 'mouseleave', lLayerId, function() {
                // If rectangle zoom tool or distance tool are active do not update cursor,
                // this tools use "crosshair" cursor type when they are active
                if ( !self.rectangleZoomTool.isActive && !self.distanceTool.isActive ) {
                    self.map.getCanvas().style.cursor = "";
                }

                self.tooltip.remove();
            } );
        },

        _showTooltip: function( pSerie, pFeat, pLngLat, pFocusAfterOpen ) {
            let out = util.htmlBuilder(),
                lLayerInfo = this._getLayerInfo( pSerie.id ),
                lCoordinates = [],
                lTmpltOps = {};

            const C_POPUP_STYLES = `${C_CL_POPUP} ${C_TOOLTIP}`,
                { label, name } = lLayerInfo;

            if ( !pFeat.properties.cluster ) {
                let lTooltip = pFeat.properties.tooltip;

                if ( isString( lTooltip ) ) {
                    // Server will send tooltip as JSON, but user can also
                    // add or update layer features with js API, so we
                    // need to make sure that JSON is well-formed.
                    lTooltip = parseJSON( lTooltip );
                }

                if ( lTooltip ) {
                    let lContent = lTooltip.content;

                    if ( lContent ) {
                        // Advanced formatting popup
                        if ( lTooltip.type === POPUP_ADV_FMT && lContent.template ) {
                            const { cssClasses = "", template } = lContent;

                            let lCssClasses = `${C_POPUP_STYLES} ${util.applyTemplate(cssClasses, { directives: false,
                                                                                                    defaultEscapeFilter: "RAW" } ) }`;
                                                                 // css classes supports substitutions,
                                                                 // in case an item is used we replace its value.

                            out.markup("<div")
                               .attr("class", lCssClasses.trim())
                               .markup(">")
                                   .markup( template )
                               .markup("</div>");

                            lTmpltOps = {
                                extraSubstitutions: { ...lTooltip.columns }
                            };
                        } else if ( lTooltip.type === POPUP_TITLE_BODY ) { // Title column popup
                            let lLabel = lang.formatMessageNoEscape( MSG_PREFIX + "LAYER_NAME", label || name );

                            out.markup("<div class='"+ C_POPUP_STYLES +"'>")
                               .markup("<div class='"+ C_POPUP_TITLE +"'>");

                            // Label will be a html expression itself, this is  under the developers control.
                            if ( label ) {
                                out.markup( lLabel );
                            } else {
                                out.content( lLabel );
                            }

                            out.markup("</div><div class='"+ C_POPUP_CONTENT +"'>")
                                .content(lContent)
                            .markup("</div></div>");
                        }
                    }
                }
            } else { // If point is a cluster display points count
                let lPointCount = locale.formatCompactNumber( pFeat.properties.point_count );

                const { clusterTooltip } = pSerie.clusterFeatures;

                if ( clusterTooltip ) {
                    // Cluster tooltip is a HTML expression.
                    // Users will use &LAYER. and &COUNT. placeholders to
                    // reference the layer name and the amount of feat points in the cluster.
                    lTmpltOps = {
                        extraSubstitutions: {
                            COUNT: lPointCount,
                            LAYER: label || util.escapeHTML( name )
                        },
                        defaultEscapeFilter: "RAW" // Don't escape because users can customize layer label,
                                                   // so label will be a html expression itself, this is under the developers control.
                    };

                    out.markup("<div class='"+ C_POPUP_STYLES +"'>")
                           .markup( clusterTooltip )
                       .markup("</div>");
                } else {
                    let lLabel = lang.formatMessageNoEscape( MSG_PREFIX + "LAYER_NAME", label || name );

                    out.markup("<div class='"+ C_POPUP_STYLES +"'>")
                            .markup("<div class='"+ C_POPUP_TITLE +"'>");

                    // Label will be a html expression itself, this is under the developers control.
                    if ( label ) {
                        out.markup( lLabel );
                    } else {
                        out.content( lLabel );
                    }

                    out.markup("</div><div class='"+ C_POPUP_CONTENT +"'>")
                           .content( lang.formatMessage( MSG_PREFIX + "POINTS_COUNT", lPointCount ) )
                       .markup("</div></div>");
                }
            }

            if ( out.html ) {

                lCoordinates = this._getPopupCoords( pFeat, pLngLat );

                // Points tooltip will be displayed at the bottom
                // and for lines, polygons, multipolygons and extruded tooltip will be displayed as default
                this.tooltip.options.anchor = this._getAnchor(
                    isPoint( pFeat.geometry.type ) ? "top" : "bottom",
                    {
                        lng: lCoordinates[0],
                        lat: lCoordinates[1]
                    }
                );
                this.tooltip.options.focusAfterOpen = pFocusAfterOpen;

                this.tooltip.setLngLat( lCoordinates )
                    .setHTML( util.applyTemplate( out.toString(), lTmpltOps ) )
                    .addTo( this.map );

            }
        },

        _showInfoWindow: function( pFeat, pLngLat, pFocusAfterOpen ) {
            let lProps = $.extend( {} ,pFeat.properties ),
                lCoordinates = this._getPopupCoords( pFeat, pLngLat ),
                lTmpltOps = {};

            // Clusters do not have info window data
            if ( !lProps.cluster ) {
                // Image id is not required in payload
                delete lProps.imageId;

                // If distance tool is active and user click on a feat point
                // do not display info window or redirect
                if ( !this.distanceTool.isActive ) {
                    let lInfoWindow = lProps.infoWindow;

                    if ( isString( lInfoWindow ) ) {
                        // Server will send infoWindow as JSON, but user can also
                        // add or update layer features with js API, so we
                        // need to makes sure that JSON is well formed.
                        lInfoWindow = parseJSON( lInfoWindow );
                    }

                    // Only add popup if info window is not empty
                    if ( lInfoWindow && lInfoWindow.type ) {
                        let out = util.htmlBuilder(),
                            lContent = lInfoWindow.content;

                        const C_POPUP_STYLES = `${C_CL_POPUP} ${C_INFO_W}`;

                        // Advanced formatting popup
                        if ( lInfoWindow.type === POPUP_ADV_FMT ) {
                            const { cssClasses = "", template } = lContent;

                            if ( template ) {
                                let lCssClasses = `${C_POPUP_STYLES} ${util.applyTemplate( cssClasses, { directives: false,
                                                                                                         defaultEscapeFilter: "RAW" } ) }`;
                                                                                           // css classes supports substitutions,
                                                                                           // in case an item is used we replace its value.

                                out.markup("<div")
                                   .attr("class", lCssClasses.trim())
                                   .markup(">")
                                       .markup( template )
                                   .markup("</div>");

                                lTmpltOps = {
                                    extraSubstitutions: { ...lInfoWindow.columns }
                                };
                            }
                        } else if ( lInfoWindow.type === POPUP_TITLE_BODY ) { // Title and body columns popup

                            out.markup("<div class='"+ C_POPUP_STYLES +"'>");

                            if ( lContent.title ) {
                                out.markup("<div class='"+ C_POPUP_TITLE +"'>")
                                   .content( lContent.title )
                                   .markup("</div>");
                            }

                            if ( lContent.body ) {
                                out.markup("<div class='"+ C_POPUP_CONTENT +"'>")
                                   .content( lContent.body )
                                   .markup("</div>");
                            }

                            out.markup("</div>");
                        }

                        if ( out.html ) {
                            let lLayerInfo = this._getLayerInfo( parseInt( pFeat.layer.id, 10 ) ),
                                popup = new maplibregl.Popup( { // Create popoup and set msg
                                closeOnClick: true,
                                focusAfterOpen: pFocusAfterOpen,
                                anchor: this._getAnchor(
                                    isPoint( pFeat.geometry.type ) ? "top" : "bottom",
                                    {
                                        lng: lCoordinates[0],
                                        lat: lCoordinates[1]
                                    }
                                )
                            } ).setLngLat( lCoordinates )
                                .setHTML( util.applyTemplate( out.toString(), lTmpltOps ) )
                                .addTo( this.map );

                            // Replace close button content
                            $( popup.getElement() )
                                .find( ".maplibregl-popup-close-button" )
                                .html("<span class='a-Icon icon-remove' aria-hidden='true'>");

                            // Only if feat has an id we can store and open multiple popups
                            if ( lProps.id ) {
                                lLayerInfo.activePopups[lProps.id] = popup;

                                // Remove popup from activePopups once info window is closed.
                                popup.on('close', function() {
                                    delete lLayerInfo.activePopups[lProps.id];
                                } );
                            } else {
                                if ( !isEmptyObj( lLayerInfo.activePopups ) ) {
                                    lLayerInfo.activePopups.infoWindow.remove();
                                }
                                lLayerInfo.activePopups.infoWindow = popup;
                            }
                        }
                    }
                }
            } else {
                // These properties are not needed on event payload.
                delete lProps.cluster; // If point is a cluster, seems redundant to send this prop (cluster = true).
                delete lProps.point_count_abbreviated; // We only send the number of original points grouped into the cluster (point_count)
            }

            // Fire event for dynamic action
            this._trigger( EVENT_MAP_OBJ_CLICKED, {}, {
                ...lProps,
                lng: lCoordinates[0],
                lat: lCoordinates[1],
                layer: pFeat.layer.id // Bug fix 35158810
            } );
            // Payload object with the feature attributes ("columns" sub object)
            // plus the coordinates of the mouse pointer
        },

        // Bug fix 32816757
        _getAnchor: function( pDefaultAnchor, pLngLat ) {
            let lPos = this.map.project( pLngLat ),
                lMapContainer =  this.map.getContainer();

            const C_MAP_PADDING = 100;

            // If point is inside map padding we return an "empty" anchor value
            // maplibre will set the anchor val dynamically, this way we avoid cut-off the popup when point is too close to map's edge
            if ( lPos.x < C_MAP_PADDING ||
                lPos.x > lMapContainer.offsetWidth - C_MAP_PADDING ||
                lPos.y < C_MAP_PADDING ||
                lPos.y > lMapContainer.offsetHeight - C_MAP_PADDING ) {
                return "";
            }

            return pDefaultAnchor;
        },

        _redirect: function( pFeat, pLngLat ) {
            let lProps = $.extend( {} ,pFeat.properties ),
                lCoordinates = this._getPopupCoords( pFeat, pLngLat );

            // Image id is not required in payload
            delete lProps.imageId;

            // Fire event for dynamic action.
            // Payload object with the feature attributes ("columns" subobject)
            // plus the coordinates of the mouse pointer
            this._trigger( EVENT_MAP_OBJ_CLICKED, {}, {
                ...lProps,
                lng: lCoordinates[0],
                lat: lCoordinates[1]
            } );

            apex.navigation.redirect( lProps.link );
        },

        _getPopupCoords: function( pFeat, pLngLat ) {
            let lCoordinates = [];
            // Only points contain single [lng,lat] array
            if ( pFeat.geometry.type === POINTS_GEOM_TYPE ) {
                lCoordinates = pFeat.geometry.coordinates.slice();

                if ( pLngLat ) {
                    // Bug 32586630 fix.
                    // Ensure that if the map is zoomed out such that multiple
                    // copies of the feature are visible, the popup appears
                    // over the copy being pointed to.
                    while( Math.abs( pLngLat.lng - lCoordinates[0]) > 180 ) {
                        lCoordinates[0] += pLngLat.lng > lCoordinates[0] ? 360 : -360;
                    }
                }
            } else {
                // For all other geometry types we will use current cursor coordinates
                lCoordinates[0] = pLngLat.lng;
                lCoordinates[1] = pLngLat.lat;
            }

            return lCoordinates;
        },

        _getLayerInfo: function( pLayerId ) {
            let lIndex = this.options.layers.findIndex( layer => layer.id === pLayerId );

            return this.options.layers[ lIndex ];
        },

        _cleanupMessages: function() {
            if ( this.messagesContainer$ ) {
                this.messagesContainer$.empty();
                this.messagesContainer$.remove();
                this.messagesContainer$ = null;
            }
        },

        _cleanUpLegend: function() {
            if ( this.legendContainer$ ) {
                this.legendContainer$.remove();
                this.legendContainer$ = null;
            }
        },

        _cleanupSessionStore: function() {
            [ ZOOM_KEY, LNG_KEY, LAT_KEY, PITCH_KEY, BEARING_KEY ].forEach( x => { this.sessionStore.removeItem( x ); } );
        },
        _destroy: function() {
            if ( this.componentContainer$ ) {
                this.componentContainer$.empty();
                this.componentContainer$.remove();
            }

            this._cleanupMessages();

            widgetUtil.offElementResize( util.escapeCSS( this.mapContainerId ) );
            widgetUtil.offVisibilityChange( this.regionContainer$[0] );
        },
        _clean: function( pDestroySession ) {
            this._destroy();
            this._cleanUpLegend();
            this._removeOverviewMap();

            if ( this.map ) {
                // Clean up and release all internal resources associated with this map.
                // This includes DOM elements, event bindings, web workers, and WebGL resources.
                this.map.remove();
                this.map = null;
            } else {
                debug.warn( MAP_NOT_READY_MSG );
            }

            this.topLayer = null;
            this.layersIds = [];
            this.svgStyles = NATIVE_SVG_SHAPES;
            this.lastMapStatusOnFetch = {};
            this.colorNumDef = 0;
            this.setDefaultColor = false;

            this.tooltip.remove();

            // clean up all tools
            this.rectangleZoomTool = {};
            this.navControl = null;
            this.scaleBar = null;
            this.browserLocationTool = null;
            this.circleTool = null;
            this.distanceTool = {};
            this.attribution = null;
            this.toggleDimensionsCtrl = null;

            // To reset map we need to "destroy" map first
            // but there are some cases when map will be reset but keeping
            // current map position, for example, when user updates tile layer
            // using _setOption, widget needs to reset map preserving position
            if ( pDestroySession ) {
                this._cleanupSessionStore();
            }
        },

        _reset: function( pResetPosition ) {
            this._clean( pResetPosition );
            this._setSessionStoreInitPos( !pResetPosition );
            this._render();
            this._initMap( pResetPosition );
        },

        _setOption: function ( key, value ) {
            let o = this.options;

             this._super( key, value );

            // Update the tile layer on map
            if ( key === "tileLayer" && !isEmptyObj( value ) ) {
                const { name, darkmodeName } = value;

                if ( name ) {
                    o.tileLayer.name = name;

                    if ( this.map && !isDarkMode() ) {
                       /* If we just update tile layer using map.setStyle
                        * maplibre will remove data sources and layers,
                        * we need to "reset" map region to add sources, layers and tools again,
                        * and to avoid duplicate legend items and messages
                        */
                        this._reset( false );
                    }
                }

                if ( darkmodeName ) {
                    o.tileLayer.darkmodeName = darkmodeName;

                    if ( this.map && isDarkMode() ) {
                            this._reset( false );
                        }
                }
            } else if ( key === "navigationBar" && !isEmptyObj( value ) ) {
                o.navigationBar = value;

                if ( this.map ) {
                    if ( o.navigationBar.type ) {
                        // Remove current Nav Control
                        this._removeNavControl();
                        this._addNavControl( o.navigationBar.type );
                    }

                    if ( o.navigationBar.position ) {
                        this._setNavControlPosition( o.navigationBar.position );
                    }
                }
            } else if ( key === "mapFeatures" && !isEmptyObj( value ) ) {
                const { rectangleZoom,
                        scaleBar,
                        overviewMap,
                        infiniteMap,
                        browserLocation,
                        circleTool,
                        distanceTool,
                        mousewheelZoom } = value;

                if ( isBoolean( rectangleZoom ) ) {
                    o.mapFeatures.rectangleZoom = rectangleZoom;

                    if ( this.map ) {
                        if ( rectangleZoom ) {
                            this._addRectangleTool();
                        } else {
                            // Only remove if tool exists
                            if ( !isEmptyObj( this.rectangleZoomTool ) ) {
                                this.map.removeControl( this.rectangleZoomTool );
                                this.rectangleZoomTool = {};
                            }
                        }
                    }
                }

                if ( isBoolean( scaleBar ) ) {
                    o.mapFeatures.scaleBar = scaleBar;

                    if ( this.map ) {
                        if ( scaleBar ) {
                            this._addScaleTool();
                        } else {
                            // Only remove if tool exist
                            if ( this.scaleBar ) {
                                this.map.removeControl( this.scaleBar );
                                this.scaleBar = null;
                            }
                        }
                    }
                }

                if ( isBoolean( overviewMap ) ) {
                    o.mapFeatures.overviewMap = overviewMap;

                    if ( this.map ) {
                        if ( overviewMap ) {
                            this._addOverviewMap();
                        } else {
                            this._removeOverviewMap();
                        }
                    }
                }

                if ( isBoolean( infiniteMap ) ) {
                    if ( this.map ) {

                        o.mapFeatures.infiniteMap = infiniteMap;

                        this.map.setRenderWorldCopies( infiniteMap );

                        if ( this.overViewMap ) {
                            let lCenter = this.map.getCenter();
                            // Update center of overview map
                            this.overViewMap.setCenter( lCenter );
                            // Update position of highlighted area on overview map
                            this.overviewSquare.setLngLat( lCenter );
                        }
                    }
                }

                if ( isBoolean( browserLocation ) ) {
                    o.mapFeatures.browserLocation = browserLocation;

                    if ( this.map ) {
                        if ( browserLocation ) {
                            this._addBrowserLocation();
                        } else {
                            if ( this.browserLocationTool ) {
                                this.map.removeControl( this.browserLocationTool );
                                this.browserLocationTool = null;
                            }
                        }
                    }
                }

                if ( isBoolean( circleTool ) ) {
                    o.mapFeatures.circleTool = circleTool;

                    if ( this.map ) {
                        if ( circleTool ) {
                            this._addCircleTool();
                        } else {
                            if ( this.circleTool ) {
                                // If a circle was drawn remove it
                                this.circleTool.removeCircleLayer();
                                // Remove "circledrawn"and "circleremoved" events
                                $( this.circleTool.container ).off( EVENT_CIRCLE_DRAWN );
                                $( this.circleTool.container ).off( EVENT_CIRCLE_REMOVED );
                                // Remove control from map
                                this.map.removeControl( this.circleTool );

                                this.circleTool = null;
                            }
                        }
                    }
                }

                if ( isBoolean( distanceTool ) ) {
                    o.mapFeatures.distanceTool = distanceTool;

                    if ( this.map ) {
                        if ( distanceTool ) {
                            this._addDistanceTool();
                        } else {
                            if ( !isEmptyObj( this.distanceTool ) ) {
                                if ( this.distanceTool.isActive ) {
                                    this.distanceTool.deactivate();
                                }
                                this.map.removeControl( this.distanceTool );
                                this.distanceTool = {};
                            }
                        }
                    }
                }

                if ( isBoolean( mousewheelZoom ) ) {
                    o.mapFeatures.mousewheelZoom = mousewheelZoom;

                    if ( this.map ) {
                        if ( mousewheelZoom ) {
                            this.map.scrollZoom.enable();
                        } else {
                            this.map.scrollZoom.disable();
                        }
                    }
                }
            } else if ( key === "layerMessages" && isObject( value ) ) { // value = { position: "top"|"bottom"|"selector", selector: "#myMessages" }
                if ( !isEmptyObj( value )  ) {
                    const { position, selector } = value;

                    if ( position ) {
                        o.layerMessages = {
                            position,
                            selector
                        };

                        if ( this.map ) {
                            this._addMessagesContainer();
                        }
                    }
                } else {
                    this._cleanupMessages();
                    o.layerMessages = null;
                }
            } else if ( key === "mapUnitSystem" && isString( value ) ) { // value = "metric" | "imperial"
                let lUnitSystem = value.toLowerCase();

                // Only update unit if it's metric or imperial
                if ( UNIT_SYSTEMS[ lUnitSystem ] ) {
                    o.mapUnitSystem = lUnitSystem;

                    if ( this.map ) {
                        // Update tools values
                        if ( this.scaleBar ) {
                            this.scaleBar.setUnit( lUnitSystem );
                        }

                        if ( !isEmptyObj( this.distanceTool ) ) {
                            this.distanceTool.setUnit( lUnitSystem );
                        }

                    }
                }
            } else if (  key === "mapStatusItem" && isString( value ) ) {  // value = item name
                o.mapStatusItem = util.escapeCSS( value );
            } else if (  key === "customStyles" && isObject( value ) ) { // value = array of objects
                o.customStyles = value;

                this._addCustomSvgStyles( value );
            } else if ( key === "legend" && isObject( value ) ) {
               /*
                * If user set value as an empty obj or null we set legend opt to null
                * value = { position: "start"|"end"|"selector",
                *           cssClasses: "myClass",
                *           title: "Layers",
                *           selector:"#legend" }
                */
                o.legend = !isEmptyObj( value ) ? value : null;

                if ( this.map ) {
                    if ( o.legend ) {
                        if ( o.legend.title ) {
                            o.legend.title = util.escapeHTML( value.title );
                        }
                        // If legend exists, just update it
                        if ( this.legendContainer$ ) {
                            this._updateLegendContainer();
                        } else {
                            this._addLegend();

                            // Give container a chance to be resize first,
                            // then resize canvas
                            setTimeout( () => {
                                this._resize();
                            }, 200 );

                            // If legend did not exists we need to add legend items
                            o.mapData.map.series.forEach( serie => {
                                // Only add item if layer attr "Display in Legend" was set to true
                                if ( serie.legend ) {
                                    let lLayerSource = this.map.getSource( serie.id.toString() + SOURCE_SUFFIX );

                                    // If layer source exists add item
                                    if ( lLayerSource  ) {
                                        this._addLegendItem( serie, this._getLayerInfo( serie.id ), lLayerSource._data );
                                    }
                                }
                            } );
                        }
                    } else {
                        // If legend obj is empty and legend exist, remove it
                        if ( this.legendContainer$ ) {
                            // In case any layer has been hidden update visibility.
                            o.mapData.map.series.forEach( serie => {
                                let lSerieId = serie.id.toString();

                                if ( !this._isVisibleLayer( lSerieId ) && this.map.getLayer( lSerieId ) ) {
                                    this.map.setLayoutProperty( lSerieId, VISIBILITY, LYR_VISIBLE );
                                }
                            } );

                            this._updateLegendContainer();
                        }
                    }
                }
            }
        },

        _addNavControl: function ( pType ) {
            if ( pType !== "none" ) {
                let lShowZoom = ( pType === "full" || pType === "no-compass" ),
                    lShowCompass = ( pType === "full" ),
                    lPosition = this.options.navigationBar.position;

                this.navControl = new maplibregl.NavigationControl( {
                    showZoom: lShowZoom,
                    showCompass: lShowCompass
                } );

                this.map.addControl( this.navControl, lPosition );

                if ( lPosition === "top-left" ) {
                    $( '#' + util.escapeCSS( this.mapContainerId ) ).addClass( C_NAV_BAR_POS );
                }

                // Update title and aria-label attrs from control buttons
                // so we have full control on translations.
                // Give control a chance to be added to DOM
                setTimeout( () => {
                    let lControlContainer$ = $( this.navControl._container );

                    if ( lShowCompass ) {
                        let lBtnZoomInLabel = getMessage( "ZOOM_IN" ),
                            lBtnZoomOutLabel = getMessage( "ZOOM_OUT" );

                        lControlContainer$.find( ".maplibregl-ctrl-zoom-in" ).attr( {
                            "title": lBtnZoomInLabel,
                            "aria-label": lBtnZoomInLabel
                        } );

                        lControlContainer$.find( ".maplibregl-ctrl-zoom-out" ).attr( {
                            "title": lBtnZoomOutLabel,
                            "aria-label": lBtnZoomOutLabel
                        } );
                    }

                    if ( lShowCompass ) {
                        let lBtnCompassLabel = getMessage( "RESET_BEARING_TO_NORTH" );

                        lControlContainer$.find( ".maplibregl-ctrl-compass" ).attr( {
                            "title": lBtnCompassLabel,
                            "aria-label": lBtnCompassLabel
                        } );
                    }
                }, 200 );
            }
        },

        _setNavControlPosition: function ( pPosition ) {
            if ( this.navControl ) {
                let lMapContainer$ = $( '#' + util.escapeCSS( this.mapContainerId ) );
                if ( pPosition === "top-left" ) {
                    if ( !lMapContainer$.hasClass() ) {
                        lMapContainer$.addClass( C_NAV_BAR_POS );
                    }
                } else {
                    lMapContainer$.removeClass( C_NAV_BAR_POS );
                }
                this.options.navigationBar.position = pPosition;
                this._removeNavControl();
                this._addNavControl( this.options.navigationBar.type );
            }
        },

        _addRectangleTool: function () {
            // Only add if tool does not exists
            if ( isEmptyObj( this.rectangleZoomTool ) ) {
                this.rectangleZoomTool = new RectangleZoomTool( {
                    scopedActions: this.scopedActions
                } );
                this.map.addControl( this.rectangleZoomTool );
            }
        },

        _addScaleTool: function () {
            if ( !this.scaleBar ) {
                this.scaleBar = new maplibregl.ScaleControl( {
                    maxWidth: 100,
                    unit: this.options.mapUnitSystem
                } );
                this.map.addControl( this.scaleBar );
            }
        },

        _addBrowserLocation: function () {
            if ( !this.browserLocationTool ) {
                let lBtnLocationLabel = getMessage( "FIND_MY_LOCATION" );

                this.browserLocationTool = new maplibregl.GeolocateControl( {
                    positionOptions: {
                        enableHighAccuracy: true
                    },
                    trackUserLocation: true, // If true control becomes a toggle button and when active the map will receive updates to the user's location
                } );
                // Add geolocate control to the map.
                this.map.addControl( this.browserLocationTool );

                // Update title and aria-label attrs from control button
                // so we have full control on translations.
                // Give control a chance to be added to dom
                setTimeout( () => {
                    $( this.browserLocationTool._container ).find( ".maplibregl-ctrl-geolocate" ).attr( {
                        "title": lBtnLocationLabel,
                        "aria-label": lBtnLocationLabel
                    } );
                }, 200 );
            }
        },

        _addCircleTool: function () {
            if ( !this.circleTool ) {
                this.circleTool = new CircleTool( {
                    scopedActions: this.scopedActions
                } );
                this.map.addControl( this.circleTool );

                $( this.circleTool.container ).on( EVENT_CIRCLE_DRAWN, ( event, circle ) => {
                    this._fireMapChangedEvent( "circle-drawn", circle );
                } );
                $( this.circleTool.container ).on( EVENT_CIRCLE_REMOVED, () => {
                    this._fireMapChangedEvent( "circle-removed" );
                } );
            }
        },

        _addDistanceTool: function () {
            if ( isEmptyObj( this.distanceTool ) ) {
                let o = this.options;

                this.distanceTool = new DistanceTool( {
                    tileLayer: o.tileLayer,
                    unitSystem: o.mapUnitSystem
                } );
                this.map.addControl( this.distanceTool );
            }
        },

        _addCustomSvgStyles: function ( pCustomStyles ) {
            // If custom styles are string parse to array to access shapes objects.
            // When server returns custom styles, they are returned as a string.
            if ( isString( pCustomStyles ) ) {
                pCustomStyles = parseJSON( pCustomStyles );
            }

            if ( pCustomStyles ) {
                if ( Array.isArray( pCustomStyles ) ) {
                    // Ensure custom styles are stored as an array
                    this.options.customStyles = pCustomStyles;

                    // Add custom styles to list of svg styles
                    for ( let i = 0; i < pCustomStyles.length; i++ ) {
                        if ( pCustomStyles[i].name ) {
                            this.svgStyles[ pCustomStyles[i].name ] = pCustomStyles[i];
                        }
                    }
                } else {
                    debug.error( "Custom SVG styles must be an array of objects." );
                }
            }
        },

        _addOverviewMap: function () {
            if ( !this.overViewMap ) { // Only create overview map if it does not exist
                const { pitch, bearing } = this.getMapPitchAndBearing();

                const { minZoom } = this._getMinMaxZoomLevels();

                let o = this.options,
                    lOverviewMapId = util.escapeCSS( o.regionStaticId ) + "_overview_map",
                    lSquare = document.createElement( "div" ),
                    lMapCenter = this.map.getCenter(),
                    lZoom = this.map.getZoom(),
                    lOverviewZoom = ( lZoom - ZOOM_FACTOR ), // Square has a static width and height. We need a zoom factor of 3 between overview map and main map so square can highlight the current map's bbox.
                    lMapLibreOpts = {
                        container: lOverviewMapId,
                        dragPan: false,
                        keyboard: false,
                        scrollZoom: false,
                        dragRotate: false,
                        touchZoomRotate: false,
                        doubleClickZoom: false,
                        center: lMapCenter, // Init map position [lng, lat]
                        zoom: lOverviewZoom,
                        attributionControl: false,
                        transformRequest: getTransformRequestCallback( o ),
                        pitch,
                        bearing,
                        locale: {
                            'Map.Title': getMessage( "MAP" )
                        }
                    };

                ( async () => {

                    lMapLibreOpts.style = await this._getElocation(); // Stylesheet location

                    this.overViewMapCont$ = $( "<div id='" + lOverviewMapId + "' class='a-MapRegion-overview'></div>" );

                    $( '#' + util.escapeCSS( this.mapContainerId ) ).append( this.overViewMapCont$ );

                    this.overViewMap = new maplibregl.Map( lMapLibreOpts );

                    $( this.overViewMap.getCanvas() ).css( "cursor", "default" );

                    lSquare.className = "a-MapRegion-overviewSquare";

                    // Highlighted area in overview map
                    this.overviewSquare = new maplibregl.Marker( { element: lSquare } )
                        .setLngLat( lMapCenter )
                        .addTo( this.overViewMap );

                    // Set map zoom out limit
                    this.map.setMinZoom( minZoom + 3 );
                    this.overViewMap.setMinZoom( minZoom );
                })();
            }
        },

        _removeOverviewMap: function () {
            if ( this.overViewMap ) {
                const { minZoom } = this._getMinMaxZoomLevels();

                // Remove instance
                this.overViewMap.remove();
                this.overViewMap = null;

                // Remove overview map container
                this.overViewMapCont$.remove();
                this.overViewMapCont$ = null;

                // Set map zoom out limit
                this.map.setMinZoom( minZoom );
            }
        },

        _removeNavControl: function () {
            if ( this.navControl ) {
                $( '#' + util.escapeCSS( this.mapContainerId ) ).removeClass( C_NAV_BAR_POS );
                this.map.removeControl( this.navControl );
                this.navControl = null;
            }
        },

        _fetch: function ( increaseBbox, callback ) {
            if ( this.map ) {
                let p,
                    o = this.options,
                    lItemsToSubmit;

                if ( o.itemsToSubmit ) {
                    // Remove "#" from page items and convert to array
                    lItemsToSubmit = o.itemsToSubmit.replaceAll( "#","" );
                    lItemsToSubmit = lItemsToSubmit.split( "," );
                }

                this.lastMapStatusOnFetch = this.getMapStatus();
                this.lastMapStatusOnFetch.center = this.map.getCenter();

                // Request a larger bbox to avoid fetch when "small" changes on map position occurs
                if ( increaseBbox ) {
                    let lIncrement = 20; // 20 degrees is the max bbox increment

                    // Increment will be different for each zoom level
                    // Zoom level 1 -> increment = 20
                    // Zoom level 2 -> increment = 10
                    // Zoom level 3 -> increment = 5 and so on ...
                    lIncrement /= Math.pow( 2, this.lastMapStatusOnFetch.zoom - 1 );

                    this.lastMapStatusOnFetch.bbox[ 0 ] -= lIncrement; // West
                    this.lastMapStatusOnFetch.bbox[ 1 ] -= lIncrement; // South
                    this.lastMapStatusOnFetch.bbox[ 2 ] += lIncrement; // East
                    this.lastMapStatusOnFetch.bbox[ 3 ] += lIncrement; // North
                }

                // AJAX call to plugin
                p = apex.server.plugin( o.ajaxIdentifier, {
                    pageItems: lItemsToSubmit,
                    x01: "GET_FEATURES",
                    x02: JSON.stringify( {
                        bbox: this.lastMapStatusOnFetch.bbox,
                        zoom: Math.round( this.lastMapStatusOnFetch.zoom ) // Round zoom level so server returns layers data a little before layers min or max zoom levels.
                    } )
                }, {
                    dataType: "json",
                    loadingIndicatorPosition: "centered",
                    refreshObject: "#" + util.escapeCSS( o.regionStaticId ),
                    loadingIndicator: this.element,
                    queue: { name: "map-features-" + o.regionStaticId, action: "replace" }
                } );

                p.done( data => {
                    this.options.mapData = { ...data }; // Set series and bbox
                    // Update layers
                    this._addLayers();
                } );
                p.always( () => {
                    if ( callback ) {
                        callback();
                    }
                } );

                return p;
            } else {
                debug.warn( MAP_NOT_READY_MSG );
            }
        },
        _fitBounds: function ( pBbox, pMaxZoom ) {
            if ( this.map && pBbox ) {
                let lCoordinates = [
                    [ pBbox[ 0 ], pBbox[ 1 ] ],
                    [ pBbox[ 2 ], pBbox[ 3 ] ]
                ],
               /* Pass the first coordinates in the LineString to `lngLatBounds` &
                * wrap each coordinate pair in `extend` to include them in the bounds
                * result. A variation of this technique could be applied to zooming
                * to the bounds of multiple Points or Polygon geomteries - it just
                * requires wrapping all the coordinates with the extend method.
                */
                lBounds = lCoordinates.reduce( function ( bounds, coord ) {
                    return bounds.extend( coord );
                }, new maplibregl.LngLatBounds( lCoordinates[ 0 ], lCoordinates[ 0 ] ) );

                // In case there are extruded layers, give widget a chance to tilt map first
                setTimeout( () => {
                    // Go to middle point in the map
                    this.map.fitBounds( lBounds, {
                        padding: 20,
                        maxZoom: ( !pMaxZoom ? DEFAULT_MAX_ZOOM : pMaxZoom )
                    } );
                }, 200 );
            }
        },

        _getSerie: function ( pSerieId ) {
            let lSeries = this.options.mapData.map.series,
                lSerieIndex = lSeries.findIndex( serie => serie.id === pSerieId );

            return lSeries[ lSerieIndex ];
        },

        _resize: function () {
            // Resize canvas
            if ( this.map ) {
                this.map.resize();
            }

            if ( this.overViewMap ) {
                this.overViewMap.resize();
            }
        },

      /**
        * <p>Update map layers data. If map initialization has not been completed region can't be refreshed.</p>
        *
        * @example <caption>This example make an ajax request to server to update layers data.</caption>
        * apex.region( "regionId" ).refresh();
        */
        refresh: function () {
            return this._fetch();
        },
      /**
       * <p>Focus the map</p>
       * @example <caption>This example focus the map.</caption>
       * apex.region( "regionId" ).focus();
       */
        focus: function () {
           $( "#" + util.escapeCSS( this.mapContainerId ) ).find( ".maplibregl-canvas" ).first().trigger( "focus" );
        },
      /**
        * Returns layers objects array.
        *
        * @example <caption>This example gets all the layers objects.</caption>
        * apex.region( "regionId" ).getLayers();
        *
        * @return {Object[]} An array of objects containing layers information.
        */
        getLayers: function () {
            let lLayers = $.extend( true, [], this.options.layers );

            // We don't need to return the activePopups object
            for ( let i = 0; i < lLayers.length; i++ ) {
                delete lLayers[ i ].activePopups;
            }

            return lLayers;
        },
      /**
        * <p>Returns layer id. If no layer name is given return null.</p>
        *
        * @param {string} pName Layer name.
        * @example <caption>This example gets the id of the specified layer.</caption>
        * apex.region( "regionId" ).getLayerIdByName( "earthquakes" );
        *
        * @return {number} Layer ID.
        */
       getLayerIdByName( pName ) {
           let Layers = this.options.layers,
               lIndex = Layers.findIndex( layer => layer.name === pName );

            return lIndex > -1 ? Layers[ lIndex ].id : null;
       },
      /**
        * <p>Returns feature object from layer. If no layer id or feature id are given return empty object.</p>
        *
        * @param {number} pLayerId Id of layer.
        * @param {string} pFeatureId Id of feature.
        * @example <caption>This example gets the specified feature object.</caption>
        * apex.region( "regionId" ).getFeature( apex.region( "regionId" ).getLayerIdByName( "earthquakes" ), "0i97th6465" );
        *
        * @return {Object} An object containing feature properties.
        */
        getFeature: function ( pLayerId, pFeatureId ) {
            let lSerie = this._getSerie( pLayerId ),
                lFeature = {};

            if ( lSerie ) {
                let lFeatures = lSerie.features,
                    lFeatIndex = lFeatures.findIndex( feat => feat.id === pFeatureId );

                if ( lFeatures[ lFeatIndex ] ) {
                    lFeature = lFeatures[ lFeatIndex ];
                } else {
                    debug.error( INVALID_FEATURE_ID_MSG );
                }
            } else {
                debug.error( INVALID_LAYER_ID_MSG );
            }

            return lFeature;
        },
      /**
        * <p>Add a new feature to series and to layer. If no layer id is given feature won't be added.</p>
        *
        * @param {number} pLayerId Id of layer.
        * @param {Object} pFeature Feature object to be added.
        * @example <caption>This example add a new feature to the map.</caption>
        * apex.region( "regionId" ).addFeature(
        *   apex.region( "regionId" ).getLayerIdByName( "earthquakes" ),
        *   {
        *     id: "6tgy767836",
        *     geometry: {
        *       type: "Point",
        *       coordinates: [ -108.852, 15.8821667 ]
        *     },
        *     infoWindow: {
        *       title: "Title text",
        *       body: "Body text"
        *     },
        *     tooltip: "Tooltip text"
        *   }
        * );
        */
        addFeature: function ( pLayerId, pFeature ) {
            let lSerie = this._getSerie( pLayerId );

            if ( lSerie ) {
                // Add new feature to serie
                lSerie.features.push( pFeature );

                if ( this.map ) {
                    let lLayerId = pLayerId.toString(),
                        lLayerSource = this.map.getSource( lLayerId + SOURCE_SUFFIX ); // Current layer source data

                    // If source exist - update layer data (features)
                    if ( lLayerSource ) {
                        ( async () => {
                            // Add new feature point to current layer source data.
                            // If feat is a url image we have to wait until maplibre loads and creates such image
                            // otherwise layer will be updated before image exists.
                            lLayerSource._data.features.push( await this._getGeoJSONFeat( lSerie, pFeature, this._getLayerInfo( pLayerId ), getDefaultColorByNum( 1 ) ) );

                            // Update source data with new feature point
                            this.map.getSource( lLayerId + SOURCE_SUFFIX ).setData( lLayerSource._data );

                            this._fireMapChangedEvent( "feature-added" );
                        } )();
                    }
                } else {
                    debug.warn( MAP_NOT_READY_MSG );
                }
            } else {
                debug.error( INVALID_LAYER_ID_MSG );
            }
        },
      /**
        * <p>Update feature from series and layer source. If no layer id or feature object are given feature won't be updated.</p>
        *
        * @param {number} pLayerId Id of layer.
        * @param {Object} pFeature Feature object to update.
        * @example <caption>This example update the specified feature from series in the map.</caption>
        * apex.region( "regionId" ).updateFeature(
        *   apex.region( "regionId" ).getLayerIdByName( "earthquakes" ),
        *   {
        *     id: "6tgy767836",
        *     geometry: {
        *       type: "Point",
        *       coordinates: [ -128.852, 55.8821667 ]
        *     },
        *     infoWindow: {
        *       title: "My info window title",
        *       body: "My info window body"
        *     },
        *     tooltip: "My tooltip content"
        *   }
        * );
        */
        updateFeature: function ( pLayerId, pFeature ) {
            if ( pFeature.id ) {
                let lSerie = this._getSerie( pLayerId );

                if ( lSerie ) {
                    let lFeatIndex = lSerie.features.findIndex( feat => feat.id === pFeature.id ); // Index will be the same for serie and for source data
                                                                                                // GeoJSON features are added in the same order
                    if ( lSerie.features[ lFeatIndex ] ) {
                        // Update serie feature
                        lSerie.features[ lFeatIndex ] = pFeature;

                        if ( this.map ) {
                            let lLayerId = pLayerId.toString(),
                                lLayerSource = this.map.getSource( lLayerId + SOURCE_SUFFIX ); // Current layer source data

                            // If source exist, search and update feature
                            if ( lLayerSource ) {
                                let lSourceData = lLayerSource._data;

                                // If feat is found in layer source data, update layer source
                                if ( lSourceData.features[ lFeatIndex ] ) {

                                    ( async () => {
                                        // Update feature point in current layer source data obj.
                                        // If feat is a url image we have to wait until maplibre loads and creates such image
                                        // otherwise layer will be updated before image exists.
                                        lSourceData.features[ lFeatIndex ] = await this._getGeoJSONFeat( lSerie, pFeature, this._getLayerInfo( pLayerId ), getDefaultColorByNum( 1 ) );

                                        // Update source data
                                        this.map.getSource( lLayerId + SOURCE_SUFFIX ).setData( lSourceData );

                                        this._fireMapChangedEvent( "feature-updated" );
                                    } )();
                                }
                            }
                        } else {
                            debug.warn( MAP_NOT_READY_MSG );
                        }
                    }
                }  else {
                    debug.error( INVALID_LAYER_ID_MSG );
                }
            }
        },
      /**
        * <p>Removes feature from map. If no layer id or feature id are given feature won't be removed.</p>
        *
        * @param {number} pLayerId Id of layer.
        * @param {string} pFeatureId Id of feature to remove.
        * @example <caption>This example removes the specified feature from the map.</caption>
        * apex.region( "regionId" ).removeFeature( apex.region( "regionId" ).getLayerIdByName( "earthquakes" ), "8jd4760465" );
        */
        removeFeature: function ( pLayerId, pFeatureId ) {
            let lSerie = this._getSerie( pLayerId );

            if ( lSerie ) {
                let lFeatIndex = lSerie.features.findIndex( feat => feat.id === pFeatureId );

                if ( lFeatIndex > -1 ) {
                    // Remove feature from serie
                    lSerie.features.splice( lFeatIndex, 1 );

                    if ( this.map ) {
                        let lLayerId = pLayerId.toString(),
                            lLayerSource = this.map.getSource( lLayerId + SOURCE_SUFFIX );

                        // If layer source exists, remove feat from data
                        if ( lLayerSource ) {
                            lLayerSource._data.features.splice( lFeatIndex, 1 );

                            // Update source data
                            this.map.getSource( lLayerId + SOURCE_SUFFIX ).setData( lLayerSource._data );

                            this._fireMapChangedEvent( "feature-removed" );
                        }
                    } else {
                        debug.warn( MAP_NOT_READY_MSG );
                    }
                } else {
                    debug.error( INVALID_FEATURE_ID_MSG );
                }
            } else {
                debug.error( INVALID_LAYER_ID_MSG );
            }
        },
      /**
        * <p>Display feature popup. If map initialization has not been completed or pop-up type, layer id or feature id are invalid pop-up won't be displayed.</p>
        *
        * @param {string} pType Pop-up type. One of "tooltip" or "infoWindow".
        * @param {number} pLayerId Id of layer.
        * @param {string} pFeatureId Feature Id.
        * @param {boolean} pFocusAfterOpen Whether popup should get focus or not.
        * @param {Object} [pLngLat] Tooltip coordinates. Only required if feature geometry type is other than "Point".
        * @param [pLngLat.lng] Tooltip longitude.
        * @param [pLngLat.lat] Tooltip latitude.
        * @example <caption>This example display the tooltip pop-up.</caption>
        * apex.region( "regionId" ).displayPopup( "tooltip", apex.region( "regionId" ).getLayerIdByName( "earthquakes" ), "6tgy767836" );
        *
        * @example <caption>This example display the info window pop-up. This pop-up will not be focused after open.</caption>
        * apex.region( "regionId" ).displayPopup( "infoWindow", apex.region( "regionId" ).getLayerIdByName( "earthquakes" ), "6tgy767836", false );
        *
        * @example <caption>This example display the info window pop-up on a polygon at the specified position.</caption>
        * apex.region( "regionId" ).displayPopup( "infoWindow", apex.region( "regionId" ).getLayerIdByName( "earthquakes" ), "8jd4760465", false, { lng: 0, lat: 0 } );
        */
        displayPopup: function ( pType, pLayerId, pFeatureId, pFocusAfterOpen = true, pLngLat = {} ) {
            if ( this.map ) {
                if ( pType === TOOLTIP_TYPE || pType === INFO_WINDOW_TYPE ) {
                    let lLayerSource = this.map.getSource( pLayerId.toString() + SOURCE_SUFFIX ); // Current layer source data

                    // If source exist, get feature
                    if ( lLayerSource ) {
                        let lSourceData = lLayerSource._data,
                            lFeatIndx = lSourceData.features.findIndex( feat => feat.properties.id === pFeatureId ),
                            lFeat = lSourceData.features[ lFeatIndx ];

                        // If feat is found display tooltip
                        if ( lFeat ) {
                          /**
                            * For "Polygons", "Multipolygons", "Lines" and "Multipoins" geometry types layers,
                            * a LngLat object is required to determine the popup location as the API cannot calculate
                            * the center coordinate for these geometry types. We could use "Polylabel" algorithm for next version.
                            */
                            if ( lFeat.geometry.type !== POINTS_GEOM_TYPE && isEmptyObj( pLngLat ) ) {
                                debug.error( `LngLat object is required for geometry type '${ lFeat.geometry.type }'.` );

                                return;
                            }

                            if ( pType === TOOLTIP_TYPE ) {
                                this.closeTooltip();

                                this._showTooltip( this._getSerie( pLayerId ), lFeat, pLngLat, pFocusAfterOpen );
                            } else {
                                let lLayer = this._getLayerInfo( pLayerId );

                                // Only display popup once. If popup exist in activePopups it means is already displayed.
                                if ( !lLayer.activePopups[ pFeatureId ] ) {
                                    // Add layer id, so widget store the popup in layer object
                                    lFeat.layer = {
                                        id: pLayerId
                                    };

                                    this._showInfoWindow( lFeat, pLngLat, pFocusAfterOpen );
                                }
                            }
                        } else {
                            debug.error( INVALID_FEATURE_ID_MSG );
                        }
                    }  else {
                        debug.error( INVALID_LAYER_ID_MSG );
                    }
                } else {
                    debug.error( `'${ pType }' is not a valid popup type.` );
                }
            } else {
                debug.warn( MAP_NOT_READY_MSG );
            }
        },
      /**
        * Remove tooltip pop-up.
        *
        * @example <caption>This example close the tooltip pop-up.</caption>
        * apex.region( "regionId" ).closeTooltip();
        */
        closeTooltip: function () {
            // Tooltip will be removed by hovering other area on map
            // or by using this function
            if ( this.tooltip ) {
                this.tooltip.remove();
            }
        },
       /**
        * <p>Remove feature info window pop-up. If layer id or feature id are invalid info window won't be closed.</p>
        *
        * @param {number} pLayerId Id of layer.
        * @param {string} pFeatureId Feature Id.
        * @example <caption>This example close the specified info window pop-up.</caption>
        * apex.region( "regionId" ).closeInfoWindow( apex.region( "regionId" ).getLayerIdByName( "earthquakes" ), "6tgy767836" );
        */
        closeInfoWindow: function ( pLayerId, pFeatureId ) {
            let lLayer = this._getLayerInfo( pLayerId );

            if ( lLayer ) {
                let lActivePopups = lLayer.activePopups;
                // activePopups object is created only if layer is added to map
                if ( lActivePopups && lActivePopups[ pFeatureId ] ) {
                    lActivePopups[ pFeatureId ].remove();
                }
            }
        },
       /**
        * <p>Remove all info window pop-ups from layer. If no layer id is given all info windows will be closed.</p>
        *
        * @param {number} [pLayerId] Only required to close info windows from a specific layer.
        * @example <caption>This example close all opened info window pop-ups.</caption>
        * apex.region( "regionId" ).closeAllInfoWindows();
        *
        * @example <caption>This example close all opened info window pop-ups, but only from the specified layer</caption>
        * apex.region( "regionId" ).closeAllInfoWindows( apex.region( "regionId" ).getLayerIdByName( "earthquakes" ) );
        */
        closeAllInfoWindows: function ( pLayerId ) {
            const { layers } = this.options;

            let lLayers = pLayerId ? layers.filter( layer => layer.id === pLayerId ) : layers;

            for ( let i = 0; i < lLayers.length; i++ ) {
                if ( lLayers[ i ].activePopups ) {
                    Object.values( lLayers[ i ].activePopups ).forEach( popup => {
                        popup.remove();
                    } );
                }
            }
        },
        /**
         * <p>Return the current map window bbox and the zoom level in one object. If map initialization has not been completed return an empty object.</p>
         *
         * @example <caption>This example gets the current map window BBOX and the zoom level in one object.</caption>
         * apex.region( "regionId" ).getMapBboxAndZoomLevel();
         *
         * @return {Object} An object containing the bbox and zoom properties.
         */
        getMapBboxAndZoomLevel: function () {
            let lBbboxZoom = {};

            if ( this.map ) {
                let lBounds = this.map.getBounds();

                // { "bbox": [{minx}, {miny}, {maxx}, {maxy}], "zoom": {zoomlevel} }
                lBbboxZoom = {
                    bbox: [ lBounds.getWest(), lBounds.getSouth(), lBounds.getEast(), lBounds.getNorth() ],
                    zoom: this.map.getZoom()
                };
            }  else {
                debug.warn( MAP_NOT_READY_MSG );
            }

            return lBbboxZoom;
        },
        /**
         * <p>Return the current map center and the zoom level in one object. If map initialization has not been completed return an empty object.</p>
         *
         * @example <caption>This example gets the current map center and the zoom level in one object.</caption>
         * apex.region( "regionId" ).getMapCenterAndZoomLevel();
         *
         * @return {Object} An object containing the center and zoom properties.
         */
        getMapCenterAndZoomLevel: function () {
            let lCenterZoom = {};

            if ( this.map ) {
                // { "center": [ {lng}, {lat} ], "zoom": {zoomlevel} }
                lCenterZoom = {
                    center: this.map.getCenter(),
                    zoom: this.map.getZoom()
                };
            } else {
                debug.warn( MAP_NOT_READY_MSG );
            }

            return lCenterZoom;
        },
        /**
         * <p>Return the current map pitch and the bearing values in one object. If map initialization has not been completed return an empty object.</p>
         *
         * @example <caption>This example gets the map pitch and bearing properties in one object.</caption>
         * apex.region( "regionId" ).getMapPitchAndBearing();
         *
         * @return {Object} An object containing the pitch and bearing properties.
         */
        getMapPitchAndBearing: function () {
            let lPitchBearing = {};

            if ( this.map ) {
                let lMapBearing = this.map.getBearing(),
                    lBearing = Object.is( lMapBearing, -0 ) ? 0 : lMapBearing;
                    // When map contains a bearing = 0
                    // map.getBearing() function returns -0,
                    // this seems to be a maplibre issue

                lPitchBearing = {
                    pitch: this.map.getPitch(),
                    bearing: lBearing
                };
            } else {
                debug.warn( MAP_NOT_READY_MSG );
            }

            return lPitchBearing;
        },
        /**
         * <p>Zooms the map to the specified level. If map initialization has not been completed zoom level can't be set.</p>
         *
         * @param {number} pZoomLevel The new zoom level.
         * @example <caption>This example sets the zoom level to 3.</caption>
         * apex.region( "regionId" ).setZoomLevel( 3 );
         */
        setZoomLevel: function ( pZoomLevel ) {
            if ( this.map ) {
                if ( Number.isInteger( pZoomLevel ) ) {
                    this.map.setZoom( pZoomLevel );
                } else {
                    debug.warn( "Argument most be a number" );
                }
            } else {
                debug.warn( MAP_NOT_READY_MSG );
            }
        },
        /**
         * <p>Recenters the map to the specified position. If map initialization has not been completed map center can't be set.</p>
         *
         * @param {Object[]} pCenter Longitude, latitude array.
         * @example <caption>This example centers the map to Washington, D.C.</caption>
         * var lng = -77.050636,
         *     lat = 38.889248;
         * apex.region( "regionId" ).setCenter( [ lng, lat ] );
         */
        setCenter: function ( pCenter ) {
            if ( this.map ) {
                if ( pCenter && Array.isArray( pCenter ) ) {
                    this.map.setCenter( pCenter );

                    this._fireMapChangedEvent( "map-drag" );

                    this._fetchOnMapDragged();
                } else  {
                    debug.error( "Argument must be an array" );
                }
            } else {
                debug.warn( MAP_NOT_READY_MSG );
            }
        },
        /**
         * <p>Returns the {@link https://maplibre.org/maplibre-gl-js/docs/API/classes/Map/ MapLibre GL JS Map} object.
         * If map initialization has not been completed return null.</p>
         * <p>Developer code that uses the MapLibre API may not be forward compatible should the MapLibre API change.</p>
         *
         * @return {Object} The MapLibre object to call MapLibre API functions on.
         * @example <caption>This example gets the MapLibre map object.</caption>
         * apex.region( "regionId" ).getMapObject();
         */
        getMapObject: function () {
            return this.map;
        },
        /**
         * Returns the current circle, which has been drawn with the circle tool.
         *
         * @return {Object} The drawn circle coordinates as a GeoJSON polygon, null if no circle has been drawn.
         * @example <caption>This example gets the current circle drawn with circle tool.</caption>
         * apex.region( "regionId" ).getCircle();
         */
        getCircle: function () {
            let lGeoJSON = null;

            if ( this.circleTool ) {
                lGeoJSON = this.circleTool.geoJSONCircle;
            }

            return lGeoJSON;
        },
        /**
         * Removes (clears) the drawn circle from the map. Does nothing if no circle has been drawn.
         *
         * @example <caption>This example removes the circle drawn with the circle tool.</caption>
         * apex.region( "regionId" ).clearCircle();
         */
        clearCircle: function () {
            if ( this.circleTool ) {
                this.circleTool.clear( true );
            }
        },
        /**
         * Resets the map instance.
         *
         * @example <caption>This example resets the map instance.</caption>
         * apex.region( "regionId" ).reset();
         */
        reset: function () {
            this._reset( true );
        },
        /**
         * <p>Return the current map bbox, zoom level, pitch and bearing values in one object. If map initialization has not been completed return an empty object.</p>
         *
         * @example <caption>This example gets the current map bbox, zoom level, pitch and bearing values in one object.</caption>
         * apex.region( "regionId" ).getMapStatus();
         *
         * @return {Object} An object containing the bbox, zoom, pitch and bearing properties.
         */
        getMapStatus: function () {
            let lMapStatus = {};

            if ( this.map ) {
                lMapStatus = { ...this.getMapBboxAndZoomLevel(), ...this.getMapPitchAndBearing() };
            } else {
                debug.warn( MAP_NOT_READY_MSG );
            }

            return lMapStatus;
        }
    } );
} )( apex.util, apex.env, apex.debug, apex.lang, apex.locale, apex.jQuery, apex.actions, apex.widget.util, apex.region, apex.libVersions );
