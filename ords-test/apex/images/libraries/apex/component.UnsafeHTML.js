/*!
 * Copyright (c) 2023, Oracle and/or its affiliates.
 */

/**
 *  A web-component wrapper of possibly unsafe HTML.
 *  This component will first read its content, unescape it,
 *  pass it through DOMPurify, and reapply it.
 *
 *  Example
 *  The malicious content: <p>test<script>alert("XSS");</script></p>
 *
 *  when escaped and wrapped into an a-unsafe-html element as so:
 *      <a-unsafe-html aria-hidden="true">
 *          &lt;p&gt;test&lt;script&gt;alert(&quot;XSS&quot;);&lt;&#x2F;script&gt;&lt;&#x2F;p&gt;
 *      </a-unsafe-html>
 *
 *  will become:
 *     <a-unsafe-html class="is-processed">
 *          <p>test</p>
 *     </a-unsafe-html>
 *
 *  Notes:
 *      - Escaping the initial value is the responsibility of the server.
 *      - After the initial conversion, no further processing will be done.
 *      - The default DOMPurify settings are used. Consider how devs can configure this.
 *      - During rendering, the escaped content is hidden via CSS.
 *      - When Element.setHTML becomes widely available, we should move over from DOMPurify
 *          https://developer.mozilla.org/en-US/docs/Web/API/Element/setHTML
 */

( function( util ) {
    "use strict";

    if ( !window.DOMPurify ) {
        throw new Error( "DOMPurify is required by a-unsafe-content" );
    }

    class UnsafeHTML extends apex.WebComponent {

        constructor() {
            super();
        }

        _render() {
            if ( this.rendered ) {
                return;
            }

            this.innerHTML = util.sanitizeHtml( util.unescapeHTML( this.innerHTML ) );

            this.classList.add( "is-processed" );
            this.removeAttribute( "aria-hidden" );
        }
    }

    customElements.define( "a-unsafe-html", UnsafeHTML );

} )( apex.util );