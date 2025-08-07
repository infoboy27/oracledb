/*!
 Copyright (c) 2022, 2023, Oracle and/or its affiliates.
*/
/*
 * The color picker item of Oracle APEX.
 * There are a few main parts to this:
 * - The color object / constructor "aColor" with useful color specific functionalities
 * - Web component based color spectrum (spectrum, hue slider & alpha slider). Element <a-color-spectrum>
 * - Web component based color picker (the main item). Element <a-color-picker>
 * - Some contrast utilities exported via: apex.widget.util.colorPicker
 */
/**
 * @interface colorpicker
 * @since 23.1
 * @extends {item}
 * @classdesc
 *
 * Expected markup
 * Native
 *  <a-color-picker display-as="NATIVE" value="{initial-color-value}"></a-color-picker>
 *
 * Popup
 *  <a-color-picker display-as="POPUP" display-mode="FULL" return-value-as="HEX" value="{initial-color-value}"></a-color-picker>
 *
 * Inline
 *  <a-color-picker display-as="INLINE" display-mode="FULL" return-value-as="HEX" value="{initial-color-value}"></a-color-picker>
 *
 * Color Only
 *  <a-color-picker display-as="COLOR_ONLY" display-mode="FULL" return-value-as="HEX" value="{initial-color-value}"></a-color-picker>
 *
 * In addition all but the native one can have these additional attributes on the input element.
 * contrast-color="{color-value}" check the contrast of this item color value against the color value
 * return-value-as="{HEX|RGB|RGBA|HSL|HSLA|CSS}" Default is HEX
 * display-mode="{SIMPLE|FULL}" Default is SIMPLE
 * preset-colors={THEME|color-list} A color list is a ; separated list of color values
 * Advanced:
 * popup-class="{classes}"
 * colors-inline="true" Only applies for display as POPUP and if have colors
 * max-preset-colors="{n}" default is 5. Only applies if have colors
 *
 */
( function ( item, util, lang, message, debug, $, WebComponent, widgetUtil ) {
    "use strict";

    //
    //
    // APEX Color Constructor
    //
    //
    // These matching rules are basically the same as Oracle JET uses it for their "ojColor" object
    // We re-used them to be backward compatible to the old JET based color picker
    const matchers = ( function () {
        // <http://www.w3.org/TR/css3-values/#integers>
        const CSS_INTEGER = "[-\\+]?\\d+%?";

        // <http://www.w3.org/TR/css3-values/#number-value>
        const CSS_NUMBER = "[-\\+]?\\d*\\.\\d+%?";

        // Allow positive/negative integer/number.  Don't capture the either/or, just the entire outcome.
        const CSS_UNIT = "(?:" + CSS_NUMBER + ")|(?:" + CSS_INTEGER + ")";

        // Actual matching.
        // Parentheses and commas are optional, but not required.
        // Whitespace can take the place of commas or opening paren
        const PERMISSIVE_MATCH3 = "[\\s|\\(]+(" + CSS_UNIT + ")[,|\\s]+(" + CSS_UNIT + ")[,|\\s]+(" + CSS_UNIT + ")\\s*\\)?";
        const PERMISSIVE_MATCH4 = "[\\s|\\(]+(" + CSS_UNIT + ")[,|\\s]+(" + CSS_UNIT + ")[,|\\s]+(" + CSS_UNIT + ")[,|\\s]+(" + CSS_UNIT + ")\\s*\\)?";

        return {
            CSS_UNIT: new RegExp( CSS_UNIT ),
            rgb: new RegExp( "rgb" + PERMISSIVE_MATCH3 ),
            rgba: new RegExp( "rgba" + PERMISSIVE_MATCH4 ),
            hsl: new RegExp( "hsl" + PERMISSIVE_MATCH3 ),
            hsla: new RegExp( "hsla" + PERMISSIVE_MATCH4 ),
            hsv: new RegExp( "hsv" + PERMISSIVE_MATCH3 ),
            hsva: new RegExp( "hsva" + PERMISSIVE_MATCH4 ),
            hex3: /^#?([0-9a-fA-F]{1})([0-9a-fA-F]{1})([0-9a-fA-F]{1})$/,
            hex6: /^#?([0-9a-fA-F]{2})([0-9a-fA-F]{2})([0-9a-fA-F]{2})$/
        };
    } )();

    // helper functions
    const aColorHelper = {
        // Accepts a single string/number and checks to see if it looks like a CSS unit
        isValidCSSUnit: function ( color ) {
            return !!matchers.CSS_UNIT.exec( color );
        },

        // Need to handle 1.0 as 100%, since once it is a number, there is no difference between it and 1
        isOnePointZero: function ( number ) {
            return typeof number === "string" && number.indexOf( "." ) !== -1 && parseFloat( number ) === 1;
        },

        // Parse a base-16 hex value into a base-10 integer
        parseIntFromHex: function ( value ) {
            return parseInt( value, 16 );
        },

        // Returns true if supplied string is a percentage
        isPercentage: function ( number ) {
            return typeof number === "string" && number.indexOf( "%" ) !== -1;
        },

        // Replace a decimal with it's percentage value
        convertToPercentage: function ( number ) {
            let n = number;
            if ( n <= 1 ) {
                n = n * 100 + "%";
            }

            return n;
        },

        // Returns a valid alpha value [0;1] with all invalid values being set to 1
        boundAlpha: function ( alpha ) {
            let a = parseFloat( alpha );

            if ( isNaN( a ) || a < 0 || a > 1 ) {
                a = 1;
            }

            return a;
        },

        // Take input from [0, n] and return it as [0, 1]
        bound01: function ( number, max ) {
            let n = number;
            if ( aColorHelper.isOnePointZero( n ) ) {
                n = "100%";
            }

            const processPercent = aColorHelper.isPercentage( n );
            n = Math.min( max, Math.max( 0, parseFloat( n ) ) );

            // Automatically convert percentage into number
            if ( processPercent ) {
                n = parseInt( n * max, 10 ) / 100;
            }

            // Handle floating point rounding errors
            if ( Math.abs( n - max ) < 0.000001 ) {
                return 1;
            }

            // Convert into [0, 1] range if it isn't already
            return ( n % max ) / parseFloat( max );
        },

        // Converts the color object to an RGB string
        toRgbString: function ( color ) {
            const b = color._a < 1;
            return "rgb" + ( b ? "a(" : "(" ) + Math.round( color._r ) + ", " + Math.round( color._g ) + ", " + Math.round( color._b ) + ( b ? ", " + color._a : "" ) + ")";
        },

        // Converts the color object to an HSL string
        toHslString: function ( color ) {
            const hsl = color.getHSLA(),
                  b = hsl.a < 1;
            return "hsl" + ( b ? "a(" : "(" ) + Math.round( hsl.h * 360 ) + ", " + Math.round( hsl.s * 100 ) + "%, " + Math.round( hsl.l * 100 ) + "%" + ( b ? ", " + hsl.a : "" ) + ")";
        },

        // Converts the color object to an HSL string
        toHsvString: function ( color ) {
            const hsv = color.getHSVA(),
                  b = hsv.a < 1;
            return "hsv" + ( b ? "a(" : "(" ) + Math.round( hsv.h * 360 ) + ", " + Math.round( hsv.s * 100 ) + "%, " + Math.round( hsv.v * 100 ) + "%" + ( b ? ", " + hsv.a : "" ) + ")";
        },

        // Converts the color object to an hex string
        toHexString: function ( color ) {
            function _toHex( num ) {
                const hex = Math.round( num ).toString( 16 );
                return hex.length === 1 ? "0" + hex : hex;
            }
            return "#" + _toHex( color._r ) + _toHex( color._g ) + _toHex( color._b );
        },

        // Converts an RGB(A) color value to HSL(A).
        rgbaToHsla: function ( color ) {
            const r = aColorHelper.bound01( color.r, 255 ),
                  g = aColorHelper.bound01( color.g, 255 ),
                  b = aColorHelper.bound01( color.b, 255 ),
                  a = aColorHelper.boundAlpha( color.a ),
                  max = Math.max( r, g, b ),
                  min = Math.min( r, g, b );

            let h,
                s,
                l = ( max + min ) / 2;

            if ( max === min ) {
                h = 0; // achromatic
                s = 0; // achromatic
            } else {
                let d = max - min;
                s = l > 0.5 ? d / ( 2 - max - min ) : d / ( max + min );
                switch ( max ) {
                case r:
                    h = ( g - b ) / d + ( g < b ? 6 : 0 );
                    break;
                case g:
                    h = ( b - r ) / d + 2;
                    break;
                case b:
                    h = ( r - g ) / d + 4;
                    break;
                default:
                    break;
                }

                h /= 6;
            }

            return { h: h, s: s, l: l, a: a };
        },

        // Converts an RGB(A) color value to HSV(A).
        rgbaToHsva: function ( color ) {
            const r = aColorHelper.bound01( color.r, 255 ),
                  g = aColorHelper.bound01( color.g, 255 ),
                  b = aColorHelper.bound01( color.b, 255 ),
                  a = aColorHelper.boundAlpha( color.a ),
                  max = Math.max( r, g, b ),
                  min = Math.min( r, g, b ),
                  v = max,
                  d = max - min,
                  s = max === 0 ? 0 : d / max;

            let h;

            if ( max === min ) {
                h = 0; // achromatic
            } else {
                switch ( max ) {
                case r:
                    h = ( g - b ) / d + ( g < b ? 6 : 0 );
                    break;
                case g:
                    h = ( b - r ) / d + 2;
                    break;
                case b:
                    h = ( r - g ) / d + 4;
                    break;
                default:
                    break;
                }
                h /= 6;
            }

            return { h: h, s: s, v: v, a: a };
        },

        // Converts an RGB color value to RGB. Handle bounds/percentage checking to conform to CSS color spec
        rgbToRgb: function ( r, g, b ) {
            return {
                r: aColorHelper.bound01( r, 255 ) * 255,
                g: aColorHelper.bound01( g, 255 ) * 255,
                b: aColorHelper.bound01( b, 255 ) * 255
            };
        },

        // Converts an HSL color value to RGB.
        hslToRgb: function ( h, s, l ) {
            let r, 
                g, 
                b;

            h = aColorHelper.bound01( h, 360 );
            s = aColorHelper.bound01( s, 100 );
            l = aColorHelper.bound01( l, 100 );

            function hue2rgb( p, q, t ) {
                if ( t < 0 ) {
                    t += 1;
                }
                if ( t > 1 ) {
                    t -= 1;
                }
                if ( t < 1 / 6 ) {
                    return p + ( q - p ) * 6 * t;
                }
                if ( t < 1 / 2 ) {
                    return q;
                }
                if ( t < 2 / 3 ) {
                    return p + ( q - p ) * ( 2 / 3 - t ) * 6;
                }
                return p;
            }

            if ( s === 0 ) {
                // achromatic
                r = l;
                g = l;
                b = l;
            } else {
                const q = l < 0.5 ? l * ( 1 + s ) : l + s - l * s,
                      p = 2 * l - q;

                r = hue2rgb( p, q, h + 1 / 3 );
                g = hue2rgb( p, q, h );
                b = hue2rgb( p, q, h - 1 / 3 );
            }

            return { r: r * 255, g: g * 255, b: b * 255 };
        },

        // Converts an HSV color value to RGB.
        hsvToRgb: function ( h, s, v ) {
            h = aColorHelper.bound01( h, 360 ) * 6;
            s = aColorHelper.bound01( s, 100 );
            v = aColorHelper.bound01( v, 100 );

            const i = Math.floor( h ),
                  f = h - i,
                  p = v * ( 1 - s ),
                  q = v * ( 1 - f * s ),
                  t = v * ( 1 - ( 1 - f ) * s ),
                  mod = i % 6,
                  r = [v, q, p, p, t, v][mod],
                  g = [t, v, v, q, p, p][mod],
                  b = [p, p, t, v, v, q][mod];

            return { r: r * 255, g: g * 255, b: b * 255 };
        },

        // Permissive color string parsing. Takes in a number of formats, and outputs an object based on detected format.
        stringInputToObject: function ( color ) {
            color = color.replace( /^\s*(.*?)\s*$/, "$1" ).toLowerCase();

            if ( color === "transparent" ) {
                return { r: 0, g: 0, b: 0, a: 0 };
            }

            // Strategy:
            // 1) Try to match string input using regular expressions.
            // 2) Keep most of the number bounding out of this function - don't worry about [0,1] or [0,100] or [0,360]
            // 3) Just return an object and let the conversion functions handle that.
            // This way the result will be the same whether the Color is initialized with string or object.
            let match = matchers.rgb.exec( color );
            if ( match ) {
                return { r: match[1], g: match[2], b: match[3] };
            }

            match = matchers.rgba.exec( color );
            if ( match ) {
                return { r: match[1], g: match[2], b: match[3], a: match[4] };
            }

            match = matchers.hsl.exec( color );
            if ( match ) {
                return { h: match[1], s: match[2], l: match[3] };
            }

            match = matchers.hsla.exec( color );
            if ( match ) {
                return { h: match[1], s: match[2], l: match[3], a: match[4] };
            }

            match = matchers.hsv.exec( color );
            if ( match ) {
                return { h: match[1], s: match[2], v: match[3] };
            }

            match = matchers.hsva.exec( color );
            if ( match ) {
                return { h: match[1], s: match[2], v: match[3], a: match[4] };
            }

            match = matchers.hex6.exec( color );
            if ( match ) {
                return {
                    r: aColorHelper.parseIntFromHex( match[1] ),
                    g: aColorHelper.parseIntFromHex( match[2] ),
                    b: aColorHelper.parseIntFromHex( match[3] )
                };
            }

            match = matchers.hex3.exec( color );
            if ( match ) {
                return {
                    r: aColorHelper.parseIntFromHex( match[1] + "" + match[1] ),
                    g: aColorHelper.parseIntFromHex( match[2] + "" + match[2] ),
                    b: aColorHelper.parseIntFromHex( match[3] + "" + match[3] )
                };
            }

            return false;
        },

        // Converts a valid CSS3 color specification string (exc. named colors),
        // or an object of the forms {r:, g:, b:}, {h:, s:, l:}, or {h", s:, v:} with
        // optional "a" property, to an object with validated r,g,b properties. Invalid syntax causes an error to be thrown.
        inputToRGB: function ( color ) {
            let rgb = { r: 0, g: 0, b: 0 },
                a = 1,
                s = null,
                v = null,
                l = null,
                ok = false;

            color = color || rgb;

            if ( typeof color === "string" ) {
                color = aColorHelper.stringInputToObject( color ); // convert to {"r":, "g":, "b":} or {"h":, "s":, l}, or {"h":, "s":, "v":}
            }

            if ( typeof color === "object" ) {
                if ( aColorHelper.isValidCSSUnit( color.r ) && aColorHelper.isValidCSSUnit( color.g ) && aColorHelper.isValidCSSUnit( color.b ) ) {
                    rgb = aColorHelper.rgbToRgb( color.r, color.g, color.b );
                    ok = true;
                } else if ( aColorHelper.isValidCSSUnit( color.h ) && aColorHelper.isValidCSSUnit( color.s ) && aColorHelper.isValidCSSUnit( color.v ) ) {
                    s = aColorHelper.convertToPercentage( color.s );
                    v = aColorHelper.convertToPercentage( color.v );
                    rgb = aColorHelper.hsvToRgb( color.h, s, v );
                    ok = true;
                } else if ( aColorHelper.isValidCSSUnit( color.h ) && aColorHelper.isValidCSSUnit( color.s ) && aColorHelper.isValidCSSUnit( color.l ) ) {
                    s = aColorHelper.convertToPercentage( color.s );
                    l = aColorHelper.convertToPercentage( color.l );
                    rgb = aColorHelper.hslToRgb( color.h, s, l );
                    ok = true;
                }

                if ( typeof color.a !== "undefined" ) {
                    a = color.a;
                }
            }

            if ( !ok ) {
                throw new Error( "Invalid Color format" );
            }

            a = aColorHelper.boundAlpha( a );
            return {
                r: Math.min( 255, Math.max( rgb.r, 0 ) ),
                g: Math.min( 255, Math.max( rgb.g, 0 ) ),
                b: Math.min( 255, Math.max( rgb.b, 0 ) ),
                a: a
            };
        }
    };

    const aColor = function ( color ) {
        let _self = this;

        const _color = color || "",
              _rgb = aColorHelper.inputToRGB( _color );

        _self._r = _rgb.r;
        _self._g = _rgb.g;
        _self._b = _rgb.b;
        _self._a = Math.round( 100 * _rgb.a ) / 100;

        // color type definitions
        Object.defineProperty( _self, "rgba", {
            writable: false,
            value: { r: _rgb.r, g: _rgb.g, b: _rgb.b, a: _self._a }
        } );
        Object.defineProperty( _self, "hsla", { writable: false, value: aColorHelper.rgbaToHsla( _self.rgba ) } );
        Object.defineProperty( _self, "hsva", { writable: false, value: aColorHelper.rgbaToHsva( _self.rgba ) } );
    };

    // color getter functions
    aColor.prototype.getRGBA = function () {
        return this.rgba;
    };

    aColor.prototype.getHSLA = function () {
        return this.hsla;
    };

    aColor.prototype.getHSVA = function () {
        return this.hsva;
    };

    aColor.prototype.getRed = function ( doNotRound ) {
        return doNotRound ? this._r : Math.round( this._r );
    };

    aColor.prototype.getGreen = function ( doNotRound ) {
        return doNotRound ? this._g : Math.round( this._g );
    };

    aColor.prototype.getBlue = function ( doNotRound ) {
        return doNotRound ? this._b : Math.round( this._b );
    };

    aColor.prototype.getAlpha = function () {
        return this._a;
    };

    // additional functions
    aColor.prototype.toString = function () {
        return aColorHelper.toRgbString( this );
    };

    aColor.prototype.toHslString = function () {
        return aColorHelper.toHslString( this );
    };

    aColor.prototype.toHsvString = function () {
        return aColorHelper.toHsvString( this );
    };

    aColor.prototype.toHexString = function () {
        return aColorHelper.toHexString( this );
    };

    aColor.prototype.isEqual = function ( color ) {
        let ret = false;

        if ( color instanceof aColor ) {
            ret = this._r === color._r && this._g === color._g && this._b === color._b && this._a === color._a;
        }

        return ret;
    };

    // CSS3 color constants
    ( function () {
        Object.defineProperty( aColor, "ALICEBLUE", { writable: false, value: new aColor( "f0f8ff" ) } );
        Object.defineProperty( aColor, "ANTIQUEWHITE", { writable: false, value: new aColor( "faebd7" ) } );
        Object.defineProperty( aColor, "AQUA", { writable: false, value: new aColor( "0ff" ) } );
        Object.defineProperty( aColor, "AQUAMARINE", { writable: false, value: new aColor( "7fffd4" ) } );
        Object.defineProperty( aColor, "AZURE", { writable: false, value: new aColor( "f0ffff" ) } );
        Object.defineProperty( aColor, "BEIGE", { writable: false, value: new aColor( "f5f5dc" ) } );
        Object.defineProperty( aColor, "BISQUE", { writable: false, value: new aColor( "ffe4c4" ) } );
        Object.defineProperty( aColor, "BLACK", { writable: false, value: new aColor( "000" ) } );
        Object.defineProperty( aColor, "BLANCHEDALMOND", { writable: false, value: new aColor( "ffebcd" ) } );
        Object.defineProperty( aColor, "BLUE", { writable: false, value: new aColor( "00f" ) } );
        Object.defineProperty( aColor, "BLUEVIOLET", { writable: false, value: new aColor( "8a2be2" ) } );
        Object.defineProperty( aColor, "BROWN", { writable: false, value: new aColor( "a52a2a" ) } );
        Object.defineProperty( aColor, "BURLYWOOD", { writable: false, value: new aColor( "deb887" ) } );
        Object.defineProperty( aColor, "CADETBLUE", { writable: false, value: new aColor( "5f9ea0" ) } );
        Object.defineProperty( aColor, "CHARTREUSE", { writable: false, value: new aColor( "7fff00" ) } );
        Object.defineProperty( aColor, "CHOCOLATE", { writable: false, value: new aColor( "d2691e" ) } );
        Object.defineProperty( aColor, "CORAL", { writable: false, value: new aColor( "ff7f50" ) } );
        Object.defineProperty( aColor, "CORNFLOWERBLUE", { writable: false, value: new aColor( "6495ed" ) } );
        Object.defineProperty( aColor, "CORNSILK", { writable: false, value: new aColor( "fff8dc" ) } );
        Object.defineProperty( aColor, "CRIMSON", { writable: false, value: new aColor( "dc143c" ) } );
        Object.defineProperty( aColor, "CYAN", { writable: false, value: new aColor( "0ff" ) } );
        Object.defineProperty( aColor, "DARKBLUE", { writable: false, value: new aColor( "00008b" ) } );
        Object.defineProperty( aColor, "DARKCYAN", { writable: false, value: new aColor( "008b8b" ) } );
        Object.defineProperty( aColor, "DARKGOLDENROD", { writable: false, value: new aColor( "b8860b" ) } );
        Object.defineProperty( aColor, "DARKGRAY", { writable: false, value: new aColor( "a9a9a9" ) } );
        Object.defineProperty( aColor, "DARKGREY", { writable: false, value: new aColor( "a9a9a9" ) } );
        Object.defineProperty( aColor, "DARKGREEN", { writable: false, value: new aColor( "006400" ) } );
        Object.defineProperty( aColor, "DARKKHAKI", { writable: false, value: new aColor( "bdb76b" ) } );
        Object.defineProperty( aColor, "DARKMAGENTA", { writable: false, value: new aColor( "8b008b" ) } );
        Object.defineProperty( aColor, "DARKOLIVEGREEN", { writable: false, value: new aColor( "556b2f" ) } );
        Object.defineProperty( aColor, "DARKORANGE", { writable: false, value: new aColor( "ff8c00" ) } );
        Object.defineProperty( aColor, "DARKORCHID", { writable: false, value: new aColor( "9932cc" ) } );
        Object.defineProperty( aColor, "DARKRED", { writable: false, value: new aColor( "8b0000" ) } );
        Object.defineProperty( aColor, "DARKSALMON", { writable: false, value: new aColor( "e9967a" ) } );
        Object.defineProperty( aColor, "DARKSEAGREEN", { writable: false, value: new aColor( "8fbc8f" ) } );
        Object.defineProperty( aColor, "DARKSLATEBLUE", { writable: false, value: new aColor( "483d8b" ) } );
        Object.defineProperty( aColor, "DARKSLATEGRAY", { writable: false, value: new aColor( "2f4f4f" ) } );
        Object.defineProperty( aColor, "DARKSLATEGREY", { writable: false, value: new aColor( "2f4f4f" ) } );
        Object.defineProperty( aColor, "DARKTURQUOISE", { writable: false, value: new aColor( "00ced1" ) } );
        Object.defineProperty( aColor, "DARKVIOLET", { writable: false, value: new aColor( "9400d3" ) } );
        Object.defineProperty( aColor, "DEEPPINK", { writable: false, value: new aColor( "ff1493" ) } );
        Object.defineProperty( aColor, "DEEPSKYBLUE", { writable: false, value: new aColor( "00bfff" ) } );
        Object.defineProperty( aColor, "DIMGRAY", { writable: false, value: new aColor( "696969" ) } );
        Object.defineProperty( aColor, "DIMGREY", { writable: false, value: new aColor( "696969" ) } );
        Object.defineProperty( aColor, "DODGERBLUE", { writable: false, value: new aColor( "1e90ff" ) } );
        Object.defineProperty( aColor, "FIREBRICK", { writable: false, value: new aColor( "b22222" ) } );
        Object.defineProperty( aColor, "FLORALWHITE", { writable: false, value: new aColor( "fffaf0" ) } );
        Object.defineProperty( aColor, "FORESTGREEN", { writable: false, value: new aColor( "228b22" ) } );
        Object.defineProperty( aColor, "FUCHSIA", { writable: false, value: new aColor( "f0f" ) } );
        Object.defineProperty( aColor, "GAINSBORO", { writable: false, value: new aColor( "dcdcdc" ) } );
        Object.defineProperty( aColor, "GHOSTWHITE", { writable: false, value: new aColor( "f8f8ff" ) } );
        Object.defineProperty( aColor, "GOLD", { writable: false, value: new aColor( "ffd700" ) } );
        Object.defineProperty( aColor, "GOLDENROD", { writable: false, value: new aColor( "daa520" ) } );
        Object.defineProperty( aColor, "GRAY", { writable: false, value: new aColor( "808080" ) } );
        Object.defineProperty( aColor, "GREY", { writable: false, value: new aColor( "808080" ) } );
        Object.defineProperty( aColor, "GREEN", { writable: false, value: new aColor( "008000" ) } );
        Object.defineProperty( aColor, "GREENYELLOW", { writable: false, value: new aColor( "adff2f" ) } );
        Object.defineProperty( aColor, "HONEYDEW", { writable: false, value: new aColor( "f0fff0" ) } );
        Object.defineProperty( aColor, "HOTPINK", { writable: false, value: new aColor( "ff69b4" ) } );
        Object.defineProperty( aColor, "INDIANRED", { writable: false, value: new aColor( "cd5c5c" ) } );
        Object.defineProperty( aColor, "INDIGO", { writable: false, value: new aColor( "4b0082" ) } );
        Object.defineProperty( aColor, "IVORY", { writable: false, value: new aColor( "fffff0" ) } );
        Object.defineProperty( aColor, "KHAKI", { writable: false, value: new aColor( "f0e68c" ) } );
        Object.defineProperty( aColor, "LAVENDER", { writable: false, value: new aColor( "e6e6fa" ) } );
        Object.defineProperty( aColor, "LAVENDERBLUSH", { writable: false, value: new aColor( "fff0f5" ) } );
        Object.defineProperty( aColor, "LAWNGREEN", { writable: false, value: new aColor( "7cfc00" ) } );
        Object.defineProperty( aColor, "LEMONCHIFFON", { writable: false, value: new aColor( "fffacd" ) } );
        Object.defineProperty( aColor, "LIGHTBLUE", { writable: false, value: new aColor( "add8e6" ) } );
        Object.defineProperty( aColor, "LIGHTCORAL", { writable: false, value: new aColor( "f08080" ) } );
        Object.defineProperty( aColor, "LIGHTCYAN", { writable: false, value: new aColor( "e0ffff" ) } );
        Object.defineProperty( aColor, "LIGHTGOLDENRODYELLOW", { writable: false, value: new aColor( "fafad2" ) } );
        Object.defineProperty( aColor, "LIGHTGRAY", { writable: false, value: new aColor( "d3d3d3" ) } );
        Object.defineProperty( aColor, "LIGHTGREY", { writable: false, value: new aColor( "d3d3d3" ) } );
        Object.defineProperty( aColor, "LIGHTGREEN", { writable: false, value: new aColor( "90ee90" ) } );
        Object.defineProperty( aColor, "LIGHTPINK", { writable: false, value: new aColor( "ffb6c1" ) } );
        Object.defineProperty( aColor, "LIGHTSALMON", { writable: false, value: new aColor( "ffa07a" ) } );
        Object.defineProperty( aColor, "LIGHTSEAGREEN", { writable: false, value: new aColor( "20b2aa" ) } );
        Object.defineProperty( aColor, "LIGHTSKYBLUE", { writable: false, value: new aColor( "87cefa" ) } );
        Object.defineProperty( aColor, "LIGHTSLATEGRAY", { writable: false, value: new aColor( "789" ) } );
        Object.defineProperty( aColor, "LIGHTSLATEGREY", { writable: false, value: new aColor( "789" ) } );
        Object.defineProperty( aColor, "LIGHTSTEELBLUE", { writable: false, value: new aColor( "b0c4de" ) } );
        Object.defineProperty( aColor, "LIGHTYELLOW", { writable: false, value: new aColor( "ffffe0" ) } );
        Object.defineProperty( aColor, "LIME", { writable: false, value: new aColor( "0f0" ) } );
        Object.defineProperty( aColor, "LIMEGREEN", { writable: false, value: new aColor( "32cd32" ) } );
        Object.defineProperty( aColor, "LINEN", { writable: false, value: new aColor( "faf0e6" ) } );
        Object.defineProperty( aColor, "MAGENTA", { writable: false, value: new aColor( "f0f" ) } );
        Object.defineProperty( aColor, "MAROON", { writable: false, value: new aColor( "800000" ) } );
        Object.defineProperty( aColor, "MEDIUMAQUAMARINE", { writable: false, value: new aColor( "66cdaa" ) } );
        Object.defineProperty( aColor, "MEDIUMBLUE", { writable: false, value: new aColor( "0000cd" ) } );
        Object.defineProperty( aColor, "MEDIUMORCHID", { writable: false, value: new aColor( "ba55d3" ) } );
        Object.defineProperty( aColor, "MEDIUMPURPLE", { writable: false, value: new aColor( "9370db" ) } );
        Object.defineProperty( aColor, "MEDIUMSEAGREEN", { writable: false, value: new aColor( "3cb371" ) } );
        Object.defineProperty( aColor, "MEDIUMSLATEBLUE", { writable: false, value: new aColor( "7b68ee" ) } );
        Object.defineProperty( aColor, "MEDIUMSPRINGGREEN", { writable: false, value: new aColor( "00fa9a" ) } );
        Object.defineProperty( aColor, "MEDIUMTURQUOISE", { writable: false, value: new aColor( "48d1cc" ) } );
        Object.defineProperty( aColor, "MEDIUMVIOLETRED", { writable: false, value: new aColor( "c71585" ) } );
        Object.defineProperty( aColor, "MIDNIGHTBLUE", { writable: false, value: new aColor( "191970" ) } );
        Object.defineProperty( aColor, "MINTCREAM", { writable: false, value: new aColor( "f5fffa" ) } );
        Object.defineProperty( aColor, "MISTYROSE", { writable: false, value: new aColor( "ffe4e1" ) } );
        Object.defineProperty( aColor, "MOCCASIN", { writable: false, value: new aColor( "ffe4b5" ) } );
        Object.defineProperty( aColor, "NAVAJOWHITE", { writable: false, value: new aColor( "ffdead" ) } );
        Object.defineProperty( aColor, "NAVY", { writable: false, value: new aColor( "000080" ) } );
        Object.defineProperty( aColor, "OLDLACE", { writable: false, value: new aColor( "fdf5e6" ) } );
        Object.defineProperty( aColor, "OLIVE", { writable: false, value: new aColor( "808000" ) } );
        Object.defineProperty( aColor, "OLIVEDRAB", { writable: false, value: new aColor( "6b8e23" ) } );
        Object.defineProperty( aColor, "ORANGE", { writable: false, value: new aColor( "ffa500" ) } );
        Object.defineProperty( aColor, "ORANGERED", { writable: false, value: new aColor( "ff4500" ) } );
        Object.defineProperty( aColor, "ORCHID", { writable: false, value: new aColor( "da70d6" ) } );
        Object.defineProperty( aColor, "PALEGOLDENROD", { writable: false, value: new aColor( "eee8aa" ) } );
        Object.defineProperty( aColor, "PALEGREEN", { writable: false, value: new aColor( "98fb98" ) } );
        Object.defineProperty( aColor, "PALETURQUOISE", { writable: false, value: new aColor( "afeeee" ) } );
        Object.defineProperty( aColor, "PALEVIOLETRED", { writable: false, value: new aColor( "db7093" ) } );
        Object.defineProperty( aColor, "PAPAYAWHIP", { writable: false, value: new aColor( "ffefd5" ) } );
        Object.defineProperty( aColor, "PEACHPUFF", { writable: false, value: new aColor( "ffdab9" ) } );
        Object.defineProperty( aColor, "PERU", { writable: false, value: new aColor( "cd853f" ) } );
        Object.defineProperty( aColor, "PINK", { writable: false, value: new aColor( "ffc0cb" ) } );
        Object.defineProperty( aColor, "PLUM", { writable: false, value: new aColor( "dda0dd" ) } );
        Object.defineProperty( aColor, "POWDERBLUE", { writable: false, value: new aColor( "b0e0e6" ) } );
        Object.defineProperty( aColor, "PURPLE", { writable: false, value: new aColor( "800080" ) } );
        Object.defineProperty( aColor, "REBECCAPURPLE", { writable: false, value: new aColor( "663399" ) } );
        Object.defineProperty( aColor, "RED", { writable: false, value: new aColor( "f00" ) } );
        Object.defineProperty( aColor, "ROSYBROWN", { writable: false, value: new aColor( "bc8f8f" ) } );
        Object.defineProperty( aColor, "ROYALBLUE", { writable: false, value: new aColor( "4169e1" ) } );
        Object.defineProperty( aColor, "SADDLEBROWN", { writable: false, value: new aColor( "8b4513" ) } );
        Object.defineProperty( aColor, "SALMON", { writable: false, value: new aColor( "fa8072" ) } );
        Object.defineProperty( aColor, "SANDYBROWN", { writable: false, value: new aColor( "f4a460" ) } );
        Object.defineProperty( aColor, "SEAGREEN", { writable: false, value: new aColor( "2e8b57" ) } );
        Object.defineProperty( aColor, "SEASHELL", { writable: false, value: new aColor( "fff5ee" ) } );
        Object.defineProperty( aColor, "SIENNA", { writable: false, value: new aColor( "a0522d" ) } );
        Object.defineProperty( aColor, "SILVER", { writable: false, value: new aColor( "c0c0c0" ) } );
        Object.defineProperty( aColor, "SKYBLUE", { writable: false, value: new aColor( "87ceeb" ) } );
        Object.defineProperty( aColor, "SLATEBLUE", { writable: false, value: new aColor( "6a5acd" ) } );
        Object.defineProperty( aColor, "SLATEGRAY", { writable: false, value: new aColor( "708090" ) } );
        Object.defineProperty( aColor, "SLATEGREY", { writable: false, value: new aColor( "708090" ) } );
        Object.defineProperty( aColor, "SNOW", { writable: false, value: new aColor( "fffafa" ) } );
        Object.defineProperty( aColor, "SPRINGGREEN", { writable: false, value: new aColor( "00ff7f" ) } );
        Object.defineProperty( aColor, "STEELBLUE", { writable: false, value: new aColor( "4682b4" ) } );
        Object.defineProperty( aColor, "TAN", { writable: false, value: new aColor( "d2b48c" ) } );
        Object.defineProperty( aColor, "TEAL", { writable: false, value: new aColor( "008080" ) } );
        Object.defineProperty( aColor, "THISTLE", { writable: false, value: new aColor( "d8bfd8" ) } );
        Object.defineProperty( aColor, "TOMATO", { writable: false, value: new aColor( "ff6347" ) } );
        Object.defineProperty( aColor, "TURQUOISE", { writable: false, value: new aColor( "40e0d0" ) } );
        Object.defineProperty( aColor, "VIOLET", { writable: false, value: new aColor( "ee82ee" ) } );
        Object.defineProperty( aColor, "WHEAT", { writable: false, value: new aColor( "f5deb3" ) } );
        Object.defineProperty( aColor, "WHITE", { writable: false, value: new aColor( "fff" ) } );
        Object.defineProperty( aColor, "WHITESMOKE", { writable: false, value: new aColor( "f5f5f5" ) } );
        Object.defineProperty( aColor, "YELLOW", { writable: false, value: new aColor( "ff0" ) } );
        Object.defineProperty( aColor, "YELLOWGREEN", { writable: false, value: new aColor( "9acd32" ) } );

        Object.defineProperty( aColor, "TRANSPARENT", { writable: false, value: new aColor( "rgba(0,0,0,0)" ) } );
    } )();

    // make it globally available
    window.aColor = aColor;

    //
    // general constants
    //
    const P_DISABLED = "disabled",
          P_VALUE = "value";

    //
    //
    // Color Spectrum
    //
    //
    const MSG_COLORSPECTRUM_SPECTRUM = "APEX.COLOR_PICKER.SPECTRUM.COLOR_SPECTRUM",
          MSG_COLORSPECTRUM_HUE_SLIDER = "APEX.COLOR_PICKER.SPECTRUM.HUE_SLIDER",
          MSG_COLORSPECTRUM_ALPHA_SLIDER = "APEX.COLOR_PICKER.SPECTRUM.ALPHA_SLIDER";

    const colorSpectrumHelper = {
        template: `<div class="a-ColorSpectrum-spectrum" role="slider"
                        aria-label="${util.escapeHTMLAttr( lang.getMessage( MSG_COLORSPECTRUM_SPECTRUM ) )}" tabindex="0">
                       <div class="a-ColorSpectrum-dragHandler"></div>
                   </div>
                   <div class="a-ColorSpectrum-slider a-ColorSpectrum-slider--hue" role="slider"
                        aria-valuemin="0" aria-valuemax="360" aria-orientation="vertical"
                        aria-label="${util.escapeHTMLAttr( lang.getMessage( MSG_COLORSPECTRUM_HUE_SLIDER ) )}" tabindex="0">
                       <div class="a-ColorSpectrum-dragHandler"></div>
                   </div>
                   {if SHOW_ALPHA/}
                   <div class="a-ColorSpectrum-slider a-ColorSpectrum-slider--alpha" role="slider"
                        aria-valuemin="0" aria-valuemax="1" aria-orientation="horizontal"
                        aria-label="${util.escapeHTMLAttr( lang.getMessage( MSG_COLORSPECTRUM_ALPHA_SLIDER ) )}" tabindex="0">
                       <div class="a-ColorSpectrum-dragHandler"></div>
                   </div>
                   {endif/}`,
        isColor: function ( color ) {
            return color && color instanceof aColor;
        },
        render: function ( element ) {
            const element$ = $( element );

            if ( element$ ) {
                element$.html( util.applyTemplate( colorSpectrumHelper.template, { extraSubstitutions: { SHOW_ALPHA: element._showAlpha ? "Y" : "" } } ) );
            }
        },
        initSliders: function ( element ) {
            element._hueSlider$.css( "background", "linear-gradient(0deg, #ff0000 0%, #ffff00 17%, #00ff00 33%, #00ffff 50%, #0000ff 67%, #ff00ff 83%, #ff0000 100%)" );
        },
        initHandlers: function ( element ) {
            element._spectrum$.click( function ( e ) {
                colorSpectrumHelper.spectrumClick( element, e );
            } );

            element._spectrum$.on( "keydown", function ( e ) {
                colorSpectrumHelper.handleSpectrumKeys( element, e );
            } );

            element._spectrumPointer$.draggable( {
                addClasses: false,
                cursor: "pointer",
                //containment: "parent",
                drag: function ( e, ui ) {
                    colorSpectrumHelper.spectrumDrag( element, e, ui );
                },
                stop: function ( e, ui ) {
                    colorSpectrumHelper.spectrumDrag( element, e, ui );
                }
            } );

            element._hueSlider$.click( function ( e ) {
                colorSpectrumHelper.hueClick( element, e );
            } );

            element._hueSlider$.on( "keydown", function ( e ) {
                colorSpectrumHelper.handleHueKeys( element, e );
            } );

            element._huePointer$.draggable( {
                addClasses: false,
                cursor: "pointer",
                containment: "parent",
                axis: "y",
                drag: function () {
                    colorSpectrumHelper.hueDrag( element, this );
                }
            } );

            if ( element._showAlpha ) {
                element._alphaSlider$.click( function ( e ) {
                    colorSpectrumHelper.alphaClick( element, e );
                } );

                element._alphaSlider$.on( "keydown", function ( e ) {
                    colorSpectrumHelper.handleAlphaKeys( element, e );
                } );

                element._alphaPointer$.draggable( {
                    addClasses: false,
                    cursor: "pointer",
                    containment: "parent",
                    axis: "x",
                    drag: function () {
                        colorSpectrumHelper.alphaDrag( element, this );
                    }
                } );
            }
        },
        setElementVars: function ( element ) {
            const element$ = $( element );

            element._element$ = element$;

            element._spectrum$ = element$.find( ".a-ColorSpectrum-spectrum" );
            element._spectrumPointer$ = element$.find( ".a-ColorSpectrum-spectrum > .a-ColorSpectrum-dragHandler" );
            element._spectrumWidth = element._spectrum$.width();
            element._spectrumHeight = element._spectrum$.height();
            element._pointerX = 0;
            element._pointerY = 0;

            element._spectrumPointerRadius = element._spectrumPointer$[0].offsetWidth / 2;
            if ( element._spectrumPointerRadius <= 0 ) {
                element._spectrumPointerRadius = element._spectrumPointer$.width() / 2;
            }

            element._hueSlider$ = element$.find( ".a-ColorSpectrum-slider--hue" );
            element._huePointer$ = element$.find( ".a-ColorSpectrum-slider--hue > .a-ColorSpectrum-dragHandler" );
            element._hueSliderLength = element._hueSlider$.height();

            if ( element._showAlpha ) {
                element._alphaSlider$ = element$.find( ".a-ColorSpectrum-slider--alpha" );
                element._alphaPointer$ = element$.find( ".a-ColorSpectrum-slider--alpha > .a-ColorSpectrum-dragHandler" );
                element._alphaSliderLength = element._alphaSlider$.width();
            }
        },
        setColorVars: function ( element, color ) {
            let _color = color || aColor.BLACK;

            if ( !colorSpectrumHelper.isColor( color ) ) {
                _color = new aColor( color );
            }

            element._value = _color;
            element._hsla = _color.getHSLA();
            element._hue = Math.round( element._hsla.h * 360 );
            element._sat = Math.round( element._hsla.s * 100 );
            element._lum = Math.round( element._hsla.l * 100 );
            element._alpha = element._hsla.a;
        },
        setColorHue: function ( element, hue ) {
            const _hue = hue || 0,
                  sat = element._hsla.s || 1,
                  lum = element._hsla.l || 0.5,
                  alpha = element._hsla.a,
                  hsla = { h: _hue, s: sat, l: lum, a: alpha };

            element.value = new aColor( hsla );
        },
        setColorSatLum: function ( element, sat, lum ) {
            const hsla = { h: element._hue, s: sat, l: lum, a: element._hsla.a };
            element.value = new aColor( hsla );
        },
        setColorAlpha: function ( element, alpha ) {
            const hsla = { h: element._hue, s: element._hsla.s, l: element._hsla.l, a: alpha };
            element.value = new aColor( hsla );
        },
        getSatLumSpectrumPosition: function ( element ) {
            const sat = element._sat,
                  lum = element._lum;

            let satPos = Math.min( ( sat / 100 ) * element._spectrumWidth, element._spectrumWidth );
            let lumPos = element._spectrumHeight - Math.min( ( lum / 100 ) * element._spectrumHeight, element._spectrumHeight );

            return { x: Math.round( satPos ), y: Math.round( lumPos ) };
        },
        getSatLumFromPosition: function ( element, xCenter, yCenter ) {
            const sat = ( xCenter / ( element._spectrumWidth - 1 ) ) * 100,
                  lum = 100 - ( yCenter / ( element._spectrumHeight - 1 ) ) * 100;

            return { s: sat, l: lum };
        },
        spectrumDrag: function ( element, event, ui ) {
            if ( element._disabled ) {
                return;
            }

            const pointerSize = element._spectrumPointerRadius,
                  spectrumWidth = element._spectrumWidth,
                  spectrumHeight = element._spectrumHeight;

            let cx, 
                cy, 
                off1, 
                off2;

            // Constrain the pointer center to inside the spectrum
            // Left and right sides
            if ( ui.position.left < -pointerSize ) {
                ui.position.left = -pointerSize;
                cx = 0;
            } else if ( ui.position.left + pointerSize >= spectrumWidth ) {
                ui.position.left = spectrumWidth - 1 - pointerSize;
                cy = spectrumWidth - 1;
            }

            // Top and bottom sides
            if ( ui.position.top < -pointerSize ) {
                ui.position.top = -pointerSize;
                cy = 0;
            } else if ( ui.position.top + pointerSize >= spectrumHeight ) {
                ui.position.top = spectrumHeight - 1 - pointerSize;
                cy = spectrumHeight - 1;
            }

            // Find center of dragged pointer relative to spectrum
            off1 = element._spectrumPointer$.offset();
            off2 = element._spectrum$.offset();
            if ( cx !== 0 ) {
                cx = off1.left + pointerSize - off2.left;
            }
            if ( cy !== 0 ) {
                cy = off1.top + pointerSize - off2.top;
            }
            // Almost always when we get a 'dragstop' the position has not changed from
            // the last 'drag', but we must update the value on 'dragstop',
            // so do not return in that case.
            if ( event.type !== "dragstop" && element._pointerX === cx && element._pointerY === cy ) {
                return;
            }

            if ( event.type === "drag" ) {
                element._pointerX = cx;
                element._pointerY = cy;
            } else {
                cx = element._pointerX; // use last drag position
                cy = element._pointerY;
            }

            colorSpectrumHelper.pointerMoved( element, cx, cy );

            if ( !element._spectrum$.is( ":focus" ) ) {
                element._spectrum$.focus();
            }
        },
        hueDrag: function ( element, dragElement ) {
            if ( element._disabled ) {
                return;
            }

            const pointerSize = element._spectrumPointerRadius,
                  length = element._hueSliderLength - pointerSize * 2,
                  start = element._hueSlider$.offset().top + pointerSize,
                  end = start + length - pointerSize,
                  yPos = $( dragElement ).offset().top;

            let hue;

            if ( yPos >= end ) {
                hue = 360;
            } else if ( yPos <= start ) {
                hue = 0;
            } else {
                hue = Math.round( ( ( end - yPos ) / length ) * 360 );
            }

            colorSpectrumHelper.setColorHue( element, hue );

            if ( !element._hueSlider$.is( ":focus" ) ) {
                element._hueSlider$.focus();
            }
        },
        alphaDrag: function ( element, dragElement ) {
            if ( element._disabled ) {
                return;
            }

            const pointerSize = element._spectrumPointerRadius,
                  length = element._alphaSliderLength - pointerSize * 2,
                  start = element._alphaSlider$.offset().left + pointerSize,
                  end = start + length - pointerSize,
                  xPos = $( dragElement ).offset().left;

            let alpha;

            if ( xPos >= end ) {
                alpha = 1;
            } else if ( xPos <= start ) {
                alpha = 0;
            } else {
                alpha = Math.round( ( 1 - ( end - xPos ) / length ) * 100 ) / 100;
            }

            colorSpectrumHelper.setColorAlpha( element, alpha );

            if ( !element._alphaSlider$.is( ":focus" ) ) {
                element._alphaSlider$.focus();
            }
        },
        setPointerPosition: function ( element, x, y ) {
            // y can never be NaN
            // x is only NaN from _keyDown() function
            if ( !isNaN( x ) ) {
                element._pointerX = x;
            }
            element._pointerY = y;
            colorSpectrumHelper.movePointer( element, 0, 0 );
        },
        movePointer: function ( element, xDelta, yDelta ) {
            // Ensure that the pointer center hasn't gone outside the spectrum
            let x = element._pointerX + xDelta,
                y = element._pointerY + yDelta;

            if ( x < 0 ) {
                x = 0;
            }
            if ( y < 0 ) {
                y = 0;
            }
            if ( x >= element._spectrumWidth ) {
                x = element._spectrumWidth - 1;
            }
            if ( y >= element._spectrumHeight ) {
                y = element._spectrumHeight - 1;
            }

            element._pointerX = x;
            element._pointerY = y;

            x = x - element._spectrumPointerRadius + "px";
            y = y - element._spectrumPointerRadius + "px";
            element._spectrumPointer$[0].style.left = x;
            element._spectrumPointer$[0].style.top = y;
        },
        setSpectrumHue: function ( element, movePointer ) {
            const hue = element._hue || 0,
                  color = new aColor( { h: hue, s: 1, l: 0.5, a: 1 } );

            element._spectrum$.css( "background-color", color.toHslString() );

            if ( movePointer ) {
                const pos = colorSpectrumHelper.getSatLumSpectrumPosition( element );
                colorSpectrumHelper.setPointerPosition( element, pos.x, pos.y );
            }

            element._spectrum$.attr( "aria-valuetext", element._value.toHslString() );
        },
        setHueSlider: function ( element ) {
            const pointerSize = element._spectrumPointerRadius,
                  length = element._hueSliderLength - pointerSize * 2,
                  hue = element._hsla.h;

            let yPos = Math.round( length - hue * length );

            if ( yPos < 0 ) {
                yPos = 0;
            }
            if ( yPos >= length ) {
                yPos = length;
            }

            yPos = yPos + "px";
            element._huePointer$[0].style.top = yPos;

            element._hueSlider$.attr( "aria-valuenow", element._hue );
        },
        setAlphaSlider: function ( element ) {
            const pointerSize = element._spectrumPointerRadius,
                  length = element._alphaSliderLength - pointerSize * 2,
                  rgba = element._value.getRGBA(),
                  alpha = element._alpha;

            let xPos = Math.round( alpha * length );

            if ( xPos < 0 ) {
                xPos = 0;
            }
            if ( xPos >= length ) {
                xPos = length;
            }

            xPos = xPos + "px";
            element._alphaPointer$[0].style.left = xPos;
            element._alphaSlider$.attr( "aria-valuenow", alpha );
            element._alphaSlider$.css(
                "background",
                `linear-gradient(90deg, rgba(${rgba.r}, ${rgba.g}, ${rgba.b}, 0), rgb(${rgba.r}, ${rgba.g}, ${rgba.b})) repeat scroll 0% 0%, rgba(${rgba.r}, ${rgba.g}, ${rgba.b}, 0) repeat scroll 0% 0%`
            );
        },
        spectrumClick: function ( element, event ) {
            if ( element._disabled ) {
                return;
            }

            const pos = element._spectrum$.offset(); // get click position relative
            let xDisp = event.pageX - pos.left, // relative to spectrum
                yDisp = event.pageY - pos.top, // top left
                sat,
                lum,
                o;

            xDisp = Math.round( xDisp );
            yDisp = Math.round( yDisp );
            o = colorSpectrumHelper.getSatLumFromPosition( element, xDisp, yDisp );
            sat = o.s;
            lum = o.l;

            colorSpectrumHelper.setColorSatLum( element, sat, lum );

            if ( !element._spectrum$.is( ":focus" ) ) {
                element._spectrum$.focus();
            }
        },
        hueClick: function ( element, event ) {
            if ( element._disabled ) {
                return;
            }

            const pointerSize = element._spectrumPointerRadius,
                  length = element._hueSliderLength - pointerSize * 2,
                  start = element._hueSlider$.offset().top + pointerSize,
                  end = start + length - pointerSize,
                  yPos = event.pageY;

            let hue;

            if ( yPos >= end ) {
                hue = 360;
            } else if ( yPos <= start ) {
                hue = 0;
            } else {
                hue = Math.round( ( ( end - yPos ) / length ) * 360 );
            }

            colorSpectrumHelper.setColorHue( element, hue );

            if ( !element._hueSlider$.is( ":focus" ) ) {
                element._hueSlider$.focus();
            }
        },
        alphaClick: function ( element, event ) {
            if ( element._disabled ) {
                return;
            }

            const pointerSize = element._spectrumPointerRadius,
                  length = element._alphaSliderLength - pointerSize * 2,
                  start = element._alphaSlider$.offset().left + pointerSize,
                  end = start + length - pointerSize,
                  xPos = event.pageX;

            let alpha;

            if ( xPos >= end ) {
                alpha = 1;
            } else if ( xPos <= start ) {
                alpha = 0;
            } else {
                alpha = Math.round( ( 1 - ( end - xPos ) / length ) * 100 ) / 100;
            }

            colorSpectrumHelper.setColorAlpha( element, alpha );

            if ( !element._alphaSlider$.is( ":focus" ) ) {
                element._alphaSlider$.focus();
            }
        },
        pointerMoved: function ( element, xCenter, yCenter ) {
            let o = colorSpectrumHelper.getSatLumFromPosition( element, xCenter, yCenter ),
                sat = o.s,
                lum = o.l;

            colorSpectrumHelper.setColorSatLum( element, sat, lum );
            element._spectrumPointer$.focus();
        },
        handleSpectrumKeys: function ( element, event ) {
            if ( element._disabled ) {
                return;
            }

            const pointerSize = element._spectrumPointerRadius,
                  distance = 1 + Math.round( pointerSize / 2 ),
                  keys = $.ui.keyCode;

            let xDelta = 0,
                yDelta = 0;

            switch ( event.keyCode ) {
            case keys.LEFT:
                xDelta = xDelta - distance;
                break;
            case keys.UP:
                yDelta = yDelta - distance;
                break;
            case keys.RIGHT:
                xDelta = xDelta + distance;
                break;
            case keys.DOWN:
                yDelta = yDelta + distance;
                break;
            default:
                break;
            }

            if ( [keys.LEFT, keys.UP, keys.RIGHT, keys.DOWN].includes( event.keyCode ) ) {
                event.preventDefault();
            }

            colorSpectrumHelper.movePointer( element, xDelta, yDelta );
            colorSpectrumHelper.pointerMoved( element, element._pointerX, element._pointerY );
        },
        handleHueKeys: function ( element, event ) {
            if ( element._disabled ) {
                return;
            }

            const pointerSize = element._spectrumPointerRadius,
                  length = element._hueSliderLength - pointerSize * 2,
                  start = element._hueSlider$.offset().top + pointerSize,
                  end = start + length - pointerSize,
                  distance = 1 + Math.round( pointerSize / 2 ),
                  keys = $.ui.keyCode;

            let yPos = element._huePointer$.offset().top,
                hue;

            switch ( event.keyCode ) {
            case keys.LEFT:
                yPos = yPos - distance;
                break;
            case keys.UP:
                yPos = yPos - distance;
                break;
            case keys.RIGHT:
                yPos = yPos + distance;
                break;
            case keys.DOWN:
                yPos = yPos + distance;
                break;
            default:
                break;
            }

            if ( [keys.LEFT, keys.UP, keys.RIGHT, keys.DOWN].includes( event.keyCode ) ) {
                event.preventDefault();
            }

            if ( yPos >= end ) {
                hue = 360;
            } else if ( yPos <= start ) {
                hue = 0;
            } else {
                hue = Math.round( ( ( end - yPos ) / length ) * 360 );
            }

            colorSpectrumHelper.setColorHue( element, hue );
        },
        handleAlphaKeys: function ( element, event ) {
            if ( element._disabled ) {
                return;
            }

            const pointerSize = element._spectrumPointerRadius,
                  length = element._alphaSliderLength - pointerSize * 2,
                  start = element._alphaSlider$.offset().left + pointerSize,
                  end = start + length - pointerSize,
                  distance = 1 + Math.round( pointerSize / 2 ),
                  keys = $.ui.keyCode;

            let xPos = element._alphaPointer$.offset().left,
                alpha;

            switch ( event.keyCode ) {
            case keys.LEFT:
                xPos = xPos - distance;
                break;
            case keys.UP:
                xPos = xPos - distance;
                break;
            case keys.RIGHT:
                xPos = xPos + distance;
                break;
            case keys.DOWN:
                xPos = xPos + distance;
                break;
            default:
                break;
            }

            if ( [keys.LEFT, keys.UP, keys.RIGHT, keys.DOWN].includes( event.keyCode ) ) {
                event.preventDefault();
            }

            if ( xPos >= end ) {
                alpha = 1;
            } else if ( xPos <= start ) {
                alpha = 0;
            } else {
                alpha = Math.round( ( 1 - ( end - xPos ) / length ) * 100 ) / 100;
            }
            colorSpectrumHelper.setColorAlpha( element, alpha );
        },
        handleDisable( element, isDisabled = false ) {
            if ( isDisabled === true ) {
                element._disabled = true;
                element._element$.addClass( "apex_disabled" );
                element._spectrum$.attr( "tabindex", "-1" );
                element._hueSlider$.attr( "tabindex", "-1" );
                element._alphaSlider$.attr( "tabindex", "-1" );
            } else {
                element._disabled = false;
                element._element$.removeClass( "apex_disabled" );
                element._spectrum$.attr( "tabindex", "0" );
                element._hueSlider$.attr( "tabindex", "0" );
                element._alphaSlider$.attr( "tabindex", "0" );
            }
        },
        updateUI: function ( element ) {
            colorSpectrumHelper.setSpectrumHue( element, true );
            colorSpectrumHelper.setHueSlider( element );

            if ( element._showAlpha ) {
                colorSpectrumHelper.setAlphaSlider( element );
            }
        }
    };

    const spectrumComponentMetaData = {
        showAlpha: {
            type: WebComponent.dataTypes.boolean,
            defaultValue: true,
            reactive: false
        }
    };

    WebComponent._addHyphenCaseAttrNames( spectrumComponentMetaData );
    const spectrumObservedAttributes = WebComponent._configObservedAttributes( spectrumComponentMetaData, [P_DISABLED, P_VALUE] );
    let savedSpectrumConstructor;

    class Colorspectrum extends WebComponent {
        #v = {
            showAlpha: undefined
        };

        constructor() {
            super();
            this._configPrivateState( this.#v );
            savedSpectrumConstructor = this.constructor;
        }

        get value() {
            return this._value;
        }

        set value( val ) {
            const element = this;

            function _setValue( val ) {
                const currentVal = element._value || aColor.BLACK;

                let color;

                if ( colorSpectrumHelper.isColor( val ) ) {
                    color = val;
                } else {
                    color = new aColor( val );
                }

                if ( !currentVal.isEqual( color ) ) {
                    colorSpectrumHelper.setColorVars( element, color );
                    colorSpectrumHelper.updateUI( element );
                    element._element$.trigger( "spectrumValueChanged", { value: color } );
                }
            }
            if ( element.rendered ) {
                _setValue( val );
            } else {
                queueMicrotask( () => {
                    _setValue( val );
                } );
            }
        }

        get disabled() {
            return this._disabled;
        }

        set disabled( val ) {
            colorSpectrumHelper.handleDisable( this, val );
        }

        _render( /* attrChanges */ ) {
            const element = this;

            if ( !element.rendered ) {
                let initValue = aColor.BLACK;

                if ( element.hasAttribute( P_VALUE ) ) {
                    initValue = element.getAttribute( P_VALUE );
                    initValue = new aColor( initValue );
                }

                element._disabled = false;
                element._showAlpha = element.#v.showAlpha;

                colorSpectrumHelper.render( element );

                queueMicrotask( () => {
                    colorSpectrumHelper.setElementVars( element );

                    colorSpectrumHelper.initSliders( element );
                    colorSpectrumHelper.initHandlers( element );

                    colorSpectrumHelper.setColorVars( element, initValue );
                    colorSpectrumHelper.updateUI( element );

                    if ( element.hasAttribute( P_DISABLED ) ) {
                        colorSpectrumHelper.handleDisable( element, true );
                    }
                } );
            }
        }

        attributeChangedCallback( attribute, oldValue, newValue ) {
            super.attributeChangedCallback( attribute, oldValue, newValue );
            const element = this;

            if ( element.rendered ) {
                if ( attribute === P_DISABLED ) {
                    colorSpectrumHelper.handleDisable( element, newValue === P_DISABLED );
                }

                if ( attribute === P_VALUE ) {
                    if ( oldValue !== newValue ) {
                        colorSpectrumHelper.setColorVars( element, new aColor( newValue ) );
                        colorSpectrumHelper.updateUI( element );
                    }
                }
            }
        }

        // callback when element is disconnected
        disconnectedCallback() {
            super.disconnectedCallback();
        }

        // callback when element is moved between documents (also between parent and iframe modal dialogs)
        // seems to be required for Firefox in particular, because FF looses all element properties when moved
        // between documents
        adoptedCallback() {
            if ( !( this instanceof Colorspectrum ) ) {
                Object.setPrototypeOf( this, savedSpectrumConstructor.prototype );
            }
        }

        static get observedAttributes() {
            return spectrumObservedAttributes;
        }

        static get componentMetaData() {
            return spectrumComponentMetaData;
        }
    }

    customElements.define( "a-color-spectrum", Colorspectrum );

    //
    //
    // Color Picker
    //
    //
    const EVENT_CLICK = "click",
          EVENT_CHANGE = "change";

    const keys = $.ui.keyCode,
          isMac = navigator.appVersion.includes( "Mac" );

    const DISPLAY_AS_INLINE = "INLINE",
          DISPLAY_AS_POPUP = "POPUP",
          DISPLAY_AS_COLOR_ONLY = "COLOR_ONLY",
          DISPLAY_AS_NATIVE = "NATIVE",
          DISPLAY_MODE_FULL = "FULL",
          DISPLAY_MODE_SIMPLE = "SIMPLE";

    const RETURN_AS_HEX = "HEX", // default
          RETURN_AS_RGB = "RGB",
          RETURN_AS_RGBA = "RGBA",
          RETURN_AS_HSL = "HSL",
          RETURN_AS_HSLA = "HSLA",
          RETURN_AS_CSS = "CSS";

    const colorExamples = {
        HEX: "#3caf85",
        RGB: "rgb(60, 175, 133)",
        RGBA: "rgba(60, 175, 133, 0.5)",
        HSL: "hsl(158, 49%, 46%)",
        HSLA: "hsla(158, 49%, 46%, 0.5)",
        CSS: "#3caf85"
    };

    const C_HIDDEN = "u-hidden",
          C_ICON_SUCCESS = "icon-check",
          C_ICON_WARNING = "icon-warning",
          C_TEXT_SUCCESS = "u-success-text",
          C_TEXT_WARNING = "u-warning-text",
          A_ARIA_EXPANDED = "aria-expanded";

    const defaultColor = "000000", // match default for native input type=color which is #000000
          dialogClass = "ui-dialog-color-picker",
          itemWrapperClass = "apex-item-wrapper--color-picker",
          colorPickerPrefixClass = "a-ColorPicker",
        // preview classes
          colorPreviewClass = colorPickerPrefixClass + "-preview",
          colorPreviewCurrentClass = colorPreviewClass + "--current",
          colorPreviewInitClass = colorPreviewClass + "--initial",
          colorPreviewValueClass = colorPreviewClass + "-value",
          colorContrastClass = colorPickerPrefixClass + "-contrast",
          colorContrastIconClass = colorContrastClass + "Icon",
          colorContrastResultClass = colorContrastClass + "Result",
          colorContrastRatingClass = colorContrastClass + "Rating",
          colorContrastColor1Class = colorContrastClass + "Color1",
          colorContrastColor2Class = colorContrastClass + "Color2",
          itemColorPreviewClass = "apex-item-color-picker-preview",
          itemColorNoPreviewClass = itemColorPreviewClass + "--noPreview",
        // color detail classes
          colorDetailClass = colorPickerPrefixClass + "-detail",
          colorDetailRGBClass = colorDetailClass + "--rgb",
          colorDetailHSLClass = colorDetailClass + "--hsl",
          colorDetailHexClass = colorDetailClass + "--hex",
          colorDetailItemClass = colorDetailClass + "Item",
          colorDetailItemRClass = colorDetailItemClass + "--r",
          colorDetailItemGClass = colorDetailItemClass + "--g",
          colorDetailItemBClass = colorDetailItemClass + "--b",
          colorDetailItemHClass = colorDetailItemClass + "--h",
          colorDetailItemSClass = colorDetailItemClass + "--s",
          colorDetailItemLClass = colorDetailItemClass + "--l",
          colorDetailItemAClass = colorDetailItemClass + "--a",
          colorDetailItemHexClass = colorDetailItemClass + "--hex",
          colorDetailLabelClass = colorDetailClass + "Label",
          colorDetailInputClass = colorDetailClass + "Input",
          colorDetailToggleClass = colorPickerPrefixClass + "-detailsToggle";

    // preset classes
    const colorPresetClass = colorPickerPrefixClass + "-preset",
          colorPresetMenuButtonClass = colorPresetClass + "MenuButton",
          colorPresetMenuClass = colorPresetClass + "Menu";
    /*
     * APP UI styles define 15 color preset variables.
     * --a-color-picker-preset-1 to --a-color-picker-preset-15
     * A theme can override the color values.
     */
    const colorPresetMaxCount = 5,
          colorPresetThemeStyleTotal = 15, // Keep in sync with theme presets
          colorPresetCssVariableName = "--a-color-picker-preset-";

    const BG_COLOR_PROP = "background-color",
          COLOR_PROP = "color",
        // regexp
          NUM_CAPTURE = "\\s*(-?\\d+|-?\\d*\\.\\d+)",
          HSLA_FN_RE = new RegExp( `hsla?\\(${NUM_CAPTURE}\\s*,${NUM_CAPTURE}%\\s*,${NUM_CAPTURE}%\\s*(?:,${NUM_CAPTURE}\\s*)?\\)` ), // matches hsl(h, s%, l%) or hsla(h, s%, l%, a)
          HEX_RE = /^(#)?([a-f0-9]{3}|[a-f0-9]{6})$/i,
          RGB_RE = /^([01]?[0-9]{1,2}|2[0-4][0-9]|25[0-5])$/i, // between 0 and 255
          ALPHA_RE = /^([0-9]*\.)?[0-9]{1,2}$/i,
          HUE_RE = /^([012]?[0-9]{1,2}|3[0-5][0-9])$/i, // between 0 and 359
          SAT_LUM_RE = /^([0]?[0-9]{1,2}|100)$/i; // between 0 and 100

    function getMessage( key ) {
        return lang.getMessage( "APEX.COLOR_PICKER." + key );
    }

    function getCssVariableColor( cssVariableName ) {
        const computedStyle = window.getComputedStyle( document.documentElement );
        return computedStyle ? computedStyle.getPropertyValue( cssVariableName.trim() ) : "";
    }

    /* Sets the background color for the preview element */
    function setColorPreview( pElem, color ) {
        pElem.css( BG_COLOR_PROP, color.toString() );
    }

    // id is optional
    function renderColorContrastReport( id ) {
        return `<div ${id ? 'id="' + id + '"' : ""} class="${colorContrastClass}">\
<span class="a-ColorPicker-contrastText">${util.escapeHTML( getMessage( "CONTRAST" ) )}</span>\
<div class="a-ColorPicker-contrastColorCheck">\
<span class="${colorContrastColor1Class}"></span>\
<span class="${colorContrastColor2Class}"></span>\
</div>\
<span class="${colorContrastResultClass}"></span>\
<span class="${colorContrastRatingClass}"></span>\
<span aria-hidden="true" class="${colorContrastIconClass} a-Icon"></span>\
</div>`;
    }

    function updateColorContrastReport( report$, contrastInfo ) {
        let resultIcon,
            ratioText,
            ratingText = "",
            warn = false;

        report$.children().toggle( !!contrastInfo );
        if ( contrastInfo ) {
            if ( contrastInfo.aaa_small ) {
                // if AAA passed
                resultIcon = `${C_ICON_SUCCESS} ${C_TEXT_SUCCESS}`;
                ratingText = "AAA";
            } else if ( contrastInfo.aa_small ) {
                // if AA passed
                resultIcon = `${C_ICON_SUCCESS} ${C_TEXT_SUCCESS}`;
                ratingText = "AA";
            } else {
                //else nothing passed
                resultIcon = `${C_ICON_WARNING} ${C_TEXT_WARNING}`;
                warn = true;
            }
            ratioText = Math.round( ( contrastInfo.ratio + Number.EPSILON ) * 100 ) / 100; // to ensure things like 1.005 round correctly

            report$
                .toggleClass( "is-warning", warn )
                .find( "." + colorContrastIconClass )
                .removeClass( `${C_ICON_SUCCESS} ${C_ICON_WARNING} ${C_TEXT_SUCCESS} ${C_TEXT_WARNING}` )
                .addClass( resultIcon );
            report$.find( "." + colorContrastResultClass ).text( ratioText );
            report$.find( "." + colorContrastRatingClass ).text( ratingText );
            setColorPreview( report$.find( "." + colorContrastColor1Class ), contrastInfo.color_1 );
            setColorPreview( report$.find( "." + colorContrastColor2Class ), contrastInfo.color_2 );
        } else {
            report$.removeClass( "is-warning" );
        }
    }

    // make these available for internal use
    widgetUtil.colorPicker = {
        renderColorContrastReport: renderColorContrastReport,
        updateColorContrastReport: updateColorContrastReport
    };

    function renderColorPresets( out, idPrefix, presetColors, maxCount ) {
        let colorValues = [],
            menuId = null,
            colorPresetsMenuItems = [],
            colorSeparator = ";";

        out.markup( `<div id="${idPrefix}presets" class="a-ColorPicker-presets">` );

        if ( presetColors === "THEME" ) {
            colorValues = ["#000000", "#ffffff"]; // always black & white buttons
            
            for ( let i = 0; i < colorPresetThemeStyleTotal; i++ ) {
                let color = getCssVariableColor( colorPresetCssVariableName + ( i + 1 ) );
                if ( color ) {
                    colorValues.push( color );
                }
            }
        } else {
            // let's support ";" & ":" as a valid separator
            colorSeparator = presetColors.includes( ":" ) ? ":" : presetColors.includes( ";" ) ? ";" : ";";
            colorValues = presetColors.split( colorSeparator );
        }

        let colorPresetsVisible = colorValues.slice( 0, maxCount ),
            colorPresetsDropdown = colorValues.slice( maxCount );

        // render the visible color presets
        for ( let i = 0; i < colorPresetsVisible.length; i++ ) {
            let preset = util.escapeHTML( colorPresetsVisible[i].trim() ),
                color = colorUtilities.getValidColor( preset );

            if ( color ) {
                let colorPreview = BG_COLOR_PROP + ":" + color.toString() + ";";

                out.markup( `<button type="button" class="a-Button ${colorPresetClass}" aria-label="${preset}"` )
                    .optionalAttr( "style", colorPreview )
                    .attr( "data-color-value", preset )
                    .markup( "></button>" );
            }
        }

        // render the dropdown color presets
        if ( colorPresetsDropdown.length ) {
            menuId = idPrefix + "presetMenu";
            out.markup( `<button type="button" data-menu="${menuId}"\
class="a-Button ${colorPresetClass} ${colorPresetMenuButtonClass}" aria-label="${util.escapeHTMLAttr( getMessage( "MORE_PRESET_COLORS" ) )}">\
<span aria-hidden="true" class="a-Icon icon-down-chevron"></span></button>
<div id="${menuId}" class="${colorPresetMenuClass}"></div>` );

            for ( let i = 0; i < colorPresetsDropdown.length; i++ ) {
                let preset = colorPresetsDropdown[i];

                colorPresetsMenuItems.push( {
                    type: "action",
                    iconType: "a-Icon",
                    icon: "icon-color-preview",
                    iconStyle: COLOR_PROP + ":" + colorUtilities.getValidColor( preset ) + ";",
                    value: preset,
                    label: preset
                    // action to be set later
                } );
            }
        }

        out.markup( "</div>" );
        return colorPresetsMenuItems;
    }

    function initColorPresets( element$, idPrefix, colorPresetsMenuItems, setColor ) {
        let presets$ = element$.find( "#" + idPrefix + "presets" ),
            colorPresetsButton$ = presets$.find( "." + colorPresetClass ).not( "." + colorPresetMenuButtonClass ),
            colorPresetsMenuButton$ = presets$.find( "." + colorPresetMenuButtonClass ),
            colorPresetsMenu$ = element$.find( "#" + idPrefix + "presetMenu" );

        // handle the color presets
        colorPresetsButton$.on( EVENT_CLICK, function () {
            let colorValue = $( this ).attr( "data-color-value" );

            setColor( colorValue );
        } );

        // color preset dropdown menu
        if ( colorPresetsMenuButton$ ) {
            colorPresetsMenuItems.forEach( ( item ) => {
                item.action = function () {
                    setColor( item.value );
                };
            } );
            colorPresetsMenu$.menu( {
                items: colorPresetsMenuItems
            } );
        }
    }

    const colorSpectrumPickerPrototype = {
        // two step initialization, first render then initialize, is so that callers and initialize can wait
        render: function () {
            this.colorSpectrumContent$ = $( this._render() ); // rendered but not yet inserted into the document

            let colorSpectrum$ = this.colorSpectrumContent$.find( "a-color-spectrum" );

            // return a promise for when the color spectrum is ready
            return colorSpectrum$[0];
        },
        initialize: function () {
            let element$,
                colorSpectrumContent$, 
                colorDetailItems$, 
                colorDetailToggleButton$;

            // handles the color format toggle
            const colorFormatToggle = () => {
                let details$ = colorSpectrumContent$.find( "." + colorDetailClass ),
                    currentDetail$ = details$.not( "." + C_HIDDEN ),
                    nextDetail$ = currentDetail$.next( "." + colorDetailClass ),
                    colorDetailToggleButton$ = colorSpectrumContent$.find( "." + colorDetailToggleClass ),
                    colorFormat = "";

                if ( !currentDetail$.length ) {
                    // initially they are all hidden. Pick the one to show initially based on the return as type returnAs
                    let suffix = this.returnAs.substr( 0, 3 ).toLowerCase();
                    if ( !["hex", "rgb", "hsl"].includes( suffix ) ) {
                        suffix = "hex";
                    }
                    nextDetail$ = details$.filter( "." + colorDetailClass + "--" + suffix );
                }

                currentDetail$.addClass( C_HIDDEN );

                if ( nextDetail$.length ) {
                    // show the next color type
                    nextDetail$.removeClass( C_HIDDEN );
                    colorFormat = nextDetail$.attr( "data-format" );
                } else {
                    // circle back and show the first one
                    details$.eq( 0 ).removeClass( C_HIDDEN );
                    colorFormat = details$.eq( 0 ).attr( "data-format" );
                }
                colorDetailToggleButton$.attr( "aria-valuetext", colorFormat );
            };
            const setColorSpectrum = ( colorValue ) => {
                let color = colorUtilities.getValidColor( colorValue );

                if ( color !== null ) {
                    this.colorSpectrum$[0].value = color;
                }
            };
            // Handle color changes
            const colorSelectionChanged = ( event ) => {
                let color,
                    target$ = $( event.target );
                // if changed from the color spectrum
                if ( target$[0] === this.colorSpectrum$[0] ) {
                    color = target$[0].value;

                    // update rgb values
                    this._setColorDetailRGB( color );

                    // update hsl values
                    this._setColorDetailHSL( color );

                    // update hex value
                    this._setColorDetailHex( color );
                } else if ( target$.hasClass( colorDetailInputClass ) ) {
                    // if changed from one of the details input
                    let detail$ = target$.closest( "." + colorDetailClass );

                    if ( detail$.hasClass( colorDetailHexClass ) ) {
                        // HEX
                        color = this._getHexDetailColor();

                        // check if value is valid
                        if ( color === null ) {
                            this._setColorDetailHex( this.aColorCurrent );
                            return;
                        }
                    } else if ( detail$.hasClass( colorDetailHSLClass ) ) {
                        // HSL
                        color = this._getHSLDetailColor();

                        // check if value is valid
                        if ( color === null ) {
                            this._setColorDetailHSL( this.aColorCurrent );
                            return;
                        }
                    } else {
                        // RGB
                        color = this._getRGBDetailColor();

                        // check if value is valid
                        if ( color === null ) {
                            this._setColorDetailRGB( this.aColorCurrent );
                            return;
                        }
                    }

                    // updating the color spectrum causes a spectrumValueChanged event which will update the other details
                    this.colorSpectrum$[0].value = color;
                }

                // update the current color preview
                setColorPreview( this.colorPreviewCurrent$, color );

                this.aColorCurrent = color;
                this.valueChanged( color );

                // set contrast result; must be done after the valueChanged callback
                if ( this.contrastCheck ) {
                    this.updateColorContrast();
                }
            };

            /*
             * Create the color spectrum picker content and add to given container
             */
            element$ = this.element$;
            colorSpectrumContent$ = this.colorSpectrumContent$;
            element$.empty().append( colorSpectrumContent$ );

            // References for later
            this.colorSpectrum$ = colorSpectrumContent$.find( "a-color-spectrum" );

            this.colorPreviewCurrent$ = colorSpectrumContent$.find( "." + colorPreviewCurrentClass + " ." + colorPreviewValueClass );
            this.colorPreviewInitial$ = colorSpectrumContent$.find( "." + colorPreviewInitClass + " ." + colorPreviewValueClass );

            this.colorSpectrumContrast$ = colorSpectrumContent$.find( "." + colorContrastClass );

            colorDetailItems$ = colorSpectrumContent$.find( "." + colorDetailInputClass );
            colorDetailToggleButton$ = colorSpectrumContent$.find( "." + colorDetailToggleClass );

            // handle the color spectrum change event
            // use the transient event instead of the change so that the color updates as it changes (e.g. when dragging)
            this.colorSpectrum$.on( "spectrumValueChanged", colorSelectionChanged );

            // handle the color details change event
            colorDetailItems$.on( EVENT_CHANGE, colorSelectionChanged );

            // handle the color type toggle
            colorDetailToggleButton$.on( EVENT_CLICK, colorFormatToggle );
            colorFormatToggle();

            // color presets
            if ( this.presetColors ) {
                initColorPresets( element$, this.idPrefix, this.colorPresetsMenuItems, setColorSpectrum );
            }

            colorSpectrumContent$.closest( ".ui-dialog,.a-ColorPicker-inlineWrap" ).on( "keydown", ( event ) => {
                let kc = event.which;

                if ( ( kc === 90 && ( ( !isMac && event.ctrlKey ) || ( isMac && event.metaKey ) ) ) || kc === keys.BACKSPACE ) {
                    // Ctrl-Z or Command-Z on Mac or backspace
                    if ( event.target.nodeName !== "INPUT" ) {
                        event.preventDefault();
                        this.revert();
                    }
                }
            } );

            colorSpectrumContent$.find( ".a-ColorPicker-preview--initial .a-ColorPicker-preview-value" ).on( EVENT_CLICK, () => {
                this.revert();
            } );
        },
        setColor: function ( colorValue, isInitial = false ) {
            let color = colorUtilities.getValidColor( colorValue );

            // if not a valid color use the default
            if ( !color ) {
                color = colorUtilities.makeColor( defaultColor );
            }
            this.aColorCurrent = color;
            if ( isInitial ) {
                this.aColorInitial = color;
            }

            if ( !this.showAlpha ) {
                // remove alpha if it is present
                if ( this.aColorInitial && this.aColorInitial.getAlpha() !== 1 ) {
                    // change alpha back to 1
                    this.aColorInitial._a = 1;
                }
            }

            // setting the color spectrum's value would trigger a change event
            // when setting the inital value, we supppress this event
            this.ignoreChangeEvent = isInitial;
            this.colorSpectrum$[0].value = color;
            this.ignoreChangeEvent = false;

            setColorPreview( this.colorPreviewCurrent$, color );
            if ( isInitial ) {
                setColorPreview( this.colorPreviewInitial$, color );
            }
            this._setColorDetailRGB( color );
            this._setColorDetailHSL( color );
            this._setColorDetailHex( color );

            this.updateColorContrast();
        },
        revert: function () {
            this.colorSpectrum$[0].value = this.aColorInitial;
        },
        getColor: function () {
            return this.aColorCurrent;
        },
        getCurrentFormat: function () {
            let details$ = this.colorSpectrumContent$.find( "." + colorDetailClass ),
                currentDetail$ = details$.not( "." + C_HIDDEN );

            return currentDetail$.attr( "data-format" );
        },
        updateColorContrast: function () {
            let contrast = this.getContrast(); // callback to get contrast

            updateColorContrastReport( this.colorSpectrumContrast$, contrast );
        },
        _setColorDetailRGB: function ( aColor ) {
            let colorDetailItems$ = this.colorSpectrumContent$.find( "." + colorDetailRGBClass + " input" );

            // order is RGBA
            colorDetailItems$.eq( 0 ).val( aColor.getRed() );
            colorDetailItems$.eq( 1 ).val( aColor.getGreen() );
            colorDetailItems$.eq( 2 ).val( aColor.getBlue() );

            if ( this.showAlpha ) {
                colorDetailItems$.eq( 3 ).val( aColor.getAlpha() );
            }
        },
        _setColorDetailHSL: function ( aColor ) {
            let colorDetailItems$ = this.colorSpectrumContent$.find( "." + colorDetailHSLClass + " input" ),
                hsl = colorUtilities.colorToHSL( aColor );

            // order is HSLA
            colorDetailItems$.eq( 0 ).val( hsl.h );
            colorDetailItems$.eq( 1 ).val( hsl.s );
            colorDetailItems$.eq( 2 ).val( hsl.l );

            if ( this.showAlpha ) {
                colorDetailItems$.eq( 3 ).val( hsl.a );
            }
        },
        _setColorDetailHex: function ( aColor ) {
            let colorDetailItems$ = this.colorSpectrumContent$.find( "." + colorDetailHexClass + " input" ),
                hexColor = aColor.toHexString();

            colorDetailItems$.val( hexColor.replace( "#", "" ) );
        },
        /* Get the color from the Hex input field */
        _getHexDetailColor: function () {
            let detailItem$ = this.colorSpectrumContent$.find( "." + colorDetailHexClass + " input" ),
                hexValue = detailItem$.val();

            // if not a color color pattern
            if ( !HEX_RE.test( hexValue ) ) {
                return null;
            } // else
            return colorUtilities.makeColor( hexValue );
        },
        /* Get the color from the R, G and B input field */
        _getHSLDetailColor: function () {
            let aNum,
                detailItem$ = this.colorSpectrumContent$.find( "." + colorDetailHSLClass + " input" ), // order is HSLA
                hValue = detailItem$.eq( 0 ).val(),
                sValue = detailItem$.eq( 1 ).val(),
                lValue = detailItem$.eq( 2 ).val(),
                aValue = this.showAlpha ? detailItem$.eq( 3 ).val() : "1";

            // validate hue:         must be between 0 and 360
            // validate saturation:  must be between 0 and 100
            // validate lightness:   must be between 0 and 100
            if ( !HUE_RE.test( hValue ) || !SAT_LUM_RE.test( sValue ) || !SAT_LUM_RE.test( lValue ) ) {
                return null;
            } // else

            // validate alpha:       must be between 0 and 1 with up to two digits
            aNum = parseFloat( aValue );
            if ( this.showAlpha && ( !ALPHA_RE.test( aValue ) || aNum < 0 || aNum > 1 ) ) {
                return null;
            } // else
            return colorUtilities.makeColor( {
                h: hValue,
                s: sValue,
                l: lValue,
                a: aValue
            } );
        },
        /* Get the color from the R, G and B input field */
        _getRGBDetailColor: function () {
            let aNum,
                detailItem$ = this.colorSpectrumContent$.find( "." + colorDetailRGBClass + " input" ), // order is RGBA
                rValue = detailItem$.eq( 0 ).val(),
                gValue = detailItem$.eq( 1 ).val(),
                bValue = detailItem$.eq( 2 ).val(),
                aValue = this.showAlpha ? detailItem$.eq( 3 ).val() : "1";

            // validate colors: must be between 0 and 255
            if ( !RGB_RE.test( rValue ) || !RGB_RE.test( gValue ) || !RGB_RE.test( bValue ) ) {
                return null;
            } // else

            // validate alpha:       must be between 0 and 1 with up to two digits
            aNum = parseFloat( aValue );
            if ( this.showAlpha && ( !ALPHA_RE.test( aValue ) || aNum < 0 || aNum > 1 ) ) {
                return null;
            } // else

            return colorUtilities.makeColor( {
                r: rValue,
                g: gValue,
                b: bValue,
                a: aValue
            } );
        },
        _render: function () {
            /* HTML Structure:
             *
             * .color-picker-inline-wrapper (wrapper for inline only)
             * .a-ColorPicker
             *     .a-ColorPicker-spectrum
             *         a-color-spectrum
             *
             *     .a-ColorPicker-previews
             *         .a-ColorPicker-preview.a-ColorPicker-preview--current
             *               .a-ColorPicker-preview-label
             *               .a-ColorPicker-preview-value
             *         .a-ColorPicker-preview.a-ColorPicker-preview--initial
             *               .a-ColorPicker-preview-label
             *               .a-ColorPicker-preview-value
             *
             *     .a-ColorPicker-colorContrast
             *
             *     .a-ColorPicker-details
             *         .a-ColorPicker-detail.a-ColorPicker-detail--rgb
             *             .a-ColorPicker-detailItem.a-ColorPicker-detailItem--r
             *               label.a-ColorPicker-detailLabel
             *               input.apex-item-text.a-ColorPicker-detailInput
             *             .a-ColorPicker-detailItem.a-ColorPicker-detailItem--g
             *               label.a-ColorPicker-detailLabel
             *               input.apex-item-text.a-ColorPicker-detailInput
             *             .a-ColorPicker-detailItem.a-ColorPicker-detailItem--b
             *               label.a-ColorPicker-detailLabel
             *               input.apex-item-text.a-ColorPicker-detailInput
             *
             *         .a-ColorPicker-detail.a-ColorPicker-detail--hsl
             *             .a-ColorPicker-detailItem.a-ColorPicker-detailItem--h
             *               label.a-ColorPicker-detailLabel
             *               input.apex-item-text.a-ColorPicker-detailInput
             *             .a-ColorPicker-detailItem.a-ColorPicker-detailItem--s
             *               label.a-ColorPicker-detailLabel
             *               input.apex-item-text.a-ColorPicker-detailInput
             *             .a-ColorPicker-detailItem.a-ColorPicker-detailItem--l
             *               label.a-ColorPicker-detailLabel
             *               input.apex-item-text.a-ColorPicker-detailInput
             *
             *         .a-ColorPicker-detail.a-ColorPicker-detail--hex
             *             .a-ColorPicker-detailItem.a-ColorPicker-detailItem--hex
             *               label.a-ColorPicker-detailLabel
             *               input.apex-item-text.a-ColorPicker-detailInput
             *
             *         .a-ColorPicker-detailsToggle
             *             .a-ColorPicker-detailsToggle-button
             *
             *     .a-ColorPicker-presets
             *         .a-ColorPicker-preset
             *         .a-ColorPicker-preset
             *         .a-ColorPicker-preset
             *         .a-ColorPicker-preset
             *         .a-ColorPicker-preset
             *         .a-ColorPicker-presetMenuButton (if more than 5 presets)
             *         .a-ColorPicker-presetMenus      (if more than 5 presets)
             */
            let cls,
                title,
                idPrefix = this.idPrefix,
                displayModeClass = colorPickerPrefixClass + "--simple",
                out = util.htmlBuilder(),
                color = this.aColorCurrent || colorUtilities.makeColor( defaultColor );

            // Utility function for the color preview element
            const renderColorPreview = ( pLabel, pElemClass, pAddAria = true ) => {
                out.markup( `<div class="${colorPreviewClass} ${pElemClass}"><div class="${colorPreviewValueClass}"` )
                    .attr( "title", pLabel )
                    .optionalAttr( "role", pAddAria ? "button" : null )
                    .optionalAttr( "aria-label", pAddAria ? pLabel : null )
                    .markup( "></div></div>" );
            };

            // Utility function for the detail input field
            // min, max, step only apply if isNumber is true
            const renderDetailField = ( pIdSuffix, pLabel, pMaxLength, isNumber, pElemClass, min, max, step = 1 ) => {
                let detailItemId = idPrefix + "colorPickerDetail_" + pIdSuffix;

                out.markup(
                    `<div class="${colorDetailItemClass} ${pElemClass}">\
<label for="${detailItemId}" class="${colorDetailLabelClass}">${pLabel}</label>\
<input id="${detailItemId}" type="${isNumber ? "number" : "text"}"`
                )
                    .optionalAttr( "min", isNumber ? min : null )
                    .optionalAttr( "max", isNumber ? max : null )
                    .optionalAttr( "step", isNumber ? step : null )
                    .markup( `maxlength="${pMaxLength}" size="5" class="apex-item-text ${colorDetailInputClass}"></div>` );
            };

            const renderNumDetailField = ( pIdSuffix, pLabel, pElemClass, min, max, step = 1 ) => {
                renderDetailField( pIdSuffix, pLabel, 4, true, pElemClass, min, max, step );
            };

            if ( this.displayMode === DISPLAY_MODE_FULL ) {
                displayModeClass = colorPickerPrefixClass + "--full";
            }

            // generate the color picker markup
            // todo binding-provider not needed for inline and ideally not at all
            // Because the value is a class can't set it in markup. See render above.
            out.markup( `<div class="${colorPickerPrefixClass} ${displayModeClass}">\
<div class="${colorPickerPrefixClass}-spectrum"><a-color-spectrum id="${idPrefix}colorSpectrum" show-alpha="${this.showAlpha}" \
     value="${color.toString()}"></a-color-spectrum></div>\
<div class="${colorPickerPrefixClass}-previews">` ); // open preview wrapper

            renderColorPreview( getMessage( "CURRENT" ), colorPreviewCurrentClass, false );
            renderColorPreview( getMessage( "INITIAL" ), colorPreviewInitClass );

            cls = colorDetailClass + " " + C_HIDDEN;
            // close preview wrapper then color details (RBG/HSL/Hex)
            out.markup( `</div><div class="${colorPickerPrefixClass}-details">\
<div class="${cls} ${colorDetailRGBClass}" data-format="${this.showAlpha ? RETURN_AS_RGBA : RETURN_AS_RGB}">` );

            // It seems that RGB[A] is not translated
            renderNumDetailField( "RGB_R", "R", colorDetailItemRClass, "0", "255" );
            renderNumDetailField( "RGB_G", "G", colorDetailItemGClass, "0", "255" );
            renderNumDetailField( "RGB_B", "B", colorDetailItemBClass, "0", "255" );

            if ( this.showAlpha ) {
                renderNumDetailField( "RGB_A", "A", colorDetailItemAClass, "0", "1", "0.01" );
            }

            out.markup( `</div><div class="${cls} ${colorDetailHSLClass}" data-format="${this.showAlpha ? RETURN_AS_HSLA : RETURN_AS_HSL}">` );

            // It seems that HSL[A] is not translated
            renderNumDetailField( "HSL_H", "H", colorDetailItemHClass, "0", "360" );
            renderNumDetailField( "HSL_S", "S", colorDetailItemSClass, "0", "100" );
            renderNumDetailField( "HSL_L", "L", colorDetailItemLClass, "0", "100" );

            if ( this.showAlpha ) {
                renderNumDetailField( "HSL_A", "A", colorDetailItemAClass, "0", "1", "0.01" );
            }

            out.markup( `</div><div class="${cls} ${colorDetailHexClass}" data-format="${RETURN_AS_HEX}">` );

            renderDetailField( "HEX", "Hex", 7, false, colorDetailItemHexClass ); // 7 to allow room for optional leading #

            title = util.escapeHTMLAttr( getMessage( "TOGGLE_TITLE" ) );
            out.markup( `</div><button type="button" title="${title}" aria-label="${title}"\
class="a-Button ${colorDetailToggleClass}"><span aria-hidden="true" class="a-Icon icon-colorpicker-select">\
</span></button></div>` );

            // color contrast
            if ( this.contrastCheck ) {
                out.markup( renderColorContrastReport() );
            }

            // color presets
            if ( this.presetColors ) {
                this.colorPresetsMenuItems = renderColorPresets( out, this.idPrefix, this.presetColors, this.maxPresetColors );
            }

            out.markup( "</div>" );

            return out.toString();
        }
    };

    /**
     * Make a widget like object for a color spectrum picker. This is the content of an inline color picker or
     * a color picker popup.
     *
     * @param options:
     *   idPrefix
     *   presetColors
     *   maxPresetColors extras are put into an overflow menu
     *   popupClass
     *   returnAs
     *   showAlpha
     *   displayMode
     *   contrastCheck
     * callbacks:
     *   getContrast()
     *   valueChanged( newColor )
     *
     * @ignore
     * @returns a color spectrum picker
     */
    function makeColorSpectrumPicker( options ) {
        const instance = Object.create( colorSpectrumPickerPrototype );

        $.extend( instance, options );
        instance.aColorInitial = null;
        instance.aColorCurrent = null;
        return instance;
    }

    const colorUtilities = {
        makeColor: function ( colorValue ) {
            return new aColor( colorValue );
        },
        getValidColor: function ( colorValue ) {
            let color;
            
            if ( !colorValue ) {
                return;
            }

            const colorUpper = colorValue.toUpperCase(),
                  cssVarColor = getCssVariableColor( colorValue );

            // check if it's a named color
            if ( aColor[colorUpper] ) {
                color = aColor[colorUpper];
            } else {
                if ( cssVarColor.length ) {
                    // check if it's a CSS variable
                    colorValue = cssVarColor;
                }
                // check if the value is a valid color
                try {
                    color = new aColor( colorValue );
                } catch ( e ) {
                    color = null;
                }
            }

            return color;
        },
        getSingleColorLuminance: function ( singleColorValue ) {
            let value = singleColorValue / 255;

            return value <= 0.03928 ? value / 12.92 : Math.pow( ( value + 0.055 ) / 1.055, 2.4 );
        },
        getRelativeLuminance: function ( aColor ) {
            const r = aColor.getRed(),
                  g = aColor.getGreen(),
                  b = aColor.getBlue();
            // a = aColor.getAlpha(); // todo determine if alpha can/should be included in the calculation

            return this.getSingleColorLuminance( r ) * 0.2126 + this.getSingleColorLuminance( g ) * 0.7152 + this.getSingleColorLuminance( b ) * 0.0722;
        },
        getColorContrast: function ( colorValue1, colorValue2 ) {
            // if either color is missing
            if ( !colorValue1 || !colorValue2 ) {
                return null;
            }

            const color1 = this.getValidColor( colorValue1 ),
                  color2 = this.getValidColor( colorValue2 );

            // if either color is invalid
            if ( !color1 || !color2 ) {
                return null;
            }
            // calculate the relative luminance
            const color1luminance = this.getRelativeLuminance( color1 ),
                  color2luminance = this.getRelativeLuminance( color2 );

            // calculate the color contrast ratio
            let ratio = color1luminance > color2luminance ? ( color1luminance + 0.05 ) / ( color2luminance + 0.05 ) : ( color2luminance + 0.05 ) / ( color1luminance + 0.05 );

            return {
                color_1: color1.toString(),
                color_2: color2.toString(),
                ratio: ratio,
                aa_large: ratio > 3,
                aa_small: ratio > 4.5,
                aaa_large: ratio > 4.5,
                aaa_small: ratio > 7
            };
        },
        getReturnColorString: function ( returnAs, color ) {
            let colorString;

            if ( !color || !( color instanceof aColor ) ) {
                return "";
            }

            if ( [RETURN_AS_HEX, RETURN_AS_RGB, RETURN_AS_HSL].includes( returnAs ) ) {
                // remove alphs
                color._a = 1;
            }
            switch ( returnAs ) {
            case RETURN_AS_HEX:
                colorString = color.toHexString();
                break;
            case RETURN_AS_RGB:
            case RETURN_AS_RGBA:
                colorString = color.toString();
                break;
            case RETURN_AS_HSL:
            case RETURN_AS_HSLA:
                colorString = color.toHslString();
                break;
            case RETURN_AS_CSS:
                colorString = color.toString(); // just take the default format
            }

            return colorString;
        },
        colorToHSL: function ( aColor ) {
            const colorString = aColor.toHslString(),
                  m = HSLA_FN_RE.exec( colorString ) || []; // the color formatter returns a string like: hsl(h, s%, l%) or hsla(h, s%, l%, a)

            return {
                h: m[1],
                s: m[2],
                l: m[3],
                a: m[4] || "1"
            };
        }
    };

    const colorPickerHelper = {
        getOptions: function ( options ) {
            let opt = $.extend( {}, options );

            opt.contrastCheck = opt.contrastColor ? true : false;
            opt.showAlpha = [RETURN_AS_RGBA, RETURN_AS_HSLA].includes( opt.returnValueAs );

            // Some config validation & optimization
            if ( ![RETURN_AS_HEX, RETURN_AS_RGBA, RETURN_AS_HSLA, RETURN_AS_RGB, RETURN_AS_HSL, RETURN_AS_CSS].includes( opt.returnValueAs ) ) {
                debug.warn( "Color Picker invalid return value as: ", opt.returnValueAs );
                opt.returnValueAs = RETURN_AS_HEX;
            }
            if ( ![DISPLAY_MODE_FULL, DISPLAY_MODE_SIMPLE].includes( opt.displayMode ) ) {
                debug.warn( "Color Picker invalid display mode: ", opt.displayMode );
                opt.displayMode === DISPLAY_MODE_SIMPLE;
            }
            if ( opt.maxPresetColors ) {
                opt.maxPresetColors = parseInt( opt.maxPresetColors, 10 );
                if ( isNaN( opt.maxPresetColors ) ) {
                    opt.maxPresetColors = colorPresetMaxCount;
                }
            } else {
                opt.maxPresetColors = colorPresetMaxCount;
            }

            return opt;
        },
        getItemMarkup: function ( component, options ) {
            const inputId = util.escapeCSS( component.element.attr( "id" ) + "_input" ),
                  inputValue = util.escapeHTMLAttr( component._initValue );

            let html;

            switch ( options.displayAs ) {
            case DISPLAY_AS_POPUP:
                html = `<span class="${itemColorPreviewClass}"></span>
                        <input type="text" id="${inputId}" class="color_picker apex-item-text apex-item-color-picker" value="${inputValue}">
                        <button aria-hidden="true" type="button" class="a-Button a-Button--colorPicker" aria-label="${util.escapeHTMLAttr( getMessage( "OPEN" ) )} "tabindex="-1">
                            <span class="a-Icon icon-color-picker"></span>
                        </button>`;

                break;
            case DISPLAY_AS_COLOR_ONLY:
                html = `<input type="hidden" id="${inputId}" class="color_picker apex-item-color-picker" value="${inputValue}">
                        <button type="button" class="a-Button a-Button--colorPicker a-Button--colorPickerOnly" aria-label="${util.escapeHTMLAttr( getMessage( "OPEN" ) )}">
                            <span class="${itemColorPreviewClass}"></span>
                        </button>`;
                break;
            case DISPLAY_AS_INLINE:
                html = `<input type="hidden" id="${inputId}" class="color_picker apex-item-color-picker" value="${inputValue}">
                        <div class="a-ColorPicker-inlineWrap"></div>`;
                break;
            case DISPLAY_AS_NATIVE:
                html = `<input type="color" id="${inputId}" class="color_picker apex-item-color-picker apex-item-color-picker-native" value="${inputValue}">`;
                break;
            default:
                debug.error( "Color Picker invalid display-as ", options.displayAs );
            }

            return html;
        },
        getElements: function ( component ) {
            let input$ = component.element.find( "input.apex-item-color-picker" ),
                button$ = component.element.find( "button.a-Button--colorPicker" ),
                inline$ = component.element.find( "div.a-ColorPicker-inlineWrap" );

            return { input$: input$, button$: button$, inline$: inline$ };
        },
        addItemBehavior: function ( component, options, renderedElements ) {
            let itemId = util.escapeCSS( component.element.attr( "id" ) ),
                idPrefix = itemId + "_",
                popupOpen = false,
                popupRecentlyOpen = false;

            // Opens the popup/dialog don't call until item is ready
            function _openPopup() {
                popupOpen = true;
                component._dialogId = colorPickerHelper.openPopupColorPicker(
                    component,
                    {
                        idPrefix: idPrefix,
                        presetColors: options.colorsInline ? "" : options.presetColors,
                        maxPresetColors: options.maxPresetColors,
                        popupClass: options.popupClass,
                        returnAs: options.returnValueAs,
                        showAlpha: options.showAlpha,
                        displayMode: options.displayMode,
                        contrastCheck: options.contrastCheck
                    },
                    () => {
                        popupOpen = false;
                    }
                );
            }

            function _initButtonHandlers( button$ ) {
                button$
                    .on( EVENT_CLICK, function () {
                        if ( !popupRecentlyOpen ) {
                            _openPopup();
                        }
                        popupRecentlyOpen = false;
                    } )
                    .mousedown( function () {
                        if ( popupOpen ) {
                            // avoid re-opening the inline popup if the same mousedown that turns into a click closed it
                            popupRecentlyOpen = true;
                        }
                    } );
            }

            // update label "for" attribute to reference correct input and not the web component itself
            colorPickerHelper.updateItemLabelMapping( component );

            switch ( options.displayAs ) {
            case DISPLAY_AS_POPUP: {
                // initialize controls
                // support keyboard to open
                component._wrappedElement$.keydown( function ( event ) {
                    let kc = event.which;

                    if ( kc === keys.DOWN || kc === keys.UP ) {
                        _openPopup();
                        event.preventDefault();
                    } else if ( kc === keys.ENTER ) {
                        // prevent the browser default to submit the page when this is the only text item on the page
                        // todo think enter should still cause a change event if changed
                        event.preventDefault();
                    } // Otherwise the typing keys could be used to enter a value
                } );

                // change handler to keep it in sync with the value
                component._wrappedElement$.on( EVENT_CHANGE, () => {
                    //if the change event is triggered by the setValue, we don't need to do any transformation
                    if ( component._preventChangeHandler ) {
                        component._preventChangeHandler = false;
                        return;
                    }
                    colorPickerHelper.setCheckFormat( component, options, component._wrappedElement$.val() );
                } );

                _initButtonHandlers( renderedElements.button$ );
                renderedElements.button$.on( "focus", function () {
                    // the button is not a separate entity to focus
                    component._wrappedElement$.trigger( "focus" );
                } );

                if ( options.colorsInline && options.presetColors ) {
                    const out = util.htmlBuilder(),
                          colorPresetsMenuItems = renderColorPresets( out, idPrefix, options.presetColors, options.maxPresetColors ),
                          dialog$ =  $( `#${component._dialogId}` );

                    renderedElements.button$.after( out.toString() );
                    component._wrappedElement$.parent().addClass( "a-ColorPicker--hasPresets" );
                    initColorPresets( dialog$, idPrefix, colorPresetsMenuItems, function ( color ) {
                        component.setValue( color );
                    } );
                }
                break;
            }

            case DISPLAY_AS_COLOR_ONLY: {
                _initButtonHandlers( renderedElements.button$ );
                break;
            }

            case DISPLAY_AS_INLINE: {
                const csp = makeColorSpectrumPicker( {
                    element$: renderedElements.inline$,
                    idPrefix: idPrefix,
                    presetColors: options.presetColors,
                    maxPresetColors: options.maxPresetColors,
                    returnAs: options.returnValueAs,
                    showAlpha: options.showAlpha,
                    displayMode: options.displayMode,
                    contrastCheck: options.contrastCheck,
                    ignoreChangeEvent: false,
                    getContrast: function () {
                        return component.contrastWith();
                    },
                    valueChanged: function ( aColor ) {
                        if ( !this.ignoreChangeEvent ) {
                            component.setValue( colorUtilities.getReturnColorString( options.returnValueAs, aColor ), null, true );
                            // like a select list that is closed every user interaction triggers a change event
                            component.element.trigger( EVENT_CHANGE );
                        }
                    }
                } );
                csp.render();
                csp.initialize();
                queueMicrotask( () => {
                    csp.setColor( component.getValue(), true );
                } );

                const baseSetValue = component.setValue;
                component.setValue = function ( value, display, suppress ) {
                    baseSetValue.call( this, value, display, suppress );
                    csp.setColor( component.getValue() );
                };
                component._csp = csp;
                break;
            }
            }
        },
        openPopupColorPicker: function ( component, options, callback ) {
            let csp,
                item$ = component.element,
                initialColorValue,
                initialColor;

            // dialog properties
            const dialogId = options.idPrefix + "ColorPickerDlg";

            function getPreferredReturnFormat( aColor ) {
                let returnFormat = options.returnAs;

                if ( returnFormat === RETURN_AS_CSS ) {
                    returnFormat = csp.getCurrentFormat() || RETURN_AS_HEX;
                }
                return colorUtilities.getReturnColorString( returnFormat, aColor );
            }

            function messageContent() {
                return `<div id="${dialogId}" class='a-ColorPicker-dialog'></div>`;
            }

            let dialog$ = $( "#" + dialogId );

            item$.attr( A_ARIA_EXPANDED, "true" );

            if ( !dialog$[0] ) {
                let cspOptions = $.extend( {}, options, {
                    getContrast: function () {
                        return component.contrastWith();
                    },
                    valueChanged: function ( aColor ) {
                        if ( !this.ignoreChangeEvent ) {
                            component.setValue( getPreferredReturnFormat( aColor ), null, true );
                            component.element.trigger( "transientchange" );
                        }
                    }
                } );

                const dialogOptions = {
                    id: dialogId,
                    title: getMessage( "TITLE" ),
                    isPopup: true,
                    parentElement: item$.parent(),
                    returnFocusTo: item$,
                    noOverlay: true,
                    draggable: true,
                    resizable: false,
                    width: "auto",
                    height: "auto",
                    okButton: false,
                    dialogClass: dialogClass + ( options.popupClass ? " " + options.popupClass : "" ),
                    notification: false,
                    callback: function () {
                        let newColorValue,
                            newColor = csp.getColor();

                        // the popup has closed see if there is any change in the value
                        if ( options.returnAs === RETURN_AS_CSS && newColor.isEqual( initialColor ) ) {
                            // if the color didn't change there is a chance that the initial color was a name or css var
                            // or just in a different format so keep the original value
                            component.setValue( initialColorValue, null, true );
                        } else {
                            newColorValue = getPreferredReturnFormat( newColor );
                            if ( newColorValue !== initialColorValue ) {
                                component.setValue( newColorValue ); // set the value such that a change event is fired
                            }
                        }
                        item$.attr( A_ARIA_EXPANDED, "false" );
                        callback( newColorValue );
                    },
                    init: function ( dialog$ ) {
                        cspOptions.element$ = dialog$;
                        csp = makeColorSpectrumPicker( cspOptions );
                        csp.render();
                        csp.initialize();

                        dialog$.closest( ".ui-dialog" ).on( "keydown", ( event ) => {
                            let kc = event.which;

                            if ( kc === keys.ENTER ) {
                                // if not in a button treat enter as close
                                if ( event.target.nodeName !== "BUTTON" ) {
                                    event.preventDefault();
                                    dialog$.popup( "close" );
                                }
                            }
                        } );
                    },
                    open: function ( /* event */ ) {
                        queueMicrotask( () => {
                            // set the values of the color spectrum, the color preview and the color details
                            initialColorValue = component.getValue();
                            csp.setColor( initialColorValue, true );
                            initialColor = csp.getColor();

                            // the color spectrum is rather small, assume it will fit on even a small screen device.
                            // todo think if big relative to the screen size want to just center
                        } );
                    }
                };

                dialog$ = message.showDialog( messageContent, dialogOptions );
                component._csp = csp;
            } else {
                dialog$.popup( "open" );
            }

            return dialogId;
        },
        setCheckFormat: function ( component, options, value ) {
            let color,
                returnValue,
                input$ = component._wrappedElement$;

            if ( !input$ || input$.length === 0 ) {
                return;
            }

            value = value?.trim() || "";
            returnValue = value;

            component._color = color = colorUtilities.getValidColor( value );
            component._value = color ? colorUtilities.getReturnColorString( options.returnValueAs, color ) : value;

            if ( !colorUtilities || options.displayAs === DISPLAY_AS_NATIVE ) {
                // native doesn't need validating (bad values are changed to the default) and does its own preview
                input$.val( value );
                return;
            }

            if ( options.returnValueAs !== RETURN_AS_CSS && color ) {
                returnValue = colorUtilities.getReturnColorString( options.returnValueAs, color );
            }

            // set color preview
            let itemColorPreview$ = component.element.find( "." + itemColorPreviewClass );
            // if it's a valid color
            if ( color ) {
                itemColorPreview$.removeClass( itemColorNoPreviewClass ).css( BG_COLOR_PROP, color.toString() );
                itemColorPreview$.attr( "aria-label", returnValue );
            } else {
                itemColorPreview$.addClass( itemColorNoPreviewClass ).css( BG_COLOR_PROP, "" );
                itemColorPreview$.removeAttr( "aria-label" );
            }

            input$[0].setCustomValidity( "" ); // clear any existing error and assume no errors

            if ( value === "" ) {
                input$.val( value ); // base item handles required validation message
            } else {
                let message,
                    valid = options.returnValueAs === RETURN_AS_CSS || color !== null; // don't validate when return as css

                input$.val( returnValue );
                if ( !valid ) {
                    message = lang.formatMessage( "APEX.COLOR_PICKER.INVALID_COLOR", colorExamples[options.returnValueAs] );
                    input$[0].setCustomValidity( message );
                }
            }
        },
        removePopup: function ( component ) {
            // when item is removed make sure popup dialog is also removed
            if ( component._dialogId ) {
                $( `#${component._dialogId}` ).popup( "destroy" ).closest( ".ui-dialog--popup" ).remove();
            }
        },
        rerenderItem: function ( component ) {
            component.rendered = false;
            colorPickerHelper.removePopup( component );

            component._initValue = component.getValue();
            component.element.attr( P_VALUE, component._initValue );

            component._render();
            colorPickerHelper.syncOriginalAttributes( component );
            component.rendered = true;
        },
        updateItemLabelMapping: function ( component ) {
            const itemId = component.element.attr( "id" ),
                  inputId = itemId + "_input";

            component.element.closest( `.${itemWrapperClass}` ).find( `label#${itemId}_LABEL` ).attr( "for", inputId );
        },
        getElementAttributes( component, filterAttributes ) {
            let attributes = [];

            const elemAttrMap = component.attributes,
                  filterAttrs = filterAttributes || [];

            if ( !elemAttrMap || elemAttrMap.length === 0 ) {
                return [];
            }

            for ( let i = 0; i < elemAttrMap.length; i++ ) {
                const item = elemAttrMap.item( i );

                if ( filterAttrs && filterAttrs.length > 0 ) {
                    if ( filterAttrs.includes( item.name ) ) {
                        attributes.push( {
                            name: item.name,
                            value: item.value
                        } );
                    }
                } else {
                    attributes.push( {
                        name: item.name,
                        value: item.value
                    } );
                }
            }

            return attributes;
        },
        syncOriginalAttributes: function ( component ) {
            if ( component._originalAttributes && component._originalAttributes.length > 0 ) {
                component._originalAttributes.forEach( ( attribute ) => {
                    if ( attribute.value ) {
                        component._wrappedElement$.attr( attribute.name, attribute.value );
                    } else {
                        component._wrappedElement$.removeAttr( attribute.name );
                    }
                } );
            }
        }
    };

    // don't doc methods that don't apply to colorPickerItem
    /**
     * @ignore
     * @method addValue
     * @memberOf colorPickerItem.prototype
     */
    /**
     * @ignore
     * @method removeValue
     * @memberOf colorPickerItem.prototype
     */
    /**
     * @ignore
     * @method refresh
     * @memberOf colorPickerItem.prototype
     */

    /**
     * <p>Check the contrast of this item color value against the color value</p>
     * @name contrastColor
     * @type {string}
     * @memberof colorpicker.prototype
     * */

    /**
     * <p>Defines the style of how the color picker is rendered. E.g. rendered as a POPUP, INLINE, COLOR_ONLY, NATIVE</p>
     * @name displayAs
     * @type {string}
     * @memberof colorpicker.prototype
     **/

    /**
     * <p>Defines the feature set of the color picker, either FULL or SIMPLE</p>
     * @name displayMode
     * @type {string}
     * @memberof colorpicker.prototype
     **/

    /**
     * <p>{THEME|color-list} A color list is a ; separated list of color values</p>
     * @name presetColors
     * @type {string}
     * @memberof colorpicker.prototype
     **/

    /**
     * <p>"{HEX|RGB|RGBA|HSL|HSLA|CSS}" Default is HEX</p>
     * @name returnValueAs
     * @type {string}
     * @memberof colorpicker.prototype
     **/

    /**
     * <p>Advanced setting: Only applies for display as POPUP and if have colors</p>
     * @name colorsInline
     * @type {boolean}
     * @memberof colorpicker.prototype
     **/

    /**
     * <p>Advanced setting: Default is 5. Only applies if presetColors are defined</p>
     * @name maxPresetColors
     * @type {number}
     * @memberof colorpicker.prototype
     **/

    /**
     * <p>Advanced setting: Optional CSS classes which are added to the popup dialog</p>
     * @name popupClass
     * @type {boolean}
     * @memberof colorpicker.prototype
     **/

    /**
     * @type {ComponentMetaData}
     * @ignore
     * */
    const componentMetaData = {
        contrastColor: {
            type: WebComponent.dataTypes.string,
            reactive: true
        },
        colorsInline: {
            type: WebComponent.dataTypes.boolean,
            defaultValue: false,
            reactive: true
        },
        displayAs: {
            type: WebComponent.dataTypes.enum,
            defaultValue: DISPLAY_AS_POPUP,
            enumValues: [DISPLAY_AS_COLOR_ONLY, DISPLAY_AS_INLINE, DISPLAY_AS_NATIVE, DISPLAY_AS_POPUP],
            reactive: true
        },
        displayMode: {
            type: WebComponent.dataTypes.enum,
            defaultValue: DISPLAY_MODE_SIMPLE,
            enumValues: [DISPLAY_MODE_SIMPLE, DISPLAY_MODE_FULL],
            reactive: true
        },
        maxPresetColors: {
            type: WebComponent.dataTypes.number,
            defaultValue: 5,
            reactive: true
        },
        popupClass: {
            type: WebComponent.dataTypes.string,
            reactive: true
        },
        presetColors: {
            type: WebComponent.dataTypes.string,
            reactive: true
        },
        returnValueAs: {
            type: WebComponent.dataTypes.enum,
            defaultValue: RETURN_AS_HEX,
            enumValues: [RETURN_AS_CSS, RETURN_AS_HEX, RETURN_AS_HSL, RETURN_AS_HSLA, RETURN_AS_RGB, RETURN_AS_RGBA],
            reactive: true
        }
    };

    const delegatedAttributes = ["required", "disabled", "size", "maxlength", "placeholder", "minlength", "tabindex", "name", "aria-labelledby", "aria-describedby"];

    item.ItemComponent._addCommonAttributes( delegatedAttributes, componentMetaData );
    WebComponent._addHyphenCaseAttrNames( componentMetaData );
    const observedAttributes = WebComponent._configObservedAttributes( componentMetaData, delegatedAttributes );

    class Colorpicker extends item.ItemComponent {
        // Properties
        _wrappedElement$;
        _value;
        _color;

        // It's not necessary to define each property used on the inner state, the base component class create them from the
        // metadata, but they were added for autocomplete code purposes
        #v = {
            contrastColor: undefined,
            colorsInline: undefined,
            displayAs: undefined,
            displayMode: undefined,
            maxPresetColors: undefined,
            popupClass: undefined,
            presetColors: undefined,
            returnValueAs: undefined
        };

        constructor() {
            super();
            this._configPrivateState( this.#v );
        }

        _render( attrChanges ) {
            const _self = this;

            if ( !_self.rendered ) {
                const options = colorPickerHelper.getOptions( _self.#v );
                _self._initValue = _self.element.attr( P_VALUE ) || "";

                // create input & Clears the element inside, this removes server placeholder too.
                const html = colorPickerHelper.getItemMarkup( _self, options );

                _self.element.empty().append( html );

                const renderedElements = colorPickerHelper.getElements( _self );
                _self._wrappedElement$ = renderedElements.input$;

                // Finalize input and move certain attributes to wrappedElement
                // but before that, store original attributes, useful when item is re-rendered
                if ( !_self._originalAttributes ) {
                    _self._originalAttributes = colorPickerHelper.getElementAttributes( _self, delegatedAttributes );
                }

                delegatedAttributes.forEach( ( name ) => {
                    _self._moveAttribute( name, _self._wrappedElement$ );
                } );

                // Add item behavior
                colorPickerHelper.addItemBehavior( _self, options, renderedElements );

                // set initial value & trigger actions like updating preview etc.
                colorPickerHelper.setCheckFormat( _self, options, _self._initValue );
            } else if ( attrChanges ) {
                for ( const v of attrChanges ) {
                    // Finalize input and move certain attributes to wrappedElement / input
                    if ( delegatedAttributes.includes( v.attributeName ) ) {
                        _self._moveAttribute( v.attributeName, _self._wrappedElement$ );
                    }

                    // Rerender whole color picker when a defined attribute changes
                    if ( componentMetaData[v.propertyName] && v.attributeName === componentMetaData[v.propertyName].attrName ) {
                        colorPickerHelper.rerenderItem( _self );
                    }
                }
            }
        }

        /*
         * Create item interface
         */
        item_type = "COLOR_PICKER"; // added because of backward compatibility to old JET based color picker

        enable() {
            this.element.prop( P_DISABLED, false );
            this.element.find( "input, button, a-color-spectrum" ).prop( P_DISABLED, false );
            this.element.removeClass( "apex_disabled" );
        }

        disable() {
            this.element.prop( P_DISABLED, true );
            this.element.find( "input, button, a-color-spectrum" ).prop( P_DISABLED, true );
            this.element.addClass( "apex_disabled" );
        }

        isDisabled() {
            return this.element.prop( P_DISABLED );
        }

        show() {
            this.element.closest( `.${itemWrapperClass}` ).show();
        }

        hide() {
            this.element.closest( `.${itemWrapperClass}` ).hide();
        }

        getValue() {
            return this._value;
        }

        setValue( value, display, suppressChangeEvent ) {
            const options = colorPickerHelper.getOptions( this.#v );

            colorPickerHelper.setCheckFormat( this, options, value );

            if ( !suppressChangeEvent ) {
                // used to prevent the attached change event in order to prevent a second call to setCheckFormat
                this._preventChangeHandler = true;
                this.element.trigger( EVENT_CHANGE );
            }
        }

        isChanged() {
            return this.node.value !== this._initValue;
        }

        displayValueFor( colorValue /*, state*/ ) {
            let bgColor,
                colorClass = "",
                colorStyle = "";

            const color = colorUtilities.getValidColor( colorValue );

            if ( color ) {
                bgColor = color.toString();
            }

            if ( bgColor ) {
                colorStyle = BG_COLOR_PROP + ":" + util.escapeHTMLAttr( bgColor ) + ";";
            } else {
                colorClass = " " + itemColorNoPreviewClass;
            }

            return `<div class="apex-item-group apex-item-group--color-picker">
<span class="${itemColorPreviewClass}${colorClass}" style="${colorStyle}"></span>
<span class="apex-item-color-picker-value">${util.escapeHTML( colorValue )}</span></div>`;
        }

        setFocusTo() {
            const options = colorPickerHelper.getOptions( this.#v );

            let focus$ = this._wrappedElement$;

            if ( options.displayAs === DISPLAY_AS_INLINE ) {
                focus$ = focus$.find( "a-color-spectrum" );
            } else if ( options.displayAs === DISPLAY_AS_COLOR_ONLY ) {
                focus$ = this.element.find( ".a-Button--colorPicker" );
            }
            return focus$;
        }

        getPopupSelector() {
            return ".ui-dialog-color-picker";
        }

        getNativeValue() {
            return this._color;
        }

        contrastWith( pColorValue ) {
            const options = colorPickerHelper.getOptions( this.#v );

            if ( !pColorValue ) {
                if ( options.contrastColor ) {
                    pColorValue = options.contrastColor;
                }
            }
            return colorUtilities.getColorContrast( this.getValue(), pColorValue );
        }

        // callback when element is disconnected
        disconnectedCallback() {
            super.disconnectedCallback();

            queueMicrotask( () => {
                if ( !this.isConnected ) {
                    colorPickerHelper.removePopup( this );
                }
            } );
        }

        // Static methods
        static get observedAttributes() {
            return observedAttributes;
        }
        static get componentMetaData() {
            return componentMetaData;
        }
    }

    customElements.define( "a-color-picker", Colorpicker );
} )( apex.item, apex.util, apex.lang, apex.message, apex.debug, apex.jQuery, apex.WebComponent, apex.widget.util );
