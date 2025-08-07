/*!
 * Copyright (c) 2013, 2024, Oracle and/or its affiliates.
 */

/**
 * Page Designer Component Gallery
 * This module is part of the page designer and contains the controller logic for the component library.
 */

/* global pe */

window.componentGallery = {};

(function( gallery, model, $, util, lang ) {
    "use strict";

    // keep in sync with componentTypeClassMap in gridlayout widget code
    const T_REGION = "region",
        T_ITEM = "item",
        T_BUTTON = "button";

    const PREF_SHOW_LEGACY = "GAL_SHOW_LEGACY",
        PREF_CUR_TAB = "GAL_CUR_TAB";

    var gShowLegacy = false, // option to show legacy components or not

        // map from a component type to the gComponents collection property name that holds components of that type
        gTypeToCollectionMap = { region: "regions", item: "items", button: "buttons" },

        // Metadata about all the components in the gallery
        // Each item in the arrays is an object with these properties
        //     type: ""  // match what the gridlayout uses. See componentTypeClassMap in gridlayout widget code.
        //     iconClass: "" // a css class that specifies the icon for the component
        //     title: "" // the title or label text to display
        //     tooltip: "" // tooltip content. can include markup
        //     isSupported: boolean
        //     values: [ { id: "", value: "" }, ... ] // component values to set when created
        gComponents = {
            regions: [ ],
            items: [ ],
            buttons: [ ]
        },

        gTypeToClassMap = {
            "region": "a-Gallery-region",
            "item": "a-Gallery-pageItem",
            "button": "a-Gallery-button"
        };


    const hasOwnProperty = util.hasOwnProperty;

    function getComponentData( key ) {
        var data,
            parts = key.split(":" ),
            collection = gComponents[gTypeToCollectionMap[parts[0]]];

        if ( collection ) {
            data = collection[parts[1]];
        }
        if ( !data ) {
            throw new Error( "Invalid component data key" );
        }
        return data;
    }

    //
    // external interface
    //
    gallery.getComponentData = getComponentData;

    function renderLibComponent( out, index, item ) {
        var className,
            isPageReadOnly = model.isPageReadOnly();

        className = gTypeToClassMap[item.type];
        if ( !isPageReadOnly ) {
            className += " is-draggable";
        }
        out.markup( "<li" )
            .attr( "class", className )
            .optionalAttr( "aria-grabbed", isPageReadOnly ? null : "false" )
            .attr( "data-component", item.type + ":" + index )
            .markup( "><span class='a-Icon " ).attr( item.iconClass ).markup( "'></span><span class='a-Gallery-componentName'>" ).content( item.title )
            .markup( "</span></li>" );
    }

    function tooltipContent( title, description ) {
        var out = util.htmlBuilder();

        description = description || "";

        if ( !/^\s</.test(description) ) {
            description = "<p>" + description + "</p>";
        }
        out.markup( "<span class='tt-title'>" )
            .content( title )
            .markup( "</span>" )
            .markup( description );

        return out.toString();
    }

    function initRegions() {
        const plugins = model.getComponentType( model.COMP_TYPE.REGION ).pluginType.plugins;

        for ( let regionType in plugins ) {
            if ( hasOwnProperty( plugins, regionType ) ) {
                const plugin = plugins[regionType];
                let values = [ { id: model.PROP.REGION_TYPE, value: regionType } ];

                // Deprecated regions and the "Data Upload Column Mapping" region don't belong in the gallery
                if ( plugin.isDeprecated || plugin.name === "NATIVE_DATA_UPLOAD_COLUMN_MAPPING" ) {
                    continue;
                }

                // When a component is created without any template specified the model figures out and assigns the
                // default template. However grid layout prefers to know the template as the drop/add happens so that it
                // has the display points already configured. So figure out the default template here.
                const template = model.getTheme().defaultTemplates[ regionType === "NATIVE_IR" ? "ir" : "region" ];
                if ( plugin.features.includes( "REGION_TEMPLATE" ) ) {
                    values.push( { id: model.PROP.REGION_TEMPLATE, value: template } );
                }

                // Template Components can be rendered as report, partial or region-only, check which one is available.
                // The gallery preferably shows the region as a report
                let templateComponentType;
                if ( regionType.startsWith( "TMPL" ) ) {
                    templateComponentType = plugin.templateTypes.includes( "REPORT" ) ? "REPORT" :
                                            plugin.templateTypes.includes( "PARTIAL" ) ?  "PARTIAL" :
                                            "REGION_ONLY";
                }

                const region = {
                    type: T_REGION,
                    iconClass: window.pageDesigner.getComponentIconClass( T_REGION, regionType, templateComponentType ),
                    title: plugin.title,
                    isSupported: true,
                    isLegacy: plugin.isLegacy,
                    tooltip: tooltipContent( plugin.title, plugin.helpText ),
                    values
                };
                gComponents.regions.push( region );
            }
        }
    }

    function initItems() {
        var key, plugin, item, supported,
            plugins = model.getComponentType( model.COMP_TYPE.PAGE_ITEM ).pluginType.plugins;

        for ( key in plugins ) {
            if ( hasOwnProperty( plugins, key ) ) {
                plugin = plugins[key];

                // Deprecated items don't belong in the gallery
                if ( plugin.isDeprecated ) {
                    continue;
                }

                supported = (  !plugin.componentTypes
                               || $.inArray( model.COMP_TYPE.PAGE_ITEM, plugin.componentTypes ) !== -1
                               );

                item = {
                    type: T_ITEM,
                    iconClass: window.pageDesigner.getComponentIconClass( T_ITEM, key ),
                    title: supported ? plugin.title : lang.formatMessage( "PD.UNSUPPORTED", plugin.title ),
                    isSupported: supported,
                    isLegacy: plugin.isLegacy,
                    tooltip: tooltipContent( plugin.title, plugin.helpText ),
                    values: [
                        { id: model.PROP.ITEM_TYPE, value: key }
                    ]
                };
                gComponents.items.push( item );
            }
        }
    }

    function initButtons() {
        var key, buttonTemplate, button,
            buttonTemplates = model.getButtonTemplates();

        function addButton( name, template, hot ) {

            button = {
                type: T_BUTTON,
                iconClass: window.pageDesigner.getComponentIconClass( T_BUTTON, hot === "Y" ? "hot" : "normal" ),
                title: name,
                isSupported: true,
                isLegacy: false,
                tooltip: tooltipContent( name, "" ), // button templates don't have a description
                values: [
                    { id: model.PROP.BUTTON_TEMPLATE, value: template },
                    { id: model.PROP.BUTTON_IS_HOT, value: hot }
                ]
            };
            gComponents.buttons.push( button );
        }

        for ( key in buttonTemplates ) {
            if ( hasOwnProperty( buttonTemplates, key ) ) {
                buttonTemplate = buttonTemplates[ key ];

                addButton( buttonTemplate.name, key, "N" );
                if ( buttonTemplate.hasHotTemplate ) {
                    addButton( lang.formatMessage( "PD.GAL.HOT_BTN", buttonTemplate.name ), key, "Y" );
                }
            }
        }
    }

    function initComponentGallery( ) {

        // initialize component gallery items from the model
        initRegions();
        initItems();
        initButtons();

        // sort on title
        ["regions", "items", "buttons"].forEach( function( value ) {
            gComponents[ value ].sort(function(a, b) {
                return a.title.localeCompare( b.title );
            });
        } );

        updateComponentGallery();
    }

    function updateComponentGallery() {
        var glv$ = $( "#glv" ),
            isPageReadOnly = model.isPageReadOnly(),
            out = util.htmlBuilder();

        ["regions", "items", "buttons"].forEach( function( value ) {
            var i, item,
                components = gComponents[ value ],
                list$ = $( "#cg-" + value + " ul" ).first();

            out.clear();
            for ( i = 0; i < components.length; i++ ) {
                item = components[i];
                if ( item.isSupported && ( !item.isLegacy || gShowLegacy )) {
                    renderLibComponent( out, i, item );
                }
            }
            list$.html( out.toString() )
                .iconList( "refresh" );

            // make component icons draggable but only if the page is not readonly
            if ( !isPageReadOnly ) {
                $( "#cg-" + value + " li" ).draggable( {
                    addClasses: false,
                    appendTo: "#glv-viewport", // append here for proper scrolling
                    cursor2: "default",
                    cursorAt: { left: 2, top: 2 },
                    delay: 10,
                    distance: 5,
                    opacity: 0.9,
                    revert: false,
                    helper: function () {
                        var comp$ = $( this ),
                            key = comp$.attr( "data-component" ),
                            comp = getComponentData( key );
                        let regionType, itemType;
                        for ( const value of comp.values ) {
                            if ( value.id === model.PROP.REGION_TYPE ) {
                                regionType = value.value;
                            } else if ( value.id === model.PROP.ITEM_TYPE ) {
                                itemType = value.value;
                            }
                        }
                        return  glv$.gridlayout( "makeHelper",
                            comp.type, comp.iconClass, comp.title, key, regionType, itemType );
                    },
                    connectToGridlayout: "#glv",
                    containment: "document",
                    zIndex: 1000,
                    start: function ( /* event, ui */ ) {
                        // Note: the gallery and glv are always together so this no longer applies but leaving note
                        // and commented out code in place in case that ever changes. It will need changing because the layout tab is not at fixed index 0.
                        // todo there are issue with starting a drag while the GLV is not visible (not the current tab)
                        // the drag is happening but because the helper is appended to the glv viewport it can't be seen.
                        // returning false to stop the drag messes up the draggable plugins.
                        // if ( $( "#editor_tabs" ).tabs( "option", "active" ) !== 0 ) {
                        //    // this helps but the helper offset is messed up because it was calculated while the region was not visible
                        //    $( "#editor_tabs" ).tabs( "option", "active", 0 );
                        //}
                        apex.tooltipManager.disableTooltips();
                    },
                    stop: function ( /* event, ui */ ) {
                        apex.tooltipManager.enableTooltips();
                    }
                } );
            }
        } );

    }

    function clearGallery() {

        ["regions", "items", "buttons"].forEach( function( value ) {
            var list$ = $( "#cg-" + value + " ul" ).first();
            gComponents[value] = [];

            list$.empty()
                .iconList( "refresh" );
        } );
    }

    $( function() {
        var curTab, ignoreTabChange = false;

        gShowLegacy = window.pageDesigner.getPreference( PREF_SHOW_LEGACY ) === "Y";

        var contextMenu = {
            menubar: false,
            items: [
                { id: "addTo", type: "subMenu", disabled: true, labelKey: "PD.GAL.MI.ADD2", menu: { items: [ ]}
                },
                { type: "toggle", labelKey: "PD.GAL.MI.SHOW_LEGACY", get: function () {
                    return gShowLegacy;
                }, set: function ( v ) {
                    gShowLegacy = v;
                    updateComponentGallery();
                    window.pageDesigner.savePreference( PREF_SHOW_LEGACY, gShowLegacy ? "Y" : "N" );
                } }
            ],
            beforeOpen: function( event, ui ) {
                var component$, component, action, key,
                    glv$ = $( "#glv" ),
                    addTo = ui.menuElement.menu( "find", "addTo" ),
                    selection$ = ui.selection;

                if ( selection$.length === 1 && !model.isPageReadOnly() ) {
                    component$ = selection$.eq(0);
                    key = component$.attr( "data-component" );
                    component = getComponentData( key );
                    action = function() {
                        window.pageDesigner.glvMenuAddAction.call( this, key );
                    };
                    addTo.menu.items = window.pageDesigner.glvMakeTargetMenu( glv$.gridlayout( "getDropTargets", component.type, "add" ), action );
                } else {
                    addTo.menu.items = [];
                }
                addTo.disabled = addTo.menu.items.length === 0;
            }
        };

        $( "#cg-regions ul, #cg-items ul, #cg-buttons ul" ).addClass("a-Gallery" ).each( function() {
            $( this ).iconList({
                multiple: false,
                contextMenu: contextMenu,
                contextMenuId: "galleryMenu-" + $( this ).parent().parent()[0].id
            });
        }).tooltip({
            items: "li",
            show: apex.tooltipManager.defaultShowOption(),
            position: { my: "left-20 top-20", at: "right bottom", collision: "flipfit" },
            content: function() {
                var component = getComponentData( $( this ).attr( "data-component" ) );
                return component.tooltip;
            }
        });

        // one menu button handles all three iconlist menus so switch the menu id when the tabs change
        $( "#gallery-tabs" ).on( "tabsactivate", function( event, ui ) {
            $( "#galleryMenuBtn" ).attr( "data-menu", "galleryMenu-" + ui.newPanel[0].id );
            if ( !ignoreTabChange ) {
                window.pageDesigner.savePreference( PREF_CUR_TAB, ui.newTab.parent().children().index(ui.newTab[0]) );
            }
            ignoreTabChange = false;
        } );
        $( "#galleryMenuBtn" ).attr( "data-menu", "galleryMenu-cg-regions" );

        curTab = parseInt( window.pageDesigner.getPreference( PREF_CUR_TAB ), 10 );
        if ( !isNaN( curTab ) && curTab > 0 ) { // this test is OK because 0 is the default tab
            // the tabs are still not created yet so delay this
            setTimeout( function() {
                ignoreTabChange = true;
                $( "#gallery-tabs" ).tabs( "option", "active", curTab );
            }, 10 );
        }

        // todo can this be made automatic - handled by the widget?
        $( "#gallery-tabs .u-ScrollingViewport.resize" ).resize( function() {
            $( this ).children(".a-IconList" ).resize(); // fire resize event without actually changing the size of the list.
        });
    });

    $( document ).on( "modelReady", function(){
        initComponentGallery();
    });

    $( document ).on( "modelCleared", function(){
        clearGallery();
    });

})( window.componentGallery, pe, apex.jQuery, apex.util, apex.lang );
