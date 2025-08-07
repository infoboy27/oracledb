/*!
 * Copyright (c) 2013, 2023, Oracle and/or its affiliates.
 */

/**
 * @fileOverview
 * Turns a standard DIV element into an error/warning list for a property editor page:
 *   apex.jQuery( "#myList" ).peMessagesView({ badge: "#messageBadge" });
 */

(function( model, $, util ) {
    "use strict";

    var WIDGET_NAME = "messages_",
        CSS = {
            ERROR:   "error",
            WARNING: "warning"
        },
        ICON = {
            ERROR:   "icon-remove-sign",
            WARNING: "icon-warning-sign"
        };

    const hasOwnProperty = util.hasOwnProperty;

    $.widget( "apex.peMessagesView", {
        options: {},
        /*
         * Lifecycle methods
         */
        _create: function() {

            var lSelf = this,
                lMessages$;

            this.element.empty();

            lMessages$       = $( "<div>", { "class": "a-AlertMessages" }).appendTo( this.element );
            this._container$ = $( "<ul></ul>", { "class": "a-AlertMessages-list" })
                .appendTo( lMessages$ )
                .on( "click", "a", this._goToComponent );

            $( document ).on( "modelReady", function() {

                // Listen for all events which have an impact on displayed error or warning messages
                model.observer(
                    WIDGET_NAME + this.uuid, {
                        events: [
                            model.EVENT.ERRORS,
                            model.EVENT.NO_ERRORS,
                            model.EVENT.WARNINGS,
                            model.EVENT.NO_WARNINGS,
                            model.EVENT.DELETE,
                            model.EVENT.REMOVE_PROP,
                            model.EVENT.VALIDATE_COMPONENT ]
                    },
                    function( pNotifications ) {
                        lSelf._update( pNotifications );
                    } );

                // Clear all messages and the badge if the model gets cleared
                $( document ).one( "modelCleared", function() {
                    lSelf._container$.empty();
                    if ( typeof lSelf.options.badge === "function" ) {
                        lSelf.options.badge( "" );
                    } else {
                        $( lSelf.options.badge ).text( "" );
                    }
                });

            });

        },
        _init: function() {
        },
        _destroy: function() {
            this.element.empty();

            $( document ).off( "modelReady" );
            $( document ).off( "modelCleared" );
            model.unobserver( WIDGET_NAME + this.uuid );
        },
        /*
         * Private functions
         */
        _update: function( pNotification ) {

            /*
             * Creates a clickable list entry for each error/warning defined in pMessages
             */
            function addEntries( pComponent, pProperty, pMessages, pCssClass, pIconClass ){
                function extendPath( value ) {
                    if ( value ) {
                        path += ` ${ path.length ? "&rarr;" : ""} ${ util.escapeHTML( value ) }`;
                    }
                }

                let path = "", out = "";
                const MESSAGE_MARKUP = `
                    <li class="a-AlertMessages-item" data-typeid="#TYPEID#" data-componentid="#COMPONENTID#" data-propertyid="#PROPERTYID#">
                        <a href="#" class="a-MediaBlock a-AlertMessages-message is-#CSS_CLASS#">
                            <div class="a-MediaBlock-graphic">
                                <span class="a-FAIcon a-FAIcon--medium a-FAIcon--#CSS_CLASS# #ICON_CLASS#"></span>
                            </div>
                            <div class="a-MediaBlock-content">
                                <h5 class="a-AlertMessages-propertyTitle">#PATH#</h5>
                                <p class="a-AlertMessages-messageDescription">#MESSAGE#</p>
                            </div>
                        </a>
                    </li>
                `;

                for ( var i = 0; i < pMessages.length; i++ ) {
                    extendPath( model.getComponentType( pComponent.typeId ).title.singular );
                    extendPath( pComponent.getDisplayTitle() );

                    out += MESSAGE_MARKUP
                                 .replace( /#CSS_CLASS#/g,     pCssClass )
                                 .replace( /#ICON_CLASS#/g,    pIconClass )
                                 .replace( "#TYPEID#",         pComponent.typeId )
                                 .replace( "#COMPONENTID#",    pComponent.id )
                                 .replace( "#MESSAGE#",        pMessages[ i ]); // Message is already HTML escaped on the server
                    if ( pProperty ){
                        extendPath( model.getDisplayGroup( pProperty.getMetaData().displayGroupId ).title );
                        extendPath( pProperty.getMetaData().prompt );

                        out = out.replace( "#PROPERTYID#",     pProperty.id );
                    }

                    out = out.replace( "#PATH#", path );
                }

                // Add HTML to our message view
                this._container$.append( out );

            } // addEntries

            function addComponentErros() {
                this._container$.find( lSelector + "[data-propertyid='#PROPERTYID#']" ).remove();
                if ( pNotification.errors?.length ) {
                    addEntries.call( this, lComponent, null, pNotification.errors, CSS.ERROR, ICON.ERROR );
                }
            }

            var lComponent = pNotification.component,
                lSelector  = "li" +
                             "[data-typeid='" + lComponent.typeId + "']" +
                             "[data-componentid='" + lComponent.id + "']",
                lBadge     = this.options.badge,
                // Message is opened by this button.
                lButton    = this.options.button,
                noMsgHandler = this.options.noMsgHandler,
                lProperty,
                lCount,
                hasMessages;

            // If the component got deleted, remove all messages for this component
            if ( $.inArray( model.EVENT.DELETE, pNotification.events ) >= 0 ) {

                this._container$.find( lSelector ).remove();

            } else if ( Object.keys( pNotification.properties ).length ) {
                // Component has been validated/invalidated or a property has been removed

                for ( var lPropertyId in pNotification.properties ) {
                    if ( hasOwnProperty( pNotification.properties, lPropertyId )) {

                        // Remove any existing messages for the current property which has been validated/invalidated
                        this._container$.find( lSelector + "[data-propertyid='" + lPropertyId + "']" ).remove();

                        // Does the property still exist for the component?
                        if ( $.inArray( model.EVENT.REMOVE_PROP, pNotification.properties[ lPropertyId ]) === -1 ) {

                            // If the property is still available, add all current error or warning messages to our message view
                            lProperty = lComponent.getProperty( lPropertyId );
                            addEntries.call( this, lComponent, lProperty, lProperty.errors,   CSS.ERROR,   ICON.ERROR);
                            addEntries.call( this, lComponent, lProperty, lProperty.warnings, CSS.WARNING, ICON.WARNING);
                        }
                    }
                }

                if ( pNotification.events.includes( model.EVENT.ERRORS ) && pNotification.errors?.length ) {
                    addComponentErros.call( this );    
                }
            } else {
                addComponentErros.call( this );
            }

            lCount      = this._container$.find( "li" ).length;
            hasMessages = lCount > 0;

            lButton.toggle( hasMessages && lButton.length > 0 );

            // Update the badge which displays the number of messages
            if ( typeof lBadge === "function" ) {
                lBadge( lCount );
            } else {
                $( lBadge ).text( hasMessages ? lCount : "" );
            }

            if ( !hasMessages && typeof noMsgHandler === "function" ) {
                noMsgHandler();
            }
        },
        /*
         * Triggers the "selectComponent" event for the clicked error/warning message so that other widgets
         * can display that component to view/edit it.
         */
        _goToComponent: function () {

            var lLi$ = $( this ).closest( "li" ),
                lComponent = model.getComponents( lLi$.data( "typeid" ), { id: lLi$.data( "componentid" )})[ 0 ];

            // todo Change the file to a f4000_p4500 file or the controller should provide a new event "goToComponent" which makes
            // sure that the visual focus is changed
            window.pageDesigner.goToComponent( lComponent.typeId, lComponent.id, lLi$.data( "propertyid" ) );

        }
    });

})( window.pe, apex.jQuery, apex.util );