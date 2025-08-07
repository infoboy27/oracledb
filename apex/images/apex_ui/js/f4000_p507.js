/*!
 * Copyright (c) 2022, 2023, Oracle and/or its affiliates.
 */

/* global Prism */

/**
 * @fileOverview
 * This file contains JS utilities for previewing an application service worker
 **/

window.sw = (function ($, items, lang) {
    "use strict";

    let sw = {};
    sw.preview = {};
    sw.preview.functions = {};
    sw.preview.install = {};
    sw.preview.activate = {};
    sw.preview.fetch = {};
    sw.preview.sync = {};
    sw.preview.push = {};
    sw.preview.notificationclick = {};
    sw.preview.notificationclose = {};
    sw.preview.canmakepayment = {};
    sw.preview.paymentrequest = {};

    sw.preview.functions.hooks = () => {
        const selector = "#PreviewFunctions code";
        $(selector).text(`let apex = {};
apex.sw = {};
apex.sw.CORE_CACHE_MATCHER = '#APEX_FILES#';
apex.sw.CORE_CACHE_PREFIX = "APEX-CORE-";
apex.sw.CORE_CACHE_NAME = apex.sw.CORE_CACHE_PREFIX + '#APEX_VERSION#';

apex.sw.APP_CACHE_MATCHER = "&FB_FLOW_ID./files/static/v";
apex.sw.APP_CACHE_PREFIX = "APEX-APP-&FB_FLOW_ID.-v";

apex.sw.appCacheNeedsCleanup = true;

apex.sw.cleanAPEXCaches = () => {
  caches.keys().then(cacheNames => Promise.all(
    cacheNames.map(cacheName => {
      if (cacheName.startsWith(apex.sw.CORE_CACHE_PREFIX) && cacheName !== apex.sw.CORE_CACHE_NAME) {
        return caches.delete(cacheName);
      }
    })
  ));
};

apex.sw.cleanAppCaches = (appCacheName) => {
  if (appCacheNeedsCleanup) {
    appCacheNeedsCleanup = false;
    caches.keys().then(cacheNames => Promise.all(
      cacheNames.map(cacheName => {
        if (cacheName.startsWith(apex.sw.APP_CACHE_PREFIX) && cacheName !== appCacheName) {
          return caches.delete(cacheName);
        }
      })
    ));
  }
};

// ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.STARTS", $("#P507_SW_FUNCTION_VARIABLE_LABEL").text())}
${items.P507_SW_FUNCTION_VARIABLE.value}
// ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.ENDS", $("#P507_SW_FUNCTION_VARIABLE_LABEL").text())}
`);
        Prism.highlightElement(document.querySelector(selector));
    };

    sw.preview.install.hooks = () => {
        const selector = "#PreviewInstallEvent code";
        $(selector).text(`self.addEventListener("install", (event) => {
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.STARTS", $("#P507_SW_INSTALL_BEFORE_LABEL").text())}
  ${items.P507_SW_INSTALL_BEFORE.value}
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.ENDS", $("#P507_SW_INSTALL_BEFORE_LABEL").text())}

  self.skipWaiting();

  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.STARTS", $("#P507_SW_INSTALL_AFTER_LABEL").text())}
  ${items.P507_SW_INSTALL_AFTER.value}
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.ENDS", $("#P507_SW_INSTALL_AFTER_LABEL").text())}
});`);
        Prism.highlightElement(document.querySelector(selector));
    };

    sw.preview.install.custom = () => {
        const selector = "#PreviewInstallEvent code";
        $(selector).text(`self.addEventListener("install", (event) => {
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.STARTS", $("#P507_SW_INSTALL_LABEL").text())}
  ${items.P507_SW_INSTALL.value}
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.ENDS", $("#P507_SW_INSTALL_LABEL").text())}
});`);
        Prism.highlightElement(document.querySelector(selector));
    };

    sw.preview.activate.hooks = () => {
        const selector = "#PreviewActivateEvent code";
        $(selector).text(`self.addEventListener("activate", (event) => {
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.STARTS", $("#P507_SW_ACTIVATE_BEFORE_LABEL").text())}
  ${items.P507_SW_ACTIVATE_BEFORE.value}
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.ENDS", $("#P507_SW_ACTIVATE_BEFORE_LABEL").text())}

  apex.sw.cleanAPEXCaches();

  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.STARTS", $("#P507_SW_ACTIVATE_AFTER_LABEL").text())}
  ${items.P507_SW_ACTIVATE_AFTER.value}
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.ENDS", $("#P507_SW_ACTIVATE_AFTER_LABEL").text())}
});`);
        Prism.highlightElement(document.querySelector(selector));
    };

    sw.preview.activate.custom = () => {
        const selector = "#PreviewActivateEvent code";
        $(selector).text(`self.addEventListener("activate", (event) => {
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.STARTS", $("#P507_SW_ACTIVATE_LABEL").text())}
  ${items.P507_SW_ACTIVATE.value}
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.ENDS", $("#P507_SW_ACTIVATE_LABEL").text())}
});`);
        Prism.highlightElement(document.querySelector(selector));
    };

    sw.preview.fetch.hooks = () => {
        const selector = "#PreviewFetchEvent code";
        $(selector).text(`self.addEventListener("fetch", (event) => {

  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.STARTS", $("#P507_SW_FETCH_BEFORE_LABEL").text())}
  ${items.P507_SW_FETCH_BEFORE.value}
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.ENDS", $("#P507_SW_FETCH_BEFORE_LABEL").text())}

  if ( event.request.method !== "GET" ) { return; }

  event.respondWith(
    (async () => {
      let cacheName;

      if (event.request && event.request.url && event.request.url.indexOf(apex.sw.CORE_CACHE_MATCHER) >= 0) {
        cacheName = apex.sw.CORE_CACHE_NAME;
      } else if (event.request && event.request.url && event.request.url.indexOf(apex.sw.APP_CACHE_MATCHER) >= 0) {
        const fileVersion = event.request.url.split(apex.sw.APP_CACHE_MATCHER).pop().split("/")[0];
        cacheName = apex.sw.APP_CACHE_PREFIX + fileVersion;
        apex.sw.cleanAppCaches(cacheName);
      }

      // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.STARTS", $("#P507_SW_FETCH_CACHE_DEFINITION_LABEL").text())}
      ${items.P507_SW_FETCH_CACHE_DEFINITION.value}
      // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.ENDS", $("#P507_SW_FETCH_CACHE_DEFINITION_LABEL").text())}

      let cache;

      // Try to get from the cache first
      if (cacheName) {
        cache = await caches.open(cacheName);
        const response = await cache.match(event.request);

        // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.STARTS", $("#P507_SW_FETCH_CACHE_RESPONSE_LABEL").text())}
        ${items.P507_SW_FETCH_CACHE_RESPONSE.value}
        // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.ENDS", $("#P507_SW_FETCH_CACHE_RESPONSE_LABEL").text())}

        if (response) {
          return response;
        }
      }
      
      // Then get from network
      try {
        const response = await fetch(event.request);

        // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.STARTS", $("#P507_SW_FETCH_NETWORK_RESP_SUC_LABEL").text())}
        ${items.P507_SW_FETCH_NETWORK_RESP_SUC.value}
        // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.ENDS", $("#P507_SW_FETCH_NETWORK_RESP_SUC_LABEL").text())}

        // Clone response to put in cache
        if (response.ok && cacheName) {
          try {
            const resClone = response.clone();
            cache.put(event.request, resClone);
          } catch (error) {
            console.warn(error);
          }
        }
        
        // Return ressource from network
        return response;
      } catch (error) {

        // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.STARTS", $("#P507_SW_FETCH_NETWORK_RESP_ERR_LABEL").text())}
        ${items.P507_SW_FETCH_NETWORK_RESP_ERR.value}
        // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.ENDS", $("#P507_SW_FETCH_NETWORK_RESP_ERR_LABEL").text())}

        if (event.request.mode === "navigate") {
          const offlinePage = 'APEX.PWA.OFFLINE';
          
          // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.STARTS", $("#P507_SW_FETCH_OFFLINE_PAGE_LABEL").text())}
          ${items.P507_SW_FETCH_OFFLINE_PAGE.value}
          // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.ENDS", $("#P507_SW_FETCH_OFFLINE_PAGE_LABEL").text())}

          return new Response(offlinePage, {
            headers: { "Content-Type": "text/html" }
          });
        } else {
          // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.STARTS", $("#P507_SW_FETCH_NETWORK_FALLBACK_LABEL").text())}
          ${items.P507_SW_FETCH_NETWORK_FALLBACK.value}
          // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.ENDS", $("#P507_SW_FETCH_NETWORK_FALLBACK_LABEL").text())}
          return new Response();
        }
      }
    })()
  );
});`);
        Prism.highlightElement(document.querySelector(selector));
    };

    sw.preview.fetch.custom = () => {
        const selector = "#PreviewFetchEvent code";
        $(selector).text(`self.addEventListener("fetch", (event) => {
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.STARTS", $("#P507_SW_FETCH_LABEL").text())}
  ${items.P507_SW_FETCH.value}
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.ENDS", $("#P507_SW_FETCH_LABEL").text())}
});`);
        Prism.highlightElement(document.querySelector(selector));
    };

    sw.preview.sync.custom = () => {
        const selector = "#PreviewSyncEvent code";
        $(selector).text(`self.addEventListener("sync", (event) => {
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.STARTS", $("#P507_SW_SYNC_LABEL").text())}
  ${items.P507_SW_SYNC.value}
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.ENDS", $("#P507_SW_SYNC_LABEL").text())}
});`);
        Prism.highlightElement(document.querySelector(selector));
    };

    sw.preview.push.hooks = () => {
        const selector = "#PreviewPushEvent code";
        $(selector).text(`self.addEventListener("push", (event) => {
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.STARTS", $("#P507_SW_PUSH_BEFORE_LABEL").text())}
  ${items.P507_SW_PUSH_BEFORE.value}
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.ENDS", $("#P507_SW_PUSH_BEFORE_LABEL").text())}

  const notification = event.data.json();
  self.registration.showNotification( notification.title, notification );

  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.STARTS", $("#P507_SW_PUSH_AFTER_LABEL").text())}
  ${items.P507_SW_PUSH_AFTER.value}
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.ENDS", $("#P507_SW_PUSH_AFTER_LABEL").text())}
});`);
        Prism.highlightElement(document.querySelector(selector));
    };

    sw.preview.push.custom = () => {
        const selector = "#PreviewPushEvent code";
        $(selector).text(`self.addEventListener("push", (event) => {
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.STARTS", $("#P507_SW_PUSH_LABEL").text())}
  ${items.P507_SW_PUSH.value}
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.ENDS", $("#P507_SW_PUSH_LABEL").text())}
});`);
        Prism.highlightElement(document.querySelector(selector));
    };

    sw.preview.notificationclick.hooks = () => {
        const selector = "#PreviewNotificationclickEvent code";
        $(selector).text(`self.addEventListener("notificationclick", (event) => {
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.STARTS", $("#P507_SW_NOTIFICATIONCLICK_BEF_LABEL").text())}
  ${items.P507_SW_NOTIFICATIONCLICK_BEF.value}
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.ENDS", $("#P507_SW_NOTIFICATIONCLICK_BEF_LABEL").text())}

    event.notification.close();
    const baseUrl = location.pathname.replace("/sw.js", "");
    const targetUrl = event.notification?.data?.targetUrl || baseUrl;

    // Get all browser tabs
    event.waitUntil( clients.matchAll( {
      includeUncontrolled: true,
      type: "window"
    } ).then( ( clientList ) => {
      // Loop through browser tabs
      for ( let client of clientList ) {
        // If a tab matches the app, use that to open the notification
        if ( client.url.includes( baseUrl ) && "focus" in client ) {
          return client.navigate( targetUrl ).then( client => client.focus() );
        }
      }
      // If not open a new window
      if ( clients.openWindow ) {
        return clients.openWindow( targetUrl );
      }
    } ) );

  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.STARTS", $("#P507_SW_NOTIFICATIONCLICK_AFT_LABEL").text())}
  ${items.P507_SW_NOTIFICATIONCLICK_AFT.value}
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.ENDS", $("#P507_SW_NOTIFICATIONCLICK_AFT_LABEL").text())}
});`);
        Prism.highlightElement(document.querySelector(selector));
    };

    sw.preview.notificationclick.custom = () => {
        const selector = "#PreviewNotificationclickEvent code";
        $(selector).text(`self.addEventListener("notificationclick", (event) => {
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.STARTS", $("#P507_SW_NOTIFICATIONCLICK_LABEL").text())}
  ${items.P507_SW_NOTIFICATIONCLICK.value}
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.ENDS", $("#P507_SW_NOTIFICATIONCLICK_LABEL").text())}
});`);
        Prism.highlightElement(document.querySelector(selector));
    };

    sw.preview.notificationclose.custom = () => {
        const selector = "#PreviewNotificationcloseEvent code";
        $(selector).text(`self.addEventListener("notificationclose", (event) => {
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.STARTS", $("#P507_SW_NOTIFICATIONCLOSE_LABEL").text())}
  ${items.P507_SW_NOTIFICATIONCLOSE.value}
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.ENDS", $("#P507_SW_NOTIFICATIONCLOSE_LABEL").text())}
});`);
        Prism.highlightElement(document.querySelector(selector));
    };

    sw.preview.canmakepayment.custom = () => {
        const selector = "#PreviewCanmakepaymentEvent code";
        $(selector).text(`self.addEventListener("canmakepayment", (event) => {
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.STARTS", $("#P507_SW_CANMAKEPAYMENT_LABEL").text())}
  ${items.P507_SW_CANMAKEPAYMENT.value}
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.ENDS", $("#P507_SW_CANMAKEPAYMENT_LABEL").text())}
});`);
        Prism.highlightElement(document.querySelector(selector));
    };

    sw.preview.paymentrequest.custom = () => {
        const selector = "#PreviewPaymentrequestEvent code";
        $(selector).text(`self.addEventListener("paymentrequest", (event) => {
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.STARTS", $("#P507_SW_PAYMENTREQUEST_LABEL").text())}
  ${items.P507_SW_PAYMENTREQUEST.value}
  // ${lang.formatMessage("PWA.SW.PREVIEW.HOOK.ENDS", $("#P507_SW_PAYMENTREQUEST_LABEL").text())}
});`);
        Prism.highlightElement(document.querySelector(selector));
    };

    return sw;

})($, apex.items, apex.lang);