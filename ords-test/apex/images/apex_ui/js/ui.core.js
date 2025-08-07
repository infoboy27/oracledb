/*!
 * Copyright (c) 2013, 2023, Oracle and/or its affiliates.
 */

/**
 * @fileOverview
 * This file contains initializations for several core UI components used within internal applications
 **/

(function( $, builder, util, navigation, theme ) {
    "use strict";

    const BUILDER_WINDOW_NAME = "APEX_BUILDER",
        APP_WINDOW_NAME_PREFIX = "APEX_AUT_",
        SEL_HS_REGION = ".a-Region--hideShow";

    builder.getAppUnderTestWindowName = function( pAppId ) {
        let share = $v("P0_WINDOW_MGMT_SHARE_WINDOW" ) === "Y",
            name = APP_WINDOW_NAME_PREFIX;
        if ( !share ) {
            name += pAppId;
        }
        return name;
    };

    builder.launchAppUnderTest = function( url, appId, options ) {
        let debug = "",
            // first check if the window already exists
            win = apex.navigation.openInNewWindow( "", builder.getAppUnderTestWindowName( appId ), options );

        if ( win && win.$v ) {
            debug = win.$v( "pdebug" ) || "";
        }

        if ( url.includes("f?p") && url.includes(":") ) { // check if url uses legacy url structure
            // current assumption is that data-link never contains the P1000_DEBUG item
            url = url.split( ":" );
            if ( url[3] === "BRANCH_TO_PAGE_ACCEPT" ) {
                url[6] = url[6] + ",P1000_DEBUG";
                url[7] = url[7] + "," + debug;
            } else {
                url[4] = debug;
            }
            url = url.join( ":" );
        }

        return navigation.openInNewWindow( url, builder.getAppUnderTestWindowName( appId ), options );
    };

    builder.nameBuilderWindow = function() {
        // Give this builder window a name (if it doesn't have one) so that the apex developer toolbar can effect this window
        if ( !window.name || window.name.indexOf( BUILDER_WINDOW_NAME ) === 0 ) {
            window.name = BUILDER_WINDOW_NAME + "_" + apex.env.APP_SESSION;
        }
    };

    builder.initWizardModal = function() {

        const CL_DIALOG_BODY   = '.a-Dialog-body',
            CL_DIALOG_STEPS  = '.a-Dialog-wizardSteps',
            CL_DIALOG_FOOTER = '.a-Dialog-footer';

        let fixDialogLayoutInBuilder = function(){
            let headerHeight = $( CL_DIALOG_STEPS ).height(),
                footerheight = $( CL_DIALOG_FOOTER ).height();
            $( CL_DIALOG_BODY ).css({
                'top'   : headerHeight,
                'bottom': footerheight
            });
        };

        $( window ).on( 'apexwindowresized', function() {
            fixDialogLayoutInBuilder();
        });

        fixDialogLayoutInBuilder();

        theme.modalAutoSize({
            observeClass: CL_DIALOG_BODY,
            sections:   [ CL_DIALOG_BODY,
                          CL_DIALOG_STEPS,
                          CL_DIALOG_FOOTER ]
        });
    };

    builder.initStickyHeader = function(pHeader) {
        const lHeader       = $('#'+pHeader);
        if ( lHeader[0] ) {
            const lHeaderHeight = lHeader.outerHeight(),
                lParent       = lHeader.parent(),
                lOffset       = lHeader.offset().top;
            $(window).on( "scroll", function(){
                if ($(window).scrollTop() > lOffset){
                    lHeader.addClass('is-fixed');
                    lParent.css('margin-top',lHeaderHeight);
                } else {
                    lHeader.removeClass('is-fixed');
                    lParent.css('margin-top','0');
                }
            });
        }
    };

    builder.initWizardProgressBar = function() {
        theme.initWizardProgressBar( "a-WizardSteps" );
    };

    $( function () {

        // Main Navigation List
        $( ".a-Header-tabsContainer" ).menu( {
            menubar: true,
            behaveLikeTabs: true
        } ).show();

        addNavigationListClasses('a_Header_menu');

        // Open Menu Link in New Window
        function launchNewWindow() {
            // called in the context of a menu item, so this is the menu item
            navigation.openInNewWindow(this.href, "_blank", {favorTabbedBrowsing:true});
        }

        // Help Menu
        $( '#helpMenu_menu' ).on("menucreate", function() {
            const helpMenu = this;
            // Menu items from markup don't support opening in a new window.
            // But specific help menu items do need to open in a new window so look them up by id and give them a special action
            ["helpLinkNewWindow", "helpLinkForum", "helpLinkOTN","helpLinkDocLib"].forEach( function( id ) {
                const item = $( helpMenu ).menu( "find", id );
                if ( item ) {
                    item.action = launchNewWindow;
                }
            } );
        });

        // Initialize Hide Show Regions
        initHideShowRegions();

        // Initialize Wizards
        // _initWizardProgressBar();

        // Dev Toolbar integration: Handle buttons that launch the app under test
        // so that it runs in a named window so it can communicate back to the builder via window.opener
        $( "body" ).on( "click", "button.launch-aut", function ( /* pEvent */ ) {
            const url = $( this ).attr( "data-link" ),
                options = {},
                runMode = $v( "P0_WINDOW_MGMT_MODE" ) || "FOCUS"; // values NONE, BROWSER, FOCUS

            let appId;

            // Try to identify the app id with non friendly URLs
            if ( url.includes( "?p=" ) ) {
                const parts = url.substring( url.indexOf( "?p=" ) + 3 ).split( ":" );

                if ( parts.length >= 8 && parts[3] === "BRANCH_TO_PAGE_ACCEPT" ) {
                    const params = parts[6].split( "," );
                    const values = parts[7].split( "," );

                    for ( let i = 0; i < params.length && i < values.length; i++ ) {
                        if ( params[i] === "FB_FLOW_ID" ) {
                            appId = values[i];
                            break;
                        }
                    }
                } else {
                    appId = parts[0];
                }
            }

            // Try to identify the app id with with friendly urls
            // assuming the url has search params fb_flow_id
            if ( !appId ) {
                try {
                    appId = new URL(window.location.origin + url).searchParams.get("fb_flow_id");
                } catch (error) {
                    // no app id found...
                }
            }

            // Try to identify the app id with with current builder URL
            // to find the search params fb_flow_id
            if ( !appId ) {
                try {
                    appId = new URL( window.location.href ).searchParams.get("fb_flow_id");
                } catch (error) {
                    // no app id found...
                }
            }

            // Try to identify the app id simply with the friendly URL of the app
            // split the url into parts and remove the last part (the page name)
            // then join the parts back together
            // the result will not technically the numeric ID of the app
            // since friendly URLs use alias but it can still be used to
            // identify a new window with the same app
            if ( !appId ) {
                try {
                    appId = new URL(url).pathname.split("/").slice(0, -1).join("/");
                } catch (error) {
                    // no app id found...
                }
            }

            if ( appId ) {
                if ( runMode === "NONE" || /^4\d\d\d$/.test( appId ) ) {
                    navigation.redirect( url );
                } else {
                    if ( runMode === "BROWSER" ) {
                        options.favorTabbedBrowsing = true;
                    } // else assume FOCUS
                    builder.launchAppUnderTest( url, appId, options );
                }
            }
        } );

        // the toolbar run page button is a normal apex button except we don't want it to simply navigate
        // but we do need the URL, so grab it from the onclick attribute, which gets removed and add data-link
        // so above handler will work
        $( "button.launch-aut" ).each( function() {
            let match, btn$ = $( this ),
                url = btn$.attr( "data-link" );

            if ( !url )  {
                match = /['"]((ws|f)\?p=.*)['"]/.exec( btn$.attr( "onclick" ) );

                // try with friendly URL
                if ( !match ) {
                    match = /[apex.navigation.redirect(]'(.*)'/.exec( btn$.attr( "onclick" ) );
                }

                if ( match && match.length > 1 ) {
                    url = JSON.parse(`"${match[1]}"`);
                    btn$.removeAttr( "onclick" );
                    btn$.attr( "data-link", url );
                }
            }
        });

        // Initialize the header account mega menu widget
        $( "#accountMenu_menu" ).menu({
            customContent: true,
            tabBehavior: "NEXT"
        });

        // Handle resizing of dialogs
        function resizeDialog( dialog$ ) {
            const footerheight = dialog$.find( ".a-DialogRegion-buttons" ).height();
            dialog$.find(".a-DialogRegion-body").css( "bottom",  footerheight );
        }

        $( document.body )
            .on( "dialogopen dialogresizestop", ".a-DialogRegion", function() {
                resizeDialog($(this));
            });
    } );

    function initHideShowRegions() {
        $( SEL_HS_REGION ).each( function() {
            $( this ).collapsible({
                content: $( this ).find( ".a-Region-body" ).first(),
                collapsed: $( this ).hasClass( "is-collapsed" )
            });
        });
    }

    // Function to add Navigation List Classes
    function addNavigationListClasses(menuId) {
        let i, c, items$, items,
            menu$ = $( "#" + menuId );

        if ( menu$.length ) {
            items$ = menu$.children( "ul" ).children( "li" );
            items = menu$.menu( "option" ).items;

            for (i = 0; i < items.length; i++) {
                c = items[i].id;
                if (c) {
                    items$.eq(i).addClass(c);
                }
            }
        }
    }

})( apex.jQuery, apex.builder, apex.util, apex.navigation, apex.theme );
