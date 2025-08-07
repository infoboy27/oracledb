/*!
 Copyright (c) 2022, 2023, Oracle and/or its affiliates.
 */
/*
todo:
  immediate binding for item value changes
  *2 way binding, validity
  *on ok for 2 way binding
  model data ref work

  consider if there is a need for syntax to reference a model/record/field.
  consider the case where render an input in each cell of a grid/table backed by a model Each input would map to a specific record.
    but if the grid is the cursor then it already knows what the current record is
  Currently &FIELD. but the model and record are supplied out of band.
  model id is example: myModel or ["MyDetailModel", "000109"]
  /model/["name","inst"]/recid/column
  model:
  item:NAME
  model cursors

 binding of expressions other than templates.
 use syntax [type]text with default type being apex apply template
 example: [sql]:P1_NUM1 > :P1_NUM2
 another shortcut would be leading =
 example: =P1_SELECT%display

Region
Title: Employee <span title="P1_NAME">&P1_NAME.</span>

 */
/**
 * @namespace apex.binding
 * @since 23.1
 * @desc
 * <p>The apex.binding namespace contains global functions related to Oracle APEX dynamic data binding.
 * Data binding is the automatic updating of some aspect of the UI when one or more data values change.
 * UI updates pertain to a specific HTML element. A binding consists of 4 things:
 * <ul>
 * <li>An HTML element to update</li>
 * <li>The type of UI update to make to the element</li>
 * <li>An array of one or more data references {@link apex.binding.DataReference}</li>
 * <li>A function or expression that produces a string value based on the data
 * references that is used to update the element</li>
 * </ul>
 * The types of UI updates are:</p>
 * <ul>
 *     <li>Element text content {@link apex.binding.TextBindingType}</li>
 *     <li>Element html content {@link apex.binding.HtmlBindingType}</li>
 *     <li>An element attribute value {@link apex.binding.AttributeBindingType}</li>
 *     <li>Element visibility {@link apex.binding.VisibleBindingType}</li>
 *     <li>APEX item value {@link apex.binding.ItemValueBindingType} (supports two-way binding)</li>
 * </ul>
 * <p>Data binding works within the architectural pattern of model-view separation. Data is stored in the model
 * layer and the view layer is the UI presentation of the model layer. In APEX the model layer consists of
 * page items ({@link item}) and APEX models ({@link model}). Items (except for Hidden item) are a special case
 * because they are both UI layer and model layer. An item holds a single value or an array of values.
 * A model holds a record, array of records, or a tree structure of records (in a tree the records are know
 * as nodes). A record consists of a set of fields also know as columns.
 * A data reference is to a single item or field in a model record.</p>
 *
 * <p>Data binding is generally one directional. When the data values in the model layer change the UI layer changes
 * according to the bindings. Two-way binding is a special case that only applies when the UI element is one that
 * accepts user input. In APEX this means an item and binding uses the item value binding type. When the user enters
 * or changes a value the model is updated and when the model changes the item value is updated.</p>
 *
 * <p>Data binding offers an alternative to JavaScript event handling or dynamic actions that listen for data changes
 * and do DOM manipulation in response. Event handling is procedural; when X happens do Y, whereas data binding is more
 * declarative; it specifies how the UI is related to data without procedural details of how the relationship
 * is established and maintained. The APEX dynamic data binding facility takes care of automatically updating
 * the UI when the data changes.</p>
 *
 * <p>Data binding can be expressed in HTML markup using the following HTML attributes:</p>
 * <ul>
 *     <li>ab-text="<em>expression</em>"</li>
 *     <li>ab-html="<em>expression</em>"</li>
 *     <li>ab-<em>attribute</em>="<em>expression</em>"</li>
 *     <li>ab-visible="<em>expression</em>"</li>
 *     <li>ab-item-value="<em>expression</em>"</li>
 * </ul>
 * <p>In the above list <em>attribute</em> is the name of an element attribute and <em>expression</em> is an
 * APEX template as described by {@link apex.util.applyTemplate}. If the expression starts with an equal sign "=" then
 * it is a single data reference following the <code class="prettyprint">item-name</code> and
 * <code class="prettyprint">quoted-item-name</code> syntax of rules for <code class="prettyprint">applyTemplate</code>
 * data substitutions but without the leading ampersand (&) and trailing dot (.).</p>
 *
 * <p>APEX provides many places where developers can enter their own HTML markup. This includes Static Content regions,
 * Dynamic Content regions, HTML Expressions such as in report columns, templates, and template components. Binding should
 * only be done to markup that the developer provides or that is documented by APEX. Binding to markup that is generated
 * by the APEX engine, APEX or 3rd party components or theme templates runs the risk of breaking if the markup
 * changes.</p>
 * <p>It is also possible to use the APIs in this namespace such as {@link apex.binding.bind} to create
 * data bindings. todo when to use each</p>
 * <p>todo when bindings are applied and reapplied</p>
 * <p>todo where to describe the model cursor</p>
 *
 * @example <caption>The following example will set the text of the span element to
 * the value of the template expression when the page loads and anytime the
 * page items P1_LAST_NAME or P1_FIRST_NAME change.</caption>
 * <span ab-text="Employee &P1_LAST_NAME., &P1_FIRST_NAME."></span>
 *
 * @example <caption>When there is just one data reference you can use an
 * assignment expression. In the following example, the span content is set to the display value
 * of select list item P1_SHIPPING_METHOD. Note the leading = and there
 * is no leading "&" or trailing ".".</caption>
 * <p id="summary">
 *  Shipping method: <span ab-text="=P1_SHIPPING_METHOD%display"></span>
 *  ...
 * </p>
 * @example <caption>The following example hides a report region until the user chooses a select list value.
 * There is a select list P1_DEPTNO with LOV on the DEPT table and with a null value option.
 * There is a classic report on the EMP table that has where clause:<br>
 * <code class="prettyprint">:P3_DEPTNO = deptno</code> <br>
 * The report region is hidden until the user selects a department.
 * The following attribute is added to the report region Advanced: Custom Attributes attribute.
 * In this situation it also makes sense for the report to be lazy loaded. The display:none style is added
 * so that the region doesn't show during the brief moment before bindings are applied.</caption>
 * ab-visible="=P3_DEPTNO" style="display:none;"
 */
apex.binding = ( function( $, util, debug, apexItem ) {
    "use strict";

    const BINDING_KEY = "apexBinding",
        ATTR_PREFIX = "ab-",
        ATTR_PREFIX_LEN = ATTR_PREFIX.length;

    const objectValues = Object.values,
        objectEntries = Object.entries;

    const ESC_MODE_NONE = "none",
        ESC_MODE_HTML = "html",
        ESC_MODE_ATTR = "attr";

    //
    // Data Reference Observer types
    //
    const gDataRefTypes = new Map(), // map data ref type name to data ref type implementation
        gDataRefTypeList = [],
        gItemObservers = new Map(); // map item name to observer object that tracks subscriber notification callbacks

    const DATA_REF_ITEM = "item";

    let gNextWatchIdIndex = 1;

    /**
     * <p>Defines a data reference type.
     * Add an object that handles a specific type of data reference.</p>
     *
     * @ignore
     * @param {string} name
     * @param {object} refTypeImpl
     * @param {number} refTypeImpl.priority Used to order data ref types. A data ref name is checked with each
     *    dataRefType, using parse to see if there is a name of that type, in order. The first one to return
     *    a value determines the type of the data ref name.
     * @param {function} refTypeImpl.subscribe function( ref, callback )
     * @param {function} refTypeImpl.unsubscribe function( ref, callback )
     * @param {function} refTypeImpl.getValue function( ref )
     * @param {function} refTypeImpl.setValue function( ref, value ) only used for 2 way binding
     * @param {function} refTypeImpl.parse function( name, element ) Determine if a data ref name of this type
     *    exists. If a name of this type exists return a DataReference object. Otherwise return nothing.
     */
    function addDataRefType( name, refTypeImpl ) {
        if ( gDataRefTypes.has( name ) ) {
            throw new Error( "Redefined data reference type: " + name );
        }
        refTypeImpl._name = name;
        gDataRefTypes.set( name, refTypeImpl );
        gDataRefTypeList.push( refTypeImpl );
        gDataRefTypeList.sort( ( a, b ) => a.priority - b.priority );
    }

    /**
     * @typedef {object} apex.binding.DataReference
     * @abstract
     * @desc
     * <p>Abstract data reference. See derived types {@link apex.binding.ItemDataReference}
     * and {@link apex.binding.ModelDataReference}.</p>
     *
     * @property {string} type The type of the data reference
     */

    /**
     * @typedef {object} apex.binding.ItemDataReference
     * @augments apex.binding.DataReference
     * @desc
     * <p>An APEX item data reference.</p>
     *
     * @property {string} type The data reference type is "item".
     * @property {string} name The name of the item.
     * @example <caption>The following object is a data reference to a page item named
     * <code class="prettyprint">P1_PRODUCT_NAME</code></caption>
     * {
     *     type: "item",
     *     name: "P1_PRODUCT_NAME"
     * }
     */
    // todo may need a prop property for %prop references
    // todo immediate flag
    addDataRefType( DATA_REF_ITEM, {
        // It is no coincidence that ModelDataReference (in model.js) has a lower priority such that when looking
        // for data, models are checked first and then items are checked second. See dataRefFromName.
        // This is the same priority order used by applyTemplate. The order must be kept in sync.
        priority: 20,
        subscribe: function( ref, callback ) {
            const itemName = ref.name,
                item = apexItem( itemName );

            if ( !item.node ) {
                debug.error( "No such item: ", itemName );
                return; // item must exist
            }
            let observer = gItemObservers.get( itemName );

            if ( !observer ) {
                observer = {
                    subscribers: [],
                    lastValue: item.getValue(), // get initial value, use to detect actual changes
                    watchId: "bindWatch" + gNextWatchIdIndex
                };
                gNextWatchIdIndex += 1;
                // only need one change event handler no matter how many subscribers
                $( item.node ).on( "change." + observer.watchId, function() {
                    let item = apexItem( itemName ),
                        itemValue = item.getValue();

                    if ( !util.equalValue( itemValue, observer.lastValue ) ) {
                        observer.lastValue = itemValue;
                        observer.subscribers.forEach( cb => { cb(); } ); // todo think does the callback want to know what data ref changed?
                    }
                } );
                // todo special case for immediate change listen on input event or maybe keyup in some cases
                gItemObservers.set( itemName, observer );
            }
            observer.subscribers.push( callback );
        },
        unsubscribe: function( ref, callback ) {
            const itemName = ref.name,
                observer = gItemObservers.get( itemName );

            if ( observer ) {
                const item = apexItem( itemName );
                let index = observer.subscribers.findIndex( x => x === callback );

                if ( index >= 0 ) {
                    observer.subscribers.splice( index, 1 );
                    // if unsubscribing last one remove the observer
                    if ( observer.subscribers.length === 0 ) {
                        $( item.node ).off( "change." + observer.watchId );
                        // todo special case for any other event listeners
                        gItemObservers.delete( itemName );
                    }
                }
            }
        },
        getValue: function( ref ) {
            return apexItem( ref.name ).getValue();
        },
        setValue: function( ref, value, displayValue /*, validity, validityMessage */ ) {
            // todo xxx validity, validityMessage
            apexItem( ref.name ).setValue( value, displayValue );
        },
        parse: function( name /*, element */ ) {
            if ( apexItem.isItem( name ) ) {
                return {
                    type: DATA_REF_ITEM,
                    name: name
                };
            }
        }
    } );

    function makeErrorUnknownDataRef( type ) {
        return new Error( "Unknown data reference type: " + type );
    }

    function makeErrorUnknownBinding( uiType ) {
        return new Error( "Unknown UI binding type: " + uiType );
    }

    /**
     * <p>When the value of the data reference ref changes the callback function is called.</p>
     *
     * @ignore
     * @param {apex.binding.DataReference} pDataRef The data reference to watch.
     * @param {function} pCallback The no argument function to call when the data value changes.
     */
    function watch( pDataRef, pCallback ) {
        const type = pDataRef.type;

        if ( !gDataRefTypes.has( type ) ) {
            throw makeErrorUnknownDataRef( type );
        }
        gDataRefTypes.get( type ).subscribe( pDataRef, pCallback );
    }

    /**
     * <p>Stop watching the data reference ref.</p>
     *
     * @ignore
     * @param {apex.binding.DataReference} pDataRef
     * @param {function} pCallback
     */
    function unwatch( pDataRef, pCallback ) {
        const type = pDataRef.type;

        if ( !gDataRefTypes.has( type ) ) {
            throw makeErrorUnknownDataRef( type );
        }
        gDataRefTypes.get( type ).unsubscribe( pDataRef, pCallback );
    }

    // given a data ref name return the DataReference object.
    // The element may be used to provide extra context.
    function dataRefFromName( name, element ) {
        let ref = null;

        // ask the data ref implementations in order; return first found
        for ( const dataRefType of gDataRefTypeList ) {
            ref = dataRefType.parse( name, element );
            if ( ref ) {
                break;
            }
        }
        return ref;
    }

    /*
    similar to watchCondition todo can watchCondition be rewritten to use watch? Trouble is this module comes after util.
    lots of checkCondition unit tests but none for watchCondition. Only consumer is facets?
    observer.subscribe(name, fn())
    observer.unsubscribe(name, fn())
    name is data ref
    data ref
    type = item, item name: listen on change event
    type = model, model id, optional record id or cursor, field name: listen for setValue on specific id or cursor change (and value changed?)
    */

    //
    // Binding types
    //
    const gBindingTypes = new Map();

    /**
     * <p>Defines a UI binding type.
     * Add an object that handles a specific type of UI binding.</p>
     *
     * @ignore
     * @param {string} name
     * @param {object} bindingTypeImpl
     * @param {function} bindingTypeImpl.validate function( ui )
     * @param {function} bindingTypeImpl.key function( ui )
     * @param {function} bindingTypeImpl.apply function( ui, value )
     * @param {function} [bindingTypeImpl.onChange] function( ui, callback ) Only for 2 way bindings
     */
    function addBindingType( name, bindingTypeImpl ) {
        if ( gBindingTypes.has( name ) ) {
            throw new Error( "Redefined binding type: " + name );
        }
        gBindingTypes.set( name, bindingTypeImpl );
    }

    function checkElement( element ) {
        if ( !element || !( element instanceof HTMLElement ) ) {
            throw new Error( "Invalid binding; missing element" );
        }
    }

    // intentionally exclude
    //   async, defer, nomodule - binding should not be used on scripts
    //   autofocus, autoplay - apply as page loads before binding happens
    //
    const booleanAttributes = new Set( [
        "allowfullscreen",  "async", "checked", "controls", "default",
        "disabled", "formnovalidate", "inert", "ismap", "itemscope", "loop",
        "multiple", "muted", "novalidate", "open",
        "playsinline", "readonly", "required", "reversed", "selected" ] ),
        booleanValues = ["T", "t", "Y", "y", "1", "F", "f", "N", "n", "0"],
        falseBooleanValues = booleanValues.slice( 5 );
    // todo add a namespace function to define boolean attributes for web components

    /**
     * @typedef {object} apex.binding.BindingType
     * @abstract
     * @desc
     * <p>Abstract UI binding type.
     * See derived types {@link apex.binding.AttributeBindingType}
     * and {@link apex.binding.HtmlBindingType}, {@link apex.binding.TextBindingType},
     * {@link apex.binding.VisibleBindingType}.</p>
     *
     * @property {string} type The type of the UI binding.
     */
    /**
     * @typedef {object} apex.binding.AttributeBindingType
     * @augments apex.binding.BindingType
     * @desc
     * <p>A binding that sets the value of an element attribute.
     * The value of the attribute is set to the bound value.
     * </p>
     * <p>The escape mode passed to the {@link apex.binding.bind} <code class="prettyprint">pValueFn</code>
     * function is "attr". The same is available to the code that processes the
     * expression of {@link apex.binding.bindExpression}.</p>
     *
     * @property {string} type The UI binding type is "attribute".
     * @property {HTMLElement} element The element to bind to.
     * @property {string} attribute The element attribute name to bind to.
     * @example <caption>The following object is a binding that sets the
     * <code class="prettyprint">title</code> attribute of element with id
     * "sectionHeading". Note the use of <code class="prettyprint">.eq(0)</code>
     * to access the HTMLElement because the element property does not accept
     * a jQuery object.</caption>
     * {
     *     type: "attribute",
     *     element: $( "#sectionHeading" ).eq( 0 ),
     *     attribute: "title"
     * }
     */
    addBindingType( "attribute", {
        validate: function( ui ) {
            checkElement( ui.element );
            if ( !ui.attribute || typeof ui.attribute !== "string" || ui.attribute.length === 0 ) {
                throw new Error( "Invalid binding; missing attribute" );
            }
        },
        key: function( ui ) {
            return ui.type + ":" + ui.attribute;
        },
        escapeMode: ESC_MODE_NONE, // because jQuery attr handles escaping
        apply: function( ui, value ) {
            const el$ = $( ui.element );

            if ( booleanAttributes.has( ui.attribute ) && booleanValues.includes( value ) ) {
                // turn the value into a boolean. if false then remove the attribute otherwise set to "true"
                if ( falseBooleanValues.includes( value ) ) {
                    el$.removeAttr( ui.attribute );
                } else {
                    el$.attr( ui.attribute, "" );
                }
            } else {
                el$.attr( ui.attribute, value );
            }
        }
    } );

    /**
     * @typedef {object} apex.binding.TextBindingType
     * @augments apex.binding.BindingType
     * @desc
     * <p>A binding that sets the text content of an element.
     * The text content of the element is replaced with the bound value.
     * </p>
     * <p>The escape mode passed to the {@link apex.binding.bind} <code class="prettyprint">pValueFn</code>
     * function is "none". The same is available to the code that processes the
     * expression of {@link apex.binding.bindExpression}.</p>
     *
     * @property {string} type The UI binding type is "text".
     * @property {HTMLElement} element The element to bind to.
     * @example <caption>The following object is a binding that sets the
     * text content of element with id "sectionHeading". Note the use of <code class="prettyprint">.eq(0)</code>
     * to access the HTMLElement because the element property does not accept a jQuery object.</caption>
     * {
     *     type: "text",
     *     element: $( "#sectionHeading" ).eq( 0 )
     * }
     */
    addBindingType( "text", {
        validate: function( ui ) {
            checkElement( ui.element );
        },
        key: function( ui ) {
            return ui.type;
        },
        escapeMode: ESC_MODE_NONE,
        apply: function( ui, value ) {
            $( ui.element ).text( value );
        }
    } );

    /**
     * @typedef {object} apex.binding.HtmlBindingType
     * @augments apex.binding.BindingType
     * @desc
     * <p>A binding that sets the html content of an element.
     * The html content of the element is replaced with the bound value.
     * </p>
     * <p>The escape mode passed to the {@link apex.binding.bind} <code class="prettyprint">pValueFn</code>
     * function is "html". The same is available to the code that processes the
     * expression of {@link apex.binding.bindExpression}.</p>
     *
     * @property {string} type The UI binding type is "html".
     * @property {HTMLElement} element The element to bind to.
     * @example <caption>The following object is a binding that sets the
     * HTML content of element with id "sectionBody". Note the use of <code class="prettyprint">.eq(0)</code>
     * to access the HTMLElement because the element property does not accept a jQuery object.</caption>
     * {
     *     type: "html",
     *     element: $( "#sectionBody" ).eq( 0 )
     * }
     */
    addBindingType( "html", {
        validate: function( ui ) {
            checkElement( ui.element );
        },
        key: function( ui ) {
            return ui.type;
        },
        escapeMode: ESC_MODE_HTML,
        apply: function( ui, value ) {
            const element = ui.element;
            let focusedId,
                focused = document.activeElement;

            // if focus was in the element that is going to be replaced remember the focused element id so it can be restored
            if ( $( focused ).closest( element ).length ) {
                focusedId = focused.id;
                // todo maybe don't rely on focusable having an id? Try id first, then index among focusables
            }
            $( element ).html( value );
            if ( focusedId ) {
                $( "#" + focusedId ).focus();
            }
            // todo if had focus fall back to focus the first focusable below element
        }
    } );

    /**
     * @typedef {object} apex.binding.VisibleBindingType
     * @augments apex.binding.BindingType
     * @desc
     * <p>A binding that shows or hides an element. The element is hidden using CSS property display:none;.
     * There is a special case for items. If the element is an item it is made visible or hidden with the
     * item {@link item.show} or {@link item.hide} methods.</p>
     *
     * <p>The element is hidden if the bound value is empty string or any of the following single
     * characters in upper or lower case: F, N, H, 0. The element is shown for any other values.</p>
     * <p>The escape mode passed to the {@link apex.binding.bind} <code class="prettyprint">pValueFn</code>
     * function is "none". The same is available to the code that processes the
     * expression of {@link apex.binding.bindExpression}.</p>
     *
     * @property {string} type The UI binding type is "visible".
     * @property {HTMLElement} element The element to bind to.
     * @example <caption>The following object is a binding that controls the visibility of element with
     * id "orders". Note the use of <code class="prettyprint">.eq(0)</code>
     * to access the HTMLElement because the element property does not accept a jQuery object.</caption>
     * {
     *     type: "visible",
     *     element: $( "#orders" ).eq( 0 )
     * }
     */
    addBindingType( "visible", {
        validate: function( ui ) {
            checkElement( ui.element );
        },
        key: function( ui ) {
            return ui.type;
        },
        escapeMode: ESC_MODE_NONE,
        apply: function( ui, value ) {
            const element = ui.element,
                el$ = $( element );
            let containedFocus = false,
                focused = document.activeElement,
                show = true;

            // if focus was in the element that is going to be replaced remember the focused element id so it can be restored
            if ( $( focused ).closest( element ).length ) {
                containedFocus = true;
            }

            // turn the value into a boolean
            if ( value === false || value === "" || ["F", "f", "N", "n", "H", "h", "0"].includes( value ) ) {
                show = false;
            }

            // if focus is on something that is about to be hidden move to previous tab stop
            if ( containedFocus && !show ) {
                let allTabs$ = $( ":tabbable" ),
                    index = allTabs$.index( element );

                allTabs$.eq( index - 1 ).trigger( "focus" );
            }

            // show or hide
            // special case if element is an item
            if ( element.id && apexItem.isItem( element.id ) ) {
                let item = apexItem( element.id );

                if ( show ) {
                    item.show();
                } else {
                    item.hide();
                }
            } else {
                el$.toggle( show );
            }
        }
    } );

    // todo there should probably be a hidden binding type as well

    let gIgnoreItemValueChange = false;

    /**
     * @typedef {object} apex.binding.ItemValueBindingType
     * @augments apex.binding.BindingType
     * @desc
     * A binding that sets the value of an item. Supports 2-way binding xxx
     * xxx example:
     * <a-number-field ... value="..." ab-item-value="=P1_HIDDEN_DATA"></a-number-field>
     * <a-number-field ... value="..." ab-item-value="=SAL"></a-number-field>
     *
     * <p>The escape mode passed to the {@link apex.binding.bind} <code class="prettyprint">pValueFn</code>
     * function is "none". The same is available to the code that processes the
     * expression of {@link apex.binding.bindExpression}.</p>
     *
     * @property {string} type The UI binding type is "item-value".
     * @property {HTMLElement} element The element to bind to.
     * @property {string} itemName The item name (id) of the item to bind to. todo isn't this the same as element.id???
     * @property {HTMLElement} [storeElement] An optional element that triggers an "apexbindstore" event xxx
     * @example <caption>todo</caption>
     * {
     *     type: "item-value",
     *     element: apex.item("P1_NAME").node
     *     itemName: "P1_NAME
     * }
     */
    // todo if/where to document the apexbindstore event?
    addBindingType( "item-value", {
        validate: function( ui ) {
            const itemName = ui.itemName;

            checkElement( ui.element );
            if ( !itemName || !apexItem.isItem( itemName ) ) {
                throw new Error( "Invalid binding; missing itemName" );
            }
        },
        key: function( ui ) {
            return ui.type;
        },
        escapeMode: ESC_MODE_NONE,
        apply: function( ui, value ) {
            gIgnoreItemValueChange = true;
            apexItem( ui.itemName ).setValue( value );
            gIgnoreItemValueChange = false;
        },
        onChange: function( ui, callback ) {
            let listenOn, eventName,
                item = apexItem( ui.itemName );


            if ( ui.storeElement ) {
                listenOn = $( ui.storeElement );
                eventName = "apexbindstore.uiBinding";
            } else {
                listenOn = item.element;
                eventName = "change.uiBinding";
            }

            if ( !callback ) {
                listenOn.off( eventName );
                return;
            } // else

            listenOn.on( eventName, function() {
                if ( !gIgnoreItemValueChange ) {
                    let item = apexItem( ui.itemName ),
                        value = item.getValue(),
                        validity = item.getValidity();

                    callback( value, item.displayValueFor( value ), validity, validity.valid ? "" : item.getValidationMessage() );
                }
            } );
        }
    } );

    // hook into jQuery to clean up the bindings when elements are removed
    // this is similar to what jQuery UI does to destroy widgets
    $.cleanData = ( function( orig ) {
        return function( elems ) {
            let elem;

            for ( let i = 0; ( elem = elems[ i ] ) != null; i++ ) {
                if ( $.data( elem, BINDING_KEY ) ) {
                    unbindAll( elem );
                }
            }
            orig( elems );
        };
    } )( $.cleanData );

    //
    // Expression processors
    //
    const gExpressionTypes = new Map();
    let gDefaultExpressionType = null,
        gShortcutExpressionTypes = [];

    // todo think about bindings like visibility/show/hide that want a boolean value. Will want more logic than a template
    //  this is related to checkCondition and would like a syntax for that, ideally SQL

    function updateOptions( options, dataRefs ) {
        for ( const ref of dataRefs ) {
            if ( ref.type === "model" ) {
                if ( ref.cursor ) {
                    // xxx what if the options already had a model that was different?
                    options.model = ref.cursor.getModel();
                    options.record = ref.cursor.getCurrentRecord();
                } else {
                    // todo add model to template processor options when not using a cursor");
                    // xxx this will be tricky because need to ref release the model after processing but only if
                    // added it.
                }
                // currently template processing only uses one model
                break;
            }
        }
    }

    /**
     * <p>Defines an expression processor type.
     * Add an object that can handle expressions passed to bindExpression.</p>
     *
     * @ignore
     * @param {string} name
     * @param {object} processor
     * @param {boolean} processor.default
     * @param {function} processor.extractNames function( {string} expression, {object} options ) -> string[]
     * @param {function} processor.process function( escapeMode, dataRefs, expression, options ) -> string
     */
    function addExpressionProcessor( name, processor ) {
        if ( gExpressionTypes.has( name ) ) {
            throw new Error( "Redefined expression processor: " + name );
        }
        gExpressionTypes.set( name, processor );
        if ( processor.default ) {
            gDefaultExpressionType = processor;
        } else if ( processor.prefix ) {
            gShortcutExpressionTypes.push( processor );
            // order by string length, the longest first
            gShortcutExpressionTypes.sort( ( a, b ) => b.prefix.length - a.prefix.length );
        }
    }

    /*
     * This expression processor is the default and handles APEX templates with apex.util.applyTemplate
     * Example expression: "Hi &P1_NAME."
     */
    addExpressionProcessor( "template", {
        default: true,
        extractNames: function( expression, options ) {
            let depends = util.extractTemplateDependencies( expression, options );

            return depends.map( x => x.name );
        },
        process: function( escapeMode, refs, expression, options ) {
            options.defaultEscapeFilter = escapeMode === ESC_MODE_NONE ? false : escapeMode.toUpperCase();

            updateOptions( options, refs ); // xxx copy options?
            return util.applyTemplate( expression, options );
        }
    } );

    /*
     * This expression processor handles a single data reference
     * Example expression: P1_NAME%label
     */
    addExpressionProcessor( "assign", {
        prefix: "=",
        extractNames: function( expression ) {
            return [expression.replace( /%.*$/, "" )]; // remove property reference if any
        },
        process: function( escapeMode, refs, expression, options ) {
            let value;

            updateOptions( options, refs ); // xxx copy options?
            value = util.dataValue( expression, options ); // xxx consider this should include escape format as well

            if ( escapeMode === ESC_MODE_HTML ) {
                value = util.escapeHTML( value );
            } else if ( escapeMode === ESC_MODE_ATTR ) {
                value = util.escapeHTMLAttr( value );
            }
            return value;
        }
    } );

    //
    // Data binding functions
    //

    // debug tracing utility
    const gTraceElements = new Set(),
        gTraceTypes = new Set();
    let gTraceOn = false;

    function tracing( element, type ) {
        if ( gTraceOn ) {
            if ( gTraceElements.size > 0 && !gTraceElements.has( element ) ) {
                return false;
            }
            if ( gTraceTypes.size > 0 && !gTraceTypes.has( type ) ) {
                return false;
            }
            return true;
        }
        return false;
    }

    // for logging this creates identifying text for an element including the name, id, and classes
    function elementToIdString( element ) {
        let text = element.nodeName.toLowerCase();

        if ( element.id ) {
            text += "#" + element.id;
        }
        if ( element.classList.length > 0 ) {
            text += "." + element.classList.value.replaceAll( " ", "." );
        }
        return text;
    }

    /**
     * <p>Establish a data binding. When any of the data references listed in <code class="prettyprint">dataRefs</code>
     * changes the function <code class="prettyprint">pValueFn</code> is called and the return value is applied to the
     * UI binding specified by <code class="prettyprint">pUiBinding</code>. Bindings created with this function
     * can be unbound with {@link apex.binding.unbind}.</p>
     *
     * <p>Supports two-way binding when there is exactly one data reference and the binding type supports two-way
     * binding. todo the pValueFn is ignored in this case</p>
     *
     * @memberOf apex.binding
     * @function
     * @param {apex.binding.BindingType} pUiBinding The type of UI binding.
     * @param {apex.binding.DataReference[]} pDataRefs An array of data references.
     * @param {function} [pValueFn] Function that computes a new value for the UI binding.
     *    Function signature: pValueFn({boolean} escapeMode, {apex.binding.DataReference[]}dataRefs):{string}
     * @example <caption>The following example makes item P1_TEXT_VALUE visible when the value of
     * select list item P1_SELECT_SCOPE is one of "A", "B", or "C" and hides it otherwise.</caption>
     * apex.binding.bind( {
     *         type: "visible",
     *         element: apex.item( "P1_TEXT_VALUE" )
     *     }, {
     *         type: "item",
     *         name: "P1_SELECT_SCOPE"
     *     }, function( escapeMode, dataRefs ) {
     *         return ["A", "B", "C"].includes( $v( dataRefs[0] ) ) ? "T" : "F" );
     *     } );
     */
    function bind( pUiBinding, pDataRefs, pValueFn ) {
        const uiType = pUiBinding.type;

        // check if ui specifies something we can bind to
        if ( !gBindingTypes.has( uiType ) ) {
            throw makeErrorUnknownBinding( uiType );
        }
        if ( pDataRefs.length === 0 ) {
            debug.error( "binding with no data refs", pUiBinding ); // xxx throw or log?
        }
        const bindingType = gBindingTypes.get( uiType );

        bindingType.validate( pUiBinding ); // this throws if ui object is no good
        const key = bindingType.key( pUiBinding );

        // Check for and establish 2 way binding
        // Two way binding is a special case that requires ui binding type supports onChange,
        // and there is exactly one dataRef and fn is not specified
        if ( pDataRefs.length === 1 && bindingType.onChange /* xxx && fn === undefined */ ) { // xxx maybe just ignore fn?
            let dataRef = pDataRefs[0],
                type = dataRef.type;

            if ( !gDataRefTypes.has( type ) ) {
                throw makeErrorUnknownDataRef( type );
            }
            // xxxx how can we know that the model layer should not be updated until explicitly asked for
            bindingType.onChange( pUiBinding, ( value, displayValue, validity, message ) => {
                let refType = gDataRefTypes.get( type );

                if ( tracing( pUiBinding.element, key ) ) {
                    // xxx maybe want to know what changed
                    debug.log( "Write back value: ", key, elementToIdString( pUiBinding.element ), value );
                }
                refType.setValue( dataRef, value, displayValue, validity, message );
            } );

            pValueFn = function() {
                let refType = gDataRefTypes.get( type );

                // todo xxx should the UI reflect validity, disabled state kept in the model layer and if so how
                return refType.getValue( dataRef );
            };
        }

        // todo for immediate binding need to know what event to listen on input or keyup or??? Make item observable? this belongs in the item data ref
        //     see tmvbase _setModelValue need way to break cycle.
        // todo think binding an item value to a model field is special:
        //  where is display value from if field doesn't have a columnItem defined? The source binding? Validity? DUP?, identity change?
        let ready = 0;
        const listener = () => {
            if ( ready <= 0 ) {
                ready = 1;
                queueMicrotask( () => {
                    let value = pValueFn( bindingType.escapeMode, pDataRefs );

                    if ( tracing( pUiBinding.element, key ) ) {
                        // xxx maybe want to know what changed
                        debug.log( "Apply binding value: ", key, elementToIdString( pUiBinding.element ), value );
                    }
                    bindingType.apply( pUiBinding, value );
                    ready = 0;
                } );
            }
        };
        const binding = {
            dataRefs: pDataRefs,
            listener: listener
        };
        const el$ = $( pUiBinding.element );

        // Bindings are kept in jQuery element data.
        // If target element goes away, want to clean up the data observers.
        // jquery data is only cleaned up on jQuery remove not on direct DOM remove.
        // To get notified need to hook into cleanData like JQUI. See cleanData above.
        let prevBinding,
            bindings = el$.data( BINDING_KEY );

        if ( !bindings ) {
            bindings = {};
            el$.data( BINDING_KEY, bindings );
        }
        prevBinding = bindings[key];
        if ( prevBinding ) {
            unbind( pUiBinding );
        }
        bindings[key] = binding;

        // for each data the function depends on watch that data for changes
        for ( const ref of pDataRefs ) {
            watch( ref, listener );
        }

        // update the UI right away
        bindingType.apply( pUiBinding, pValueFn( bindingType.escapeMode, pDataRefs ) );
    }

    /**
     * <p>Remove a data binding that was created with {@link apex.binding.bind} or
     * {@link apex.binding.bindExpression}.</p>
     *
     * @memberOf apex.binding
     * @function
     * @param {apex.binding.BindingType} pUiBinding The type of UI binding.
     * @example <caption>The following will unbind the binding created in the
     * example for the {@link apex.binding.bind} function.</caption>
     * apex.binding.unbind( {
     *         type: "visible",
     *         element: apex.item( "P1_TEXT_VALUE" )
     *     } );
     */
    function unbind( pUiBinding ) {
        const uiType = pUiBinding.type;

        if ( !gBindingTypes.has( uiType ) ) {
            throw makeErrorUnknownBinding( uiType );
        }

        if ( !pUiBinding.element || !( pUiBinding.element instanceof HTMLElement ) ) {
            return; // nothing to unbind
        }
        const el$ = $( pUiBinding.element ),
            bindingType = gBindingTypes.get( uiType ),
            key = bindingType.key( pUiBinding );
        let binding,
            bindings = el$.data( BINDING_KEY );

        if ( !bindings ) {
            return; // no bindings to unbind
        }
        binding = bindings[key];

        if ( binding ) {
            if ( bindingType.onChange ) {
                bindingType.onChange( pUiBinding, null ); // unbind change
            }

            // for each data unsubscribe from observer passing in the data ref
            for ( const ref of binding.dataRefs ) {
                unwatch( ref, binding.listener );
            }
            // remove binding
            delete bindings[key];
        }
    }

    /**
     * <p>Remove all data bindings for the given element.</p>
     * <p>When elements are removed from the DOM with jQuery methods such as <code class="prettyprint">remove</code>
     * the bindings are automatically unbound.</p>
     *
     * @memberOf apex.binding
     * @function
     * @param {HTMLElement} pElement The element to remove all bindings from.
     * @example <caption>The following example removes all bindings for element with id "resultsArea".
     * The [0] after the jQuery function accesses the element from the jQuery object. This is equivalent
     * to the .eq(0) method.</caption>
     * apex.binding.unbindAll( $( "#resultsArea" )[0] );
     */
    function unbindAll( pElement ) {
        const el$ = $( pElement ),
            bindings = el$.data( BINDING_KEY );

        if ( bindings ) {
            for ( const binding of objectValues( bindings ) ) {
                for ( const ref of binding.dataRefs ) {
                    unwatch( ref, binding.listener );
                }
            }
        }
    }

    /*
     * todo future consider if there is a need to pass in extraDataRefs in case they can't be determined from
     *  the expression or is there a case where want the binding to be reapplied?
     */
    /**
     * <p>Establish a data binding as given by pUiBinding. Data references are determined from the expression and
     * when any of the referenced data values changes the expression is evaluated and the result is
     * applied to the UI binding. Bindings created with this function
     * can be unbound with {@link apex.binding.unbind}.</p>
     *
     * @memberOf apex.binding
     * @function
     * @param {apex.binding.BindingType} pUiBinding The type of UI binding.
     * @param {string} pExpression An expression string supported by the APEX binding facility. This is an
     *   APEX template as described by {@link apex.util.applyTemplate}. If the expression starts with an equal
     *   sign "=" then it is a single data reference following the <code class="prettyprint">item-name</code>
     *   and <code class="prettyprint">quoted-item-name</code> syntax of rules for
     *   <code class="prettyprint">applyTemplate</code> data substitutions but without the leading ampersand
     *   (&) and trailing dot (.).
     * @param {object} [options] todo where could this come from when applied with applyBindings?
     * @example <caption>todo</caption>
     */
    function bindExpression( pUiBinding, pExpression, options = {} ) {
        let refNames,
            dataRefs = [],
            processor = gDefaultExpressionType; // default expression handler

        // xxx maybe copy options? maybe shouldn't pass in options?

        // find expression handler from expression
        if ( pExpression.startsWith( "[" ) ) {
            let type,
                index = pExpression.indexOf( "]" );

            if ( index ) {
                type = pExpression.substring( 1, index );
                if ( gExpressionTypes.has( type ) ) {
                    processor = gExpressionTypes.get( type );
                    pExpression = pExpression.substring( index + 1 );
                }
            }
        } else {
            for ( const p of gShortcutExpressionTypes ) {
                if ( pExpression.startsWith( p.prefix ) ) {
                    processor = p;
                    pExpression = pExpression.substring( p.prefix.length );
                    break;
                }
            }
        }
        // extract dependencies from template as an array of data ref names
        refNames = processor.extractNames( pExpression, options );
        for ( const name of refNames ) {
            let ref =  dataRefFromName( name, pUiBinding.element );

            if ( ref ) {
                dataRefs.push( ref );
            }
        }

        bind( pUiBinding, dataRefs, ( escapeMode, refs ) => {
            return processor.process( escapeMode, refs, pExpression, options );
        } );
    }

    /**
     * <p>Applies declarative data bindings for the DOM subtree rooted at pRootElement.</p>
     * todo when done automatically
     *
     * @memberOf apex.binding
     * @param {HTMLElement} pRootElement todo
     */
    function applyBindings( pRootElement ) {
        let elements = pRootElement.querySelectorAll( "*" );

        for ( const element of elements ) {
            for ( const attrName of element.getAttributeNames() ) {
                if ( attrName.startsWith( ATTR_PREFIX ) ) {
                    let attr,
                        value = element.getAttribute( attrName ),
                        type = attrName.substring( ATTR_PREFIX_LEN ); // remove prefix

                    if ( !gBindingTypes.has( type ) ) {
                        // must be attribute type
                        attr = type;
                        type = "attribute";
                    }

                    let ui = {
                        element: element,
                        type: type
                    };
                    if ( attr ) {
                        ui.attribute = attr;
                    }
                    if ( type === "item-value" ) {
                        // Special case for item-value use element id to get the item name
                        ui.itemName = element.id;
                    }
                    // special case for 2 way binding
                    let bindingType = gBindingTypes.get( type );

                    if ( bindingType.onChange ) {
                        // special knowledge of model cursors todo think how to generalize
                        let mc$ = $( element ).closest( "[data-bind-cursor],a-model-cursor" ),
                            cursor = mc$.attr( "data-bind-cursor" );

                        if ( cursor ) {
                            cursor = $( "#" + cursor )[0];
                        } else {
                            cursor = mc$[0];
                        }
                        if ( cursor && cursor.explicitStore === true ) {
                            ui.storeElement = cursor;
                        }
                    }
                    bindExpression( ui, value );
                }
            }
        }
    }

    // On page load apply bindings. Need to wait for items to finish initializing
    apex.gPageContext$.on( "apexreadyend", () => {
        // Need to wait for model cursors to be created
        // todo consider if there is some way to adjust the order/timing so bindings can be applied sooner
        //  consider queueMicroTask
        setTimeout( () => {
            applyBindings( document.body );
        }, 0 );
    } );

    //
    // Functions to help with debugging bindings.
    // todo consider what else might be needed
    //

    /**
     * <p>Returns a list of bindings. This function is only used to aid debugging.</p>
     *
     * @memberOf apex.binding
     * @returns {object[]} Returns an array of objects. Each object has properties element, type, and dataRefs.
     */
    function list() {
        let list = [];

        $( ":data(apexBinding)" ).each( function() {
            const el = this,
                bindings = $( this ).data( "apexBinding" );

            for ( const [n, v] of objectEntries( bindings ) ) {
                list.push( {
                    element: el,
                    type: n,
                    dataRefs: v.dataRefs // xxx maybe copy
                } );
            }
        } );
        return list;
    }

    /**
     * <p>Turn on console logging for the given elements or bindings types.
     * This function is only used to aid debugging. See {@link apex.binding.traceOff}.</p>
     * <p>Console logging is done with {@link apex.debug.log}. If the debug logging level
     * is 0 (OFF) it is set to {@link apex.debug.LOG_LEVEL.ERROR}.</p>
     *
     * @memberOf apex.binding
     * @param {HTMLElement[]} pElements todo
     * @param {string[]} pTypes todo
     * @example <caption>todo</caption>
     */
    function traceOn( pElements = [], pTypes = [] ) {
        gTraceOn = true;
        gTraceElements.clear();
        gTraceTypes.clear();
        pElements.forEach( x => {
            gTraceElements.add( x );
        } );
        pTypes.forEach( x => {
            gTraceTypes.add( x );
        } );
        // make sure the logging can be seen
        if ( debug.getLevel() === 0 ) {
            debug.setLevel( debug.LOG_LEVEL.ERROR ); // error level is fine since we use log to tracing.
        }
    }

    /**
     * <p>Turn off all binding console logging.
     * This function is only used to aid debugging. See {@link apex.binding.traceOn}.</p>
     * @memberOf apex.binding
     * @example <caption>todo</caption>
     */
    function traceOff() {
        gTraceOn = false;
        gTraceElements.clear();
        gTraceTypes.clear();
    }

    //
    // Functions to help with debugging bindings.
    //

    return {
        watch: watch,
        unwatch: unwatch,

        bindExpression: bindExpression,

        bind: bind,
        unbind: unbind,

        applyBindings: applyBindings,

        // for debugging
        list: list,
        traceOn: traceOn,
        traceOff: traceOff,

        // internal use
        addDataRefType: addDataRefType,
        addBindingType: addBindingType,
        addExpressionProcessor: addExpressionProcessor
    };

} )( apex.jQuery, apex.util, apex.debug, apex.item );