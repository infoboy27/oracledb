/*!
 * Copyright (c) 2022, 2023, Oracle and/or its affiliates.
 */

( function( ) {
    "use strict";

    /*
     * Array of Initialization JavaScript Functions.
     * These can be registered via apex.WebComponent._registerInitFunc(...)
     * and are consumed via this._applyInitFunc( options ) in the web component.
     * 
     * These configs must have one of the following forms:
     *
     * {
     *     elementId: "P1_ITEM",
     *     func: options => {
     *         options.foo = "bar";
     *         return options;
     *     }
     * }
     * or
     * {
     *     componentName: "a-rich-text-editor",
     *     func: options => {
     *         options.foo = "bar";
     *         return options;
     *     }
     * }
     */
    const initFuncs = [];

    const dataTypes = {
        number: "number",
        boolean: "boolean",
        enum: "enum",
        string: "string"
    };

    // Using custom function because $.isNumeric is deprecated
    function isNumeric ( value ) {
        if ( ![ "string", "number" ].includes( typeof value )  ) {
            return false;
        } // we only process strings or a number

        return !isNaN( value ) &&
            !isNaN( parseFloat( value ) ); // ensure strings of whitespace fail
    }


    /*
        Base class that configure a web component class and provides utilities and behaviours to make working with web components easier
        Between the improvements we have:
        1- Creating setters and getters with or without built-in validations for supported dataTypes
        2- Synchronise inner property state on the component on attribute or property change, e.g. this.#v.myVariable
        3- Batch attribute/properties changes to call the render function only once with an array of changes
        4- Handle call to render method only when needed e.g. render method won't be called if attribute changes but node disconnected

        Example of use:

        const componentMetaData = {
            peopleToGreet: {
                defaultValue: 12,
                type: apex.WebComponent.dataTypes.number,
                rangeMin: 1,
                reactive: true,
                setterGetter: true,
                sync: true
            },
            message: {
                type: apex.WebComponent.dataTypes.string
            },
            greetingType: {
                type: apex.WebComponent.dataTypes.enum,
                defaultValue: "A",
                enumValues:  [ "A", "B" ]
            }
        };
        // It needs to run before calling _configObservedAttributes.
        apex.WebComponent._addHyphenCaseAttrNames( componentMetaData );

        const observedAttributes = apex.WebComponent._configObservedAttributes( componentMetaData );

        class HelloWorld extends apex.WebComponent {
            #v = {};

            constructor() {
                super();
                this._configPrivateState( this.#v );
            }

            _render( attrChanges ) {
                if ( !this.rendered ) {
                    this.html( "Hello World my message:" + this.#v.message );
                } else if ( attrChanges ){
                    for ( const v of attrChanges ) {
                        if ( v.attributeName === componentMetaData.message.attrName ) {
                            console.log( "Message has changed, new value", this.#v.message );
                            // Do something
                        } else if ( v.attributeName === componentMetaData.peopleToGreet.attrName ) {
                            console.log( "More people to greet" );
                            // Do something
                        }
                    }
                }
            }

            static get observedAttributes() {
                return observedAttributes;
            }

            static get componentMetaData() {
                return componentMetaData;
            }
        }

        // Check if browser supports attachInternals, at the time of this comment from the major browsers only Safari
        // needs this check.
        if ( "attachInternals" in HTMLElement.prototype ) {
            // Custom element native property that indicates if the custom element is associated with its parent form.
            // This configuration is needed on the case that your component doesn't need a hidden input item to keep
            // the element value.
            Combobox.formAssociated = true;
        } else {
            page.registerCustomElementToSubmit( "a-hello-world" );
        }

        customElements.define( 'a-hello-world', HelloWorld );
     */

    /**
     * Description of the function
     * @callback customValidationFn
     * @param {any} value The value to validate
     * @param {boolean} throwError If true, it should throw an error when invalid value, if false function should return
     *   undefined on invalid values.
     */

    /**
     * @typedef {Object} ComponentProperty
     * @property {string} [type] - It defines the property type, depending on the type validations will be supported. The possible
     *  data types are defined on the static dataType class property. Default string.
     * @property {string} [attrName] - Attribute name in hyphen case, DO NOT set it directly, it should be generated by
     *  calling _addHyphenCaseAttrNames from WebComponent class.
     * @property {boolean} [reactive] - If true the method _render will be invoked when the property changes, default false.
     * @property {boolean} [setterGetter] - If true, public setters and getters will be added for the property, default true.
     * @property {boolean} [sync] - If true, changes to the component attribute or property will be synchronised in the inner state , default true.
     * @property {any} [defaultValue] - The defaultValue which will be set to the private state on first render, if sync equal true,
     *  also when the datatype supports validations, if an invalid value is passed or undefined the inner state will be set to the defaultValue.
     * @property {array} [enumValues] - Array containing the possible values an enum property can have, only supported if type = enum and
     *  required too for that property type.
     * @property {number} [rangeMin]  - It defines the minimum boundary, it is inclusive.
     * @property {number} [rangeMax]  - It defines the maximum boundary, it is exclusive.
     * @property {customValidationFn} [validationFn] - A function that will be executed to validate the property value, it should take two arguments
     *  and handle throws an error when value invalid. Only supported when type equal to string.
     */

    /**
     * @typedef {Object.<string, ComponentProperty>} ComponentMetaData
     */

    class WebComponent extends HTMLElement {
        // The concept of protected properties doesn't exist on JS, so to emulate a private property that is only accessible
        // in the class and all its descendants, the private property has to be declared twice, once in the parent and another in the
        // child class, that allows to have true private properties and not leak our private state to the public.
        #v;
        // End of "protected" property;
        #attrChangesQueue = [];
        #delayedAttributeChanges = [];

        // Start of Life cycle methods
        constructor( ) {
            super();

            this.rendered = false;
        }

        // connect component
        connectedCallback() {
            if ( this.isConnected ) {
                let delayedAttrChanges;

                if ( this.#delayedAttributeChanges.length ) {
                    // On the first rendering it doesn't provide value to send the delayedAttrChanges as changed attributes
                    // to the render method because the component hasn't even been rendered, and those values are already synced
                    // on the inner state and available as attributes.
                    if ( this.rendered ) {
                        delayedAttrChanges = this.#delayedAttributeChanges;
                    }
                    this.#delayedAttributeChanges = [];
                }

                // It was decided to call the _render method asynchronously by waiting for the whole document to be loaded
                // using DOMContentLoaded, therefore we can provide support to themes loading the scripts before the content
                // e.g. the APEX builder. If method _render is called synchronously on the case that the custom component
                // has already been defined, it won't have access to the children elements,because only the opening tag for
                // the custom component has been parsed on that moment. This is an active problem for custom html components w
                // without a native solution to it, see discussion for more context https://github.com/WICG/webcomponents/issues/809
                // TODO think about using mutation observers to track when each component has fully parsed its inner HTML, to avoid
                // delaying the _render method call until the document is ready.
                if ( document.readyState !== "loading" ) {
                    // After the page is loaded all the _render calls will be synchronous.
                    this._render( delayedAttrChanges );
                    this.rendered = true;
                } else {
                    // This is executed barely before applyBindings on binding.js, not a race condition due to $( function )
                    // implementation using setTimeout, but if binding.js is changed to use DOMContentLoaded, this has to change too.
                    window.addEventListener( "DOMContentLoaded", () => {
                        this._render( delayedAttrChanges );
                        this.rendered = true;
                    } );
                }
            }
        }

        disconnectedCallback() {
            // Queue Micro Task is needed to prevent error when item is moved in DOM e.g. in IG
            queueMicrotask( () => {
                if ( !this.isConnected ) {
                    this._cleanup();
                }
            } );
        }

        attributeChangedCallback( attribute, oldValue, newValue ) {
            const constructor = this.constructor,
                propertyName = constructor.hyphenToCamelCase ( attribute ),
                propertyMetaData = constructor.componentMetaData[ propertyName ];

            if ( propertyMetaData ) {
                const dataType = propertyMetaData.type,
                    defaultValue = propertyMetaData.defaultValue;
                let validValue;

                if ( oldValue === newValue ) {
                    return;
                }

                if ( propertyMetaData.sync !== false ) {
                    if (dataType) {
                        switch (dataType) {
                            case dataTypes.number:
                                validValue = constructor.validNumberAttr(
                                    newValue, propertyMetaData.rangeMin, propertyMetaData.rangeMax, false
                                );
                                break;
                            case dataTypes.enum:
                                validValue = constructor.validEnumAttr(
                                    newValue, propertyMetaData.enumValues, false
                                );
                                break;
                            case dataTypes.boolean:
                                validValue = constructor.validBooleanAttr(
                                    newValue, attribute, false
                                );
                                break;
                            default:
                                if ( propertyMetaData.validationFn ) {
                                    validValue = propertyMetaData.validationFn(
                                        newValue, false
                                    );
                                } else {
                                    validValue = newValue;
                                }
                        }

                        // TODO think about what happens about an attribute with a default value, but it can also be set to
                        // undefined, maybe having two separated possible properties for the Invalid Status and Undefined Status,
                        // for the moment the defaultValue is used for both.
                        if ( validValue === undefined ) {
                            validValue = defaultValue;
                        }
                        this.#v[ propertyName ] = validValue;
                    }
                }

                // If attributes added while component not connected to the main tree, or before the first rendering,
                // the calling to the render method will be delayed until the first call to life cycle connectedCallback
                if ( this.isConnected && this.rendered ) {
                    if ( propertyMetaData.reactive ) {
                        this.requestRender( attribute, oldValue, newValue, propertyName );
                    }
                } else {
                    this.#delayedAttributeChanges.push( { attributeName: attribute, oldValue: oldValue, newValue: newValue, propertyName: propertyName } );
                }

            }
        }
        // End of Life cycle methods

        // Abstract method.
        // It will be called when an observed property change and when component connected, the changes will be batch so method will be
        // called once.
        _render( ) {
        }

        // Abstract method.
        // It will be called when the element is removed from the DOM, developer should add here any cleaning task needed,
        // to completely remove an instance of that component e.g. Removing the popup instance from the datepicker.
        // The method won't be called on the moment the element is removed from the DOM, but until the execution stack from where
        // the element was removed is finished, then with a microtask it will check if the component is still disconnect to
        // call the method, this is to avoid a false-positive removal  when the component was only being moved around like the IG
        // does with the columns.
        _cleanup( ) {
        }

        requestRender( attribute, oldValue, newValue, propertyName ) {
            if ( attribute !== undefined ) {
                let attributeChanged = this.#attrChangesQueue.filter( ( v ) => v.attributeName === attribute );

                // If the same attribute is changed twice on the same rendering batch, only the last change will be added to the batch,
                // we could add both, but I don't see so much value on it.
                if ( attributeChanged.length ) {
                    attributeChanged[0].newValue = newValue;
                } else {
                    this.#attrChangesQueue.push( { attributeName: attribute, oldValue: oldValue, newValue: newValue, propertyName: propertyName } );
                }
            }

            if ( this.#attrChangesQueue.length === 1 ) {
                queueMicrotask(() => {
                    this._render( this.#attrChangesQueue );

                    // Empties the changes queue, and points to new array to avoid mutations
                    this.#attrChangesQueue = [];
                } );
            }
        }

        /**
         *  It uses the componentMetaData to configure the setters and getters and set the defaults for the private state
         *
         * @param {object} privateStateObjRef An object point to private instance property which will be used to store the private state
         * @ignore
         */
        _configPrivateState( privateStateObjRef ) {
            const constructor = this.constructor;

            this.#v = privateStateObjRef;
            for ( const [ key, property ] of Object.entries( constructor.componentMetaData ) ) {
                // If no data type provided, string type will be used.
                property.type = property.type ? property.type.toLowerCase() : dataTypes.string;

                let propertyType = property.type,
                    attributeName = property.attrName,
                    defaultValue = property.defaultValue;

                if ( property.sync !== false && privateStateObjRef ) {
                    this.#v[ key ] = defaultValue;
                }

                if ( property.setterGetter !== false ) {// Creates getters and setters with validation logic depending on the data type
                    let getFunction, setFunction;
                    switch ( propertyType ) {
                        case dataTypes.number:
                            getFunction = () => {
                                const attributeValue = this.getAttribute( attributeName );
                                let validValue = constructor.validNumberAttr(
                                        attributeValue, property.rangeMin, property.rangeMax, false
                                    );

                                if ( validValue === undefined ) {
                                    validValue = defaultValue;
                                }

                                return validValue;
                            };
                            setFunction =  ( value ) => {
                                // If not error raised the value is valid and the attribute is set.
                                constructor.validNumberAttr(
                                    value, property.rangeMin, property.rangeMax, true
                                );

                                this.setAttribute( attributeName, value );
                            };

                            break;
                        case dataTypes.enum:
                            getFunction = () => {
                                const attributeValue = this.getAttribute( attributeName );
                                let validValue = constructor.validEnumAttr(
                                    attributeValue, property.enumValues, false
                                );

                                if ( validValue === undefined ) {
                                    validValue = defaultValue;
                                }

                                return validValue;
                            };
                            setFunction = ( value ) => {
                                // If not error raised the value is valid and the attribute is set.
                                constructor.validEnumAttr(
                                    value, property.enumValues, true
                                );

                                this.setAttribute( attributeName, value );
                            };

                            break;
                        case dataTypes.boolean:
                            getFunction = () => {
                                const attributeValue = this.getAttribute( attributeName );
                                let validValue = constructor.validBooleanAttr(
                                    attributeValue, attributeName, false
                                );

                                if ( validValue === undefined ) {
                                    validValue = defaultValue;
                                }

                                return validValue;
                            };
                            setFunction = ( value ) => {
                                // Boolean property behaves a bit different from the attribute, e.g. an empty string value
                                // will set the attribute, but it will make the property remove the attribute, so we
                                // don't call the general validBooleanAttr function to validate the entry.
                                if (value === true) {
                                    this.setAttribute( attributeName, "" );
                                } else if ( value === "true" || value === attributeName || value === "false" || value === false ) {
                                    this.setAttribute( attributeName, value );
                                } else if (value === "" || value === null || value === undefined) {
                                    this.removeAttribute( attributeName );
                                } else {
                                    throw new Error( "Invalid value" );
                                }
                            };
                            break;
                        default:
                            getFunction = () => {
                                const attributeValue = this.getAttribute( attributeName ),
                                    validationFn = property.validationFn;
                                let validValue = attributeValue;

                                if ( validationFn ) {
                                    validValue = validationFn( attributeValue, false );
                                }

                                if ( validValue == null ) {
                                    validValue = defaultValue;
                                }

                                return validValue;
                            };
                            setFunction = ( value ) => {
                                const validationFn = property.validationFn;

                                if ( validationFn ) {
                                    // If not error raised the value is valid and the attribute is set.
                                    validationFn( value, true );
                                }


                                this.setAttribute( attributeName, value );
                            };
                    }

                    if ( getFunction || setFunction ) {
                        Object.defineProperty( this, key, {
                            enumerable: true,
                            configurable: true,
                            get: getFunction,
                            set: setFunction
                        } );
                    }
                }


            }
        }

        /**
         *  INTERNAL. DO NOT USE
         * 
         *  Applies the functions registered via registerInitFunc
         * 
         *  If multiple functions match, they will be applied in the order of creation.
         *
         * @param {object} options The options object to be passed to the Initialization JavaScript Functions
         * @returns {object} The options object after possibly having been altered
         * @ignore
         */
        _applyInitFunc( options ) {
            const elementId = this.id,
                componentName = this.tagName.toLowerCase();
            
            initFuncs.forEach( initFunc => {
                if( elementId === initFunc.elementId || componentName === initFunc.componentName ) {
                    options = initFunc.func( options );
                }
            } );

            return options;
        }

        // Start of Static Properties
        static dataTypes = dataTypes;
        // End of Static Properties

        // More information about how to handle validations for attributes https://html.spec.whatwg.org/multipage/common-microsyntaxes.html#boolean-attribute
        // At the moment only enum, boolean, number are implemented.
        // Boolean: It deviates from the specs and allow the string "false", "true", to avoid the developer not being able to
        //  overwrite a boolean attribute which default value is true on first rendering when the attribute won't exist on the markup
        // Number: The specs only talk about non-negative number, but to give more flexibility a range property can be added to the metadata,
        //  which the standard class will enforce, if not valid value provided an error is triggered.

        // Start of Static Methods
        static validNumberAttr ( value, min, max, throwError ) {
            const numericValue = Number( value );
            let convertedValue;

            if ( isNumeric( value ) ) {
                if ( ( min === undefined  || numericValue >= min )
                    && ( max === undefined  || numericValue <= max )  ) {
                    convertedValue = numericValue;
                } else if ( throwError ) {
                    throw new Error( "Out of range number: " + value );
                }
            } else if ( throwError ) {
                throw new Error( "Invalid value for number attribute: " + value );
            }

            return convertedValue;
        }
        static validEnumAttr ( value, enumValues, throwError ) {
            let lowerValue = value ? value.toString().toLowerCase() : "",
                lowerEnumValues = enumValues.map( e => e.toLowerCase() ),
                convertedValue;

            if ( lowerEnumValues.includes( lowerValue ) ) {
                convertedValue = value;
            } else if ( throwError ) {
                // The valid values could include a "," which could make the list of valid values non-readable,
                // due to the that symbol being used on the array join, but I consider it a low chance.
                throw new Error( `Invalid value for enum attribute, valid values: ${enumValues.join( ", " )}` );
            }

            return convertedValue;
        }
        static validBooleanAttr ( value, attributeName, throwError ) {
            let convertedValue;

            if ( value === true || value === "true" || value === attributeName || value === "" ) {
                convertedValue = true;
            } else if ( value === false || value === "false" || value === null || value === undefined ) {
                convertedValue = false;
            } else if ( throwError ) {
                throw new Error( "Invalid value" );
            }

            return convertedValue;
        }
        // TODO add date validation, should this be a fixed format mask? Date may include time which should be
        // included on the validation.
        static validDateAttr ( ) {
        }

        static camelCaseToHyphen ( camelCased  ) {
            return camelCased.split( /(?=[A-Z])/ ).join( "-" ).toLowerCase();
        }

        static hyphenToCamelCase  ( hyphenated  ) {
            return hyphenated.replace( /-([a-z])/gi, g => g[1].toUpperCase() );
        }

        /**
         *  It extracts from the component metadata the observed attributes
         *
         * @param {ComponentMetaData} componentMetaData An object storing the metadata used to configure the component
         * @param {array} [observedAttributes] An array of attribute names which will be observed, if provided,
         *  the method will return an array including the observed attributes extracted from the metadata and this parameter.
         * @returns {array}
         * @ignore
         */
        static _configObservedAttributes( componentMetaData, observedAttributes = [] ) {
            const lObservedAttributes = [ ...observedAttributes ];

            for ( const [ , property ] of Object.entries( componentMetaData ) ) {
                let attributeName = property.attrName;

                if ( !attributeName ) {
                    throw new Error( "attrName value is undefined in property" );
                }

                if ( !lObservedAttributes.includes( attributeName ) ) {
                    lObservedAttributes.push( attributeName );
                }
            }

            return lObservedAttributes;
        }

        /**
         *  It adds the html attribute name to the componentMetaData object, the attribute name is based on the
         *  componentMetaData property name, which should be written in camel case and then transform it to hyphen case.
         *
         * @param {ComponentMetaData} componentMetaData An object storing the metadata used to configure the component
         * @ignore
         */
        static _addHyphenCaseAttrNames( componentMetaData ) {
            for ( const [ key, property ] of Object.entries( componentMetaData ) ) {
                property.attrName = this.camelCaseToHyphen( key );
            }
        }

        /**
         *  Consider this an abstract method, classes extending this class should have this method and return the component
         *  metadata that this class will use to configure the component private state
         *
         * @returns {ComponentMetaData}
         * @ignore
         */
        static get componentMetaData() {
            return {};
        }

        /**
         *  INTERNAL. DO NOT USE
         * 
         *  Registers an Initialization JavaScript Function for a specific element by passing an ID,
         *  or for each instance of a web component, by passing the component tag name.
         * 
         *  Multiple functions can be registered for the same elementId or componentName.
         * 
         * @param {Object} options An object that contains the following properties:
         * @param {string} [options.elementId] The element id, such as "P1_RTE"
         * @param {string} [options.componentName] The component name, such as "a-rich-text-editor"
         * @param {function} options.func The callback function
         * @ignore
         */
        static _registerInitFunc( options ) {
            // sanity checks
            if( ( !options.elementId && !options.componentName ) || ( options.elementId && options.componentName ) ) {
                throw new Error( "Either id or componentName must be provided, and not both." );
            } else if( !options.func || typeof options.func !== "function" ) {
                throw new Error( "A function must be provided." );
            }

            initFuncs.push( options );
        }
        // End of Static Methods
    }

    apex.WebComponent = WebComponent;
})( );