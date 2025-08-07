/*!
 Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
 */

/* global gInstalledApps, gPendingApps */
( function ( util, apexItem, apexRegion, lang, locale, navigation, page, message, server, env, debug, actions, $ ) {
    "use strict";

    const ORACLE_REPO_BASE_URL = "https://raw.githubusercontent.com/oracle/apex/",
          ORACLE_AUTHOR_NAME = "Oracle",
          INIT_INSTALL_APP_AJAX_CALLBACK = "INIT_INSTALL_APP",
          INSTALL_APP_AJAX_CALLBACK = "INSTALL_APP",
          UPDATE_APP_AJAX_CALLBACK = "UPDATE_APP",
          INSTALLED_APPS_AJAX_CALLBACK = "CHECK_INSTALLED_APPS",
          PENDING_APPS_AJAX_CALLBACK = "CHECK_PENDING_INSTALL",
          INSTALL_APP_INT_NAME_ITEM = "P50_APP_INSTALL_INT_NAME",
          INSTALL_APP_AUTHOR_ITEM = "P50_APP_INSTALL_AUTHOR",
          REMOVE_APP_ID_ITEM = "P50_REMOVE_FLOW_ID",
          APP_GROUP_ITEM = "P50_APP_GROUP",
          APP_CARD_CLASS = "app_card",
          APP_CONTENT_REGION_ID = "APP_CONTENT",
          APP_INSTALLING_CLASS = "is-installing",
          DEFAULT_APP_ICON = env.APEX_FILES + "apex_ui/img/icons/pkg-apps/app-placeholder.svg",
          APEX_BASE_VERSION = env.APEX_BASE_VERSION,
          MSG_INSTALL_APP = lang.getMessage( "GALLERY.INSTALL_APP" ),
          MSG_INSTALLING_APP = lang.getMessage( "GALLERY.INSTALLING_APP" ),
          MSG_REMOVE_APP = lang.getMessage( "GALLERY.REMOVE_APP" ),
          MSG_UPDATE_APP = lang.getMessage( "GALLERY.UPDATE_APP" ),
          MSG_UPDATING_APP = lang.getMessage( "GALLERY.UPDATING_APP" ),
          MSG_FILE_DOWNLOAD_ERROR = lang.getMessage( "GALLERY.FILE_DOWNLOAD_ERROR" ),
          MSG_MISSING_VALUES_ERROR = lang.getMessage( "GALLERY.MISSING_VALUES_ERROR" ),
          INSTALL_STATUS_PENDING = "PENDING",
          INSTALL_STATUS_ERROR = "ERROR",
          INSTALL_ACTION_UPDATE = "UPDATE",
          BACKGROUND_INSTALL_ENABLED = apexItem( "P50_GALLERY_BACKGROUND_INSTALL" ).getValue() === "Y",
          PENDING_INTERVAL_TIME = 4000; // every 4 sec

    let gSpinner$,
        gShowSpinner = true,
        gPendingInterval,
        // gInstalledApps & gPendingApps variables are populated at page rendering by server side
        gInstalledApplications = typeof gInstalledApps !== "undefined" ? gInstalledApps : [],
        gPendingApplications = typeof gPendingApps !== "undefined" ? gPendingApps : [],
        gLastInstalledApp,
        gRequestedApps = [];

    /**
     * Download a file from a given URL and return the response as blob
     * @function loadData
     * @param {string} pFileUrl
     * @return {Promise<object>} file blob
     */
    async function loadData( pFileUrl = "" ) {
        let errorResponse;

        function _throwNetworkError( pResponse ) {
            debug.error( `Failed network request for ${pResponse.url}`, pResponse );
            showError( MSG_FILE_DOWNLOAD_ERROR );
            throw new Error( `Failed network request: ${pResponse.status} ${pResponse.statusText}` );
        }

        async function _fetchFile() {
            let data;

            showSpinner();

            if ( pFileUrl ) {
                data = await fetch( pFileUrl, {
                    method: "GET",
                    mode: "cors",
                    credentials: "omit",
                    cache: "no-store",
                    redirect: "follow",
                    referrerPolicy: "no-referrer"
                } )
                    .then( ( response ) => {
                        if ( response.ok ) {
                            return response.blob();
                        } else {
                            errorResponse = response;
                        }
                    } )
                    .catch( () => {
                        errorResponse = { url: pFileUrl, status: "failed", statusText: "Connection refused" };
                    } );
            }

            if ( errorResponse ) {
                _throwNetworkError( errorResponse );
            }

            removeSpinner();

            return data;
        }

        return await _fetchFile();
    }

    /**
     * Shows a waiting spinner
     * @function showSpinner
     */
    function showSpinner() {
        if ( gShowSpinner ) {
            gSpinner$ = util.showSpinner( $( "body" ) );
        }
    }

    /**
     * Remove the waiting spinner
     * @function removeSpinner
     */
    function removeSpinner() {
        if ( gShowSpinner ) {
            if ( gSpinner$ && gSpinner$.length > 0 ) {
                gSpinner$.remove();
            }
        }
    }

    /**
     * Indicate a pending installation on a gallery card
     * Add class "is-installing "to card and change button state & text
     * @function showPendingInstall
     * @param {object} pInstallButton$
     * @param {boolean} pIsUpdate
     */
    function showPendingInstall( pInstallButton$, pIsUpdate = false ) {
        const appCard$ = pInstallButton$.closest( `li.${APP_CARD_CLASS}` ),
              appAttr = getAppAttributes( pInstallButton$ ),
              allCardButtons$ = $( `#${APP_CONTENT_REGION_ID}` ).find( `.${APP_CARD_CLASS}` ).find( "button" ),
              menuButton$ = appCard$.find( ".menu_button" ),
              buttonText = pIsUpdate ? MSG_UPDATING_APP : MSG_INSTALLING_APP;

        if ( pInstallButton$ && pInstallButton$.length > 0 ) {
            pInstallButton$.find( "span" ).text( buttonText );
            pInstallButton$.attr( "disabled", "disabled" );
            pInstallButton$.attr( "role", "alert" );
        }

        menuButton$.attr( "disabled", "disabled" );
        appCard$.addClass( APP_INSTALLING_CLASS );
        gLastInstalledApp = appAttr.internalName;

        if ( !BACKGROUND_INSTALL_ENABLED ) {
            if ( allCardButtons$ && allCardButtons$.length > 0 ) {
                allCardButtons$.attr( "disabled", "disabled" );
            }
        }
    }

    /**
     * Remove a pending installation state from a gallery card
     * Remove class "is-installing" from card and change button state & text
     * @function removePendingInstall
     * @param {object} pAppCard$
     * @param {boolean} pIsUpdate
     */
    function removePendingInstall( pAppCard$, pIsUpdate = false ) {
        const button$ = pIsUpdate ? pAppCard$.find( ".update_app_button" ) : pAppCard$.find( ".install_app_button" ),
              allCardButtons$ = $( `#${APP_CONTENT_REGION_ID}` ).find( `.${APP_CARD_CLASS}` ).find( "button" ),
              menuButton$ = pAppCard$.find( ".menu_button" ),
              buttonText = pIsUpdate ? MSG_UPDATE_APP : MSG_INSTALL_APP;

        if ( button$ && button$.length > 0 ) {
            button$.find( "span" ).text( buttonText );
            button$.attr( "disabled", false );
            button$.removeAttr( "role" );
        }

        menuButton$.attr( "disabled", false );
        pAppCard$.removeClass( APP_INSTALLING_CLASS );
        gLastInstalledApp = null;

        if ( !BACKGROUND_INSTALL_ENABLED ) {
            if ( allCardButtons$ && allCardButtons$.length > 0 ) {
                allCardButtons$.attr( "disabled", false );
            }
        }
    }

    /**
     * Adds an requested app to the stack
     * requested app: app which downloads from given provider, but not yet uploaded to server
     * @param {string} pAppIntName
     */
    function addRequestedApp( pAppIntName ) {
        if ( pAppIntName ) {
            gRequestedApps.push( pAppIntName );
        }
    }

    /**
     * Removes an requested app from the stack
     * requested app: app which downloads from given provider, but not yet uploaded to server
     * @param {string} pAppIntName
     */
    function removeRequestedApp( pAppIntName ) {
        if ( pAppIntName ) {
            gRequestedApps = gRequestedApps.filter( ( app ) => app !== pAppIntName );
        }
    }

    /**
     * Checks if we still have pending requested apps
     * This function is used by apex.page.warnOnUnsavedChanges on the page
     * @return {boolean}
     */
    function hasRequestedApps() {
        return gRequestedApps.length > 0;
    }

    /**
     * Show a better looking confirm dialog with icon and a more modern UI
     * @function showConfirm
     * @param {string} pMessage
     * @param {string} pOkLabel
     * @param {string} pStyle
     * @param {function} callback
     */
    function showConfirm( pMessage, pOkLabel, pStyle, callback ) {
        removeSpinner();

        message.showDialog( util.applyTemplate( pMessage ), {
            confirm: true,
            callback: function ( ok ) {
                if ( !ok ) {
                    callback( false );
                } else {
                    callback( true );
                }
            },
            okLabel: pOkLabel,
            dialogClass: "ui-dialog--notification",
            unsafe: false,
            modern: true,
            style: pStyle || "information"
        } );
    }

    /**
     * Shows a error message
     * @function showError
     * @param {string} pMessage
     */
    function showError( pMessage ) {
        removeSpinner();

        message.clearErrors();
        message.showErrors( [
            {
                type: "error",
                location: "page",
                message: pMessage,
                unsafe: false
            }
        ] );
    }

    /**
     * Get application attributes of app card by one of its child elements
     * @function getAppAttributes
     * @param {object} pCardChild$
     * @return {object} app attributes as json
     */
    function getAppAttributes( pCardChild$ ) {
        const appCard$ = pCardChild$.closest( `li.${APP_CARD_CLASS}` );

        return {
            appId: appCard$.data( "app-id" ),
            name: appCard$.data( "name" ),
            description: appCard$.data( "desc" ),
            author: appCard$.data( "author" ),
            internalName: appCard$.data( "internal-name" ),
            version: appCard$.data( "version" ),
            icon: appCard$.data( "icon" ),
            zipUrl: appCard$.data( "zip-url" )
        };
    }

    /**
     * Saves the fetched file with additional information to DB using an multipart/form-data request to not run in any size limitations
     * (AJAX callback stores that information on the server side)
     * @function saveInstallFile
     * @param {number} pAppId
     * @param {string} pAppName
     * @param {string} pAppDesc
     * @param {string} pAppAuthor
     * @param {string} pAppIntName
     * @param {string} pAppVersion
     * @param {string} pAppIcon
     * @param {blob} pAppFile
     * @param {boolean} pDirectInstall
     * @param {string} pAppProcess
     * @param {array} pItemsToSubmit
     */
    async function saveInstallFile( pAppId, pAppName, pAppDesc, pAppAuthor, pAppIntName, pAppVersion, pAppIcon, pAppFile, pDirectInstall, pAppProcess, pItemsToSubmit ) {
        const errorMsg = lang.formatMessage( "GALLERY.INSTALL_APP_ERROR", pAppName ),
              appFileName = "packaged_app_" + new Date().getTime() + ".zip",
              appFile = new File( [pAppFile], appFileName, { type: pAppFile.type, lastModified: new Date().getTime() } );

        let result;

        // build formData request and upload file to server
        async function _uploadFile( pFile ) {
            let formData = new FormData(),
                appProcess = pAppProcess,
                response;

            formData.append( "F01", pFile, pFile.name );

            try {
                response = await server.process( appProcess, {
                    x01: pAppIntName,
                    x02: pAppAuthor,
                    x03: pAppId,
                    x04: pAppName,
                    x05: pAppDesc,
                    x06: pAppIcon,
                    x07: pAppVersion,
                    formData: formData,
                    pageItems: pItemsToSubmit
                } );
            } catch ( error ) {
                response = { success: false, error: "Connection refused" };
            }

            return response;
        }

        showSpinner();

        result = await _uploadFile( appFile );

        if ( result.success ) {
            removeSpinner();
            if ( pDirectInstall ) {
                $( "body" ).trigger( "app-install-initialized", { appName: pAppName, appDesc: pAppDesc, appAuthor: pAppAuthor, appIntName: pAppIntName } );
            } else {
                if ( result.url ) {
                    navigation.redirect( result.url );
                }
            }
        } else {
            debug.error( "upload error", result.error );
            showError( errorMsg );
        }
    }

    /**
     * Removes a installed app (submits page which executes delete logic)
     * @function removeInstalledApp
     * @param {object} pRemoveButton$
     */
    function removeInstalledApp( pRemoveButton$ ) {
        const appAttr = getAppAttributes( pRemoveButton$ ),
              confirmMsg = lang.formatMessage( "GALLERY.REMOVE_APP_CONFIRM", appAttr.name, appAttr.appId );

        showConfirm( confirmMsg, MSG_REMOVE_APP, "danger", function ( okPressed ) {
            if ( okPressed ) {
                page.submit( {
                    request: "REMOVE_APP",
                    set: { [REMOVE_APP_ID_ITEM]: appAttr.appId },
                    showWait: true
                } );
            }
        } );
    }

    /**
     * Updates a installed app and re-uses main logic from installApp function
     * @function updateInstalledApp
     * @param {object} pUpdateButton$
     */
    function updateInstalledApp( pUpdateButton$ ) {
        const appAttr = getAppAttributes( pUpdateButton$ ),
              confirmMsg = lang.formatMessage( "GALLERY.UPDATE_APP_CONFIRM", appAttr.name, appAttr.appId );

        showConfirm( confirmMsg, MSG_UPDATE_APP, "warning", function ( okPressed ) {
            if ( okPressed ) {
                installApp( pUpdateButton$, true, true );
            }
        } );
    }

    /**
     * Run app installation process by downloading zip file and storing it with additional info to DB.
     * pDirectInstall would also fire installation logic, if false it opens the app details modal dialog
     * @function installApp
     * @param {object} pInstallButton$
     * @param {boolean} pDirectInstall
     * @param {boolean} pIsUpdate
     */
    async function installApp( pInstallButton$, pDirectInstall = true, pIsUpdate = false ) {
        const appAttr = getAppAttributes( pInstallButton$ );

        let itemsToSubmit = [];

        if ( !appAttr.zipUrl ) {
            showError( MSG_FILE_DOWNLOAD_ERROR );
            return;
        }

        if ( !appAttr.author || !appAttr.internalName ) {
            debug.error( "Missing required values: author, internalName" );
            showError( MSG_MISSING_VALUES_ERROR );
            return;
        }

        addRequestedApp( appAttr.internalName );

        if ( pDirectInstall ) {
            showPendingInstall( pInstallButton$, pIsUpdate );

            if ( BACKGROUND_INSTALL_ENABLED ) {
                gShowSpinner = false;
            }

            apexItem( INSTALL_APP_INT_NAME_ITEM ).setValue( appAttr.internalName );
            apexItem( INSTALL_APP_AUTHOR_ITEM ).setValue( appAttr.author );
            if ( pIsUpdate ) {
                apexItem( REMOVE_APP_ID_ITEM ).setValue( appAttr.appId );
                itemsToSubmit = [INSTALL_APP_INT_NAME_ITEM, INSTALL_APP_AUTHOR_ITEM, REMOVE_APP_ID_ITEM];
            } else {
                itemsToSubmit = [INSTALL_APP_INT_NAME_ITEM, INSTALL_APP_AUTHOR_ITEM];
            }
        }

        const fileData = await loadData( appAttr.zipUrl );

        if ( fileData ) {
            await saveInstallFile(
                appAttr.appId,
                appAttr.name,
                appAttr.description,
                appAttr.author,
                appAttr.internalName,
                appAttr.version,
                appAttr.icon,
                fileData,
                pDirectInstall,
                pIsUpdate ? UPDATE_APP_AJAX_CALLBACK : pDirectInstall ? INSTALL_APP_AJAX_CALLBACK : INIT_INSTALL_APP_AJAX_CALLBACK,
                itemsToSubmit
            );
        }

        removeRequestedApp( appAttr.internalName );

        if ( pDirectInstall ) {
            gShowSpinner = true;

            stopPendingInstallInterval();
            startPendingInstallInterval();
        }
    }

    /**
     * Logic for switching between tabs (sample apps, starter apps, custom apps)
     * @function switchAppGroupTab
     */
    function switchAppGroupTab() {
        let regionName = util.escapeCSS( apexItem( APP_GROUP_ITEM ).getValue() ),
            region$ = $( "#" + regionName ),
            regionContent$ = $( "#" + regionName + "_CONTENT" );

        $( ".apps_region, .apps_region_container" ).hide();
        region$.show();

        if ( region$.hasClass( "apps_region" ) ) {
            $( "#" + regionName + "_ClientSideTemplator" ).css( "width", "100%" );
            apexRegion( regionName ).call( "resize" );
        }

        if ( region$.hasClass( "apps_region_container" ) ) {
            if ( regionContent$.length > 0 ) {
                regionContent$.show();
                $( "#" + regionName + "_CONTENT_ClientSideTemplator" ).css( "width", "100%" );
                apexRegion( regionName + "_CONTENT" ).call( "resize" );
            }
        }
    }

    /**
     * Refresh all app regions like (sample apps, starter apps, custom apps)
     * @function refreshAllAppRegions
     */
    function refreshAllAppRegions() {
        const sampleAppsRegion = apexRegion( "SAMPLE_APPS" ),
              starterAppsRegion = apexRegion( "STARTER_APPS" ),
              utilityAppsRegion = apexRegion( "UTILITY_APPS" ),
              customAppsRegion = apexRegion( "CUSTOM_APPS_CONTENT" );

        if ( sampleAppsRegion ) {
            sampleAppsRegion.refresh();
        }
        if ( starterAppsRegion ) {
            starterAppsRegion.refresh();
        }
        if ( utilityAppsRegion ) {
            utilityAppsRegion.refresh();
        }
        if ( customAppsRegion ) {
            customAppsRegion.refresh();
        }
    }

    /**
     * JS init code of "Client Side Templator" regions used on the page
     * @function clientSideTemplatorJSInitCode
     * @param {object} pOptions
     * @return {object} modified options
     */
    function clientSideTemplatorJSInitCode( pOptions ) {
        const defaultLang = "en",
              lang = locale.getLanguage().toLowerCase() || defaultLang;

        function _appMatch( pInstalledApp, pInternalName, pAuthor ) {
            return pInstalledApp.internalName === pInternalName.toLowerCase() && pInstalledApp.author === pAuthor.toLowerCase();
        }

        // don't show built in errors, we have our own error handling on the page using events provided by the plugin
        pOptions.showErrors = false;

        // prepare the row data which is used for our html record template
        pOptions.prepareRowData = function ( row ) {
            let newRow = {},
                hasLangObject = row.i18n && row.i18n[lang],
                hasLangName = hasLangObject && row.i18n[lang].name,
                hasLangDesc = hasLangObject && row.i18n[lang].description,
                installedApps = gInstalledApplications || [],
                pendingApps = gPendingApplications || [],
                matchedInstalledApp;

            newRow.name = row.name ? row.name : hasLangName ? row.i18n[lang].name : row.i18n[defaultLang].name;
            newRow.description = row.description ? row.description : hasLangDesc ? row.i18n[lang].description : row.i18n[defaultLang].description;
            newRow.lang = hasLangName ? lang : row.i18n && row.i18n[defaultLang] && row.i18n[defaultLang].name ? defaultLang : "";
            newRow.internalName = row.internalName ? row.internalName.toLowerCase() : "";
            newRow.author = row.author ? row.author : "";
            newRow.version = row.version ? row.version : "";
            newRow.apexVersion = row.apexVersion ? row.apexVersion : APEX_BASE_VERSION;
            newRow.icon = row.icon ? row.icon : DEFAULT_APP_ICON;
            newRow.url = row.url ? row.url : "";
            newRow.zip = row.zip ? row.zip : "";

            matchedInstalledApp = installedApps.find( ( installedApp ) => _appMatch( installedApp, newRow.internalName, newRow.author ) ) || {};

            newRow.appId = matchedInstalledApp?.id || "";
            newRow.appLink = matchedInstalledApp?.appLink || "";
            newRow.editLink = matchedInstalledApp?.editLink || "";
            newRow.installedVersion = matchedInstalledApp?.version || "";
            newRow.isInstalled = installedApps.some( ( installedApp ) => _appMatch( installedApp, newRow.internalName, newRow.author ) ) ? "Y" : "N";
            newRow.updateAvailable = installedApps.some( ( installedApp ) => _appMatch( installedApp, newRow.internalName, newRow.author ) && installedApp.version !== newRow.version )
                ? "Y"
                : "N";

            newRow.installPending = pendingApps.some( ( pendingApp ) => _appMatch( pendingApp, newRow.internalName, newRow.author ) && pendingApp.status === INSTALL_STATUS_PENDING )
                ? "Y"
                : "N";

            newRow.isOracle = newRow.author.toLowerCase() === ORACLE_AUTHOR_NAME.toLowerCase() && newRow.zip.startsWith( ORACLE_REPO_BASE_URL ) ? "Y" : "N";
            newRow.isCompatible = parseFloat( newRow.apexVersion ) <= parseFloat( APEX_BASE_VERSION ) ? "Y" : "N";

            return newRow;
        };

        // filter data to only display correct entries
        pOptions.filterData = function ( data ) {
            data = data.filter( function ( item ) {
                return item.isCompatible === "Y";
            } );
            // sort by apexVersion descending & remove duplicate entries --> if same app is supplied with different versions only keep newest
            data = data.sort( ( a, b ) => parseFloat( b.apexVersion ) - parseFloat( a.apexVersion ) );
            data = data.filter( ( item, index, array ) => array.findIndex( ( elem ) => elem.internalName === item.internalName && elem.author === item.author ) === index );

            return data;
        };

        // sort our results by application name alphabetically
        pOptions.sortData = function ( a, b ) {
            let nameA = a.name.toLowerCase(),
                nameB = b.name.toLowerCase();

            return nameA < nameB ? -1 : nameA > nameB ? 1 : 0;
        };

        // search logic when something is entered into the search item
        // search in name, description & author fields
        pOptions.searchItemFilter = function ( data, fields, searchValue ) {
            const fieldKeyName = fields.NAME ? fields.NAME.index : 0,
                  fieldKeyDesc = fields.DESCRIPTION ? fields.DESCRIPTION.index : 0,
                  fieldKeyAuthor = fields.AUTHOR ? fields.AUTHOR.index : 0;

            data = data.filter( function ( item ) {
                return (
                    item[fieldKeyName].toLowerCase().includes( searchValue.toLowerCase() ) ||
                    item[fieldKeyDesc].toLowerCase().includes( searchValue.toLowerCase() ) ||
                    item[fieldKeyAuthor].toLowerCase().includes( searchValue.toLowerCase() )
                );
            } );
            return data;
        };

        return pOptions;
    }

    /**
     * Initialize card menus & buttons of gallery cards
     * @function initCardMenuButtons
     * @param {object} pRegion$
     */
    function initCardMenuButtons( pRegion$ ) {
        if ( pRegion$ && pRegion$.length > 0 ) {
            $( "button[data-menu^='cst_menu_']", pRegion$ ).each( function () {
                const menuId = util.escapeCSS( this.getAttribute( "data-menu" ) );

                $( `div.a-Menu[id=${menuId}]` ).remove();
                $( `#${menuId}` ).menu();
            } );
        }
    }

    /**
     * Focus last installed app (after installation)
     * @function focusLastInstalledApp
     */
    function focusLastInstalledApp() {
        if ( gLastInstalledApp ) {
            const lastInstalledAppCard$ = $( `li.app_card[data-internal-name="${util.escapeCSS( gLastInstalledApp )}"]` );

            if ( lastInstalledAppCard$ && lastInstalledAppCard$.length > 0 ) {
                lastInstalledAppCard$.find( "button.launch-aut" ).focus();
            }
            gLastInstalledApp = null;
        }
    }

    /**
     * Fetch installed apps array from server side
     * @function getInstalledApps
     */
    async function getInstalledApps() {
        const result = await server.process( INSTALLED_APPS_AJAX_CALLBACK, {}, {} );
        return result;
    }

    /**
     * Fetch pending installation apps array from server side
     * @function getInstalledApps
     */
    async function getPendingApps() {
        const result = await server.process( PENDING_APPS_AJAX_CALLBACK, {}, {} );
        return result;
    }

    /**
     * Starts the interval which logic checks the status of an app installation
     * @function startPendingInstallInterval
     */
    function startPendingInstallInterval() {
        async function _checkPendingInstall() {
            let appsWithError = [],
                errorMsg = "";

            gPendingApplications = await getPendingApps();

            if ( gPendingApplications.length > 0 ) {
                if ( gPendingApplications.some( ( pendingApp ) => pendingApp.status === INSTALL_STATUS_PENDING ) ) {
                    debug.trace( "Still pending installation of apps...", gPendingApplications );
                } else {
                    gInstalledApplications = await getInstalledApps();
                    refreshAllAppRegions();
                    stopPendingInstallInterval();
                }

                if ( gPendingApplications.some( ( pendingApp ) => pendingApp.status === INSTALL_STATUS_ERROR ) ) {
                    debug.error( "Error happened during app installation", gPendingApplications );

                    appsWithError = gPendingApplications.filter( ( pendingApp ) => pendingApp.status === INSTALL_STATUS_ERROR );
                    appsWithError.forEach( ( app ) => {
                        errorMsg = lang.formatMessage( "GALLERY.INSTALL_APP_ERROR", app.name ); // generic error message
                        if ( app.message ) {
                            errorMsg += " " + app.message;
                        }
                        removePendingInstall( $( `li.app_card[data-internal-name="${util.escapeCSS( app.internalName )}"]` ), app.action === INSTALL_ACTION_UPDATE ); // show standard card again
                    } );

                    if ( errorMsg ) {
                        showError( errorMsg );
                    }
                }
            }
        }

        if ( !gPendingInterval ) {
            gPendingInterval = setInterval( _checkPendingInstall, PENDING_INTERVAL_TIME );
        }
    }

    /**
     * Stops the interval which logic checks the status of an app installation
     * @function startPendingInstallInterval
     */
    function stopPendingInstallInterval() {
        if ( gPendingInterval ) {
            clearInterval( gPendingInterval );
            gPendingInterval = null;
        }
    }

    // define some actions for our card menus when page gets loaded
    $( () => {
        actions.add( {
            name: "APP_DETAILS",
            label: lang.getMessage( "GALLERY.APP_DETAILS" ),
            icon: "a-Icon icon-gallery-app-details",
            action: function ( menu, button ) {
                debug.trace( "APP_DETAILS action", this, menu, button );
                installApp( $( button ), false );
            }
        } );

        actions.add( {
            name: "REMOVE_APP",
            label: lang.getMessage( "GALLERY.REMOVE_APP" ),
            icon: "a-Icon icon-gallery-remove",
            action: function ( menu, button ) {
                debug.trace( "REMOVE_APP action", this, menu, button );
                removeInstalledApp( $( button ) );
            }
        } );

        if ( gPendingApplications.length > 0 ) {
            startPendingInstallInterval();
        }
    } );

    // make some functions public for integration into page
    window.installApp = installApp;
    window.removeInstalledApp = removeInstalledApp;
    window.updateInstalledApp = updateInstalledApp;
    window.switchAppGroupTab = switchAppGroupTab;
    window.clientSideTemplatorJSInitCode = clientSideTemplatorJSInitCode;
    window.initCardMenuButtons = initCardMenuButtons;
    window.focusLastInstalledApp = focusLastInstalledApp;
    window.hasRequestedApps = hasRequestedApps;
} )( apex.util, apex.item, apex.region, apex.lang, apex.locale, apex.navigation, apex.page, apex.message, apex.server, apex.env, apex.debug, apex.actions, apex.jQuery );
