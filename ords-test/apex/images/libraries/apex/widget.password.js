/*!
 Copyright (c) 2024, Oracle and/or its affiliates.
*/
/*
 * Password mask button for password items in Oracle APEX.
 */
(function( widget, $, lang ) {
  'use strict';

  /** 
    * expected markup:
    * <button type="button" aria-label="Show Password" title="Show Password">
    *   <span class="icon" aria-hidden="true" />
    * </button>
    *
    * This button is injected in all password items as long as the "Hide Password Visibility"
    * template option is not checked.
    *
    * If readonly attribute is present, the button remains visible and functional but the password input gets
    * a particular style and you can't enter any more text.
    *
    * If the item is disabled, the button is present but not visible and inactive.
    * 
    * @param {Object} classes - The CSS classes that will be applied to the button depending on where the widget is being invoked.
    * @param {function(input,wrapper,button)|undefined} maskPlacement - Callback function that will place the button in the DOM.
   */
  widget.passwordMask = function ( classes, maskPlacement ) {

    const message = {
      showPassword: lang.getMessage( 'APEX.PASSWORD.SHOW_PASSWORD' ),
      hidePassword: lang.getMessage( 'APEX.PASSWORD.HIDE_PASSWORD' ),
    };
  
    const selector = {
      class: {
        isDisabled: 'is-disabled',
        apexDisabled: 'apex_disabled',
        readonly: 'apex-item-password-readonly',
      }
    };
  
    /**
     * Reveals the password written in the input field
     * @param {HTMLInputElement} input 
     * @param {HTMLButtonElement} button 
     * @param {HTMLSpanElement} icon 
     */
    function showPassword( input, button, icon ) {
      // Change the input type to a text input
      input.type = 'text';
  
      // Update the accessibility attributes
      button.setAttribute( 'aria-label', message.hidePassword );
      button.setAttribute( 'title', message.hidePassword );
  
      toggleIcon( icon );
    }
  
    /**
     * Conceals the password written in the input field
     * @param {HTMLInputElement} input 
     * @param {HTMLButtonElement} button 
     * @param {HTMLSpanElement} icon 
     */
    function hidePassword( input, button, icon ) {
      // Change the input type to a password input
      input.type = 'password';
  
      // Update the accessibility attributes
      button.setAttribute( 'aria-label', message.showPassword );
      button.setAttribute( 'title', message.showPassword );
  
      toggleIcon( icon );
    }
  
    /**
     * Toggles the icon's CSS classes
     * @param {HTMLSpanElement} icon 
     */
    function toggleIcon( icon ) {
      icon.classList.toggle( classes.hideIcon );
      icon.classList.toggle( classes.showIcon );
    }


    $( '.apex-item-password' ).each( function() {
      const passwordInput = this;

      // Only apply the password mask if template option is not found
      if ( !( passwordInput.closest('.js-hidePasswordVisibility') ) ) {

        const button = document.createElement( 'button' );
        const icon = document.createElement( 'span' );

        button.classList.add( ...classes.button );
        button.setAttribute( 'type', 'button' );
        button.setAttribute( 'aria-label', message.showPassword );
        button.setAttribute( 'title', message.showPassword );

        icon.classList.add( ...classes.icon, classes.hideIcon );
        icon.setAttribute( 'aria-hidden', 'true' );

        button.append( icon );

        // Making sure that all the required values are set in case the field
        // was meant to be disabled on load.
        if ( passwordInput.disabled ||
             passwordInput.classList.contains( selector.class.apexDisabled ) ||
             passwordInput.classList.contains( selector.class.isDisabled ) ) {
          passwordInput.disabled = true;
          passwordInput.classList.add( selector.class.apexDisabled, selector.class.isDisabled );
        } else {
          button.addEventListener( 'click', () => {
            // If the current input type is text, then the password is currently show
            // and we want to hide it.
            switch ( passwordInput.type ) {
              case 'text':
                hidePassword( passwordInput, button, icon );
                break;
              case 'password':
                showPassword( passwordInput, button, icon );
                break;
            }
          } );
        }

        if ( passwordInput.readOnly ) {
          passwordInput.classList.add( selector.class.readonly );
        }

        const wrapper = document.createElement( 'div' );
        wrapper.addEventListener( 'focusout', function( event ) {
          if ( !this.contains( event.relatedTarget ) ) {
            if ( passwordInput && passwordInput.type === 'text' ) {
              hidePassword( passwordInput, button, icon );
            }
          }
        } );
        wrapper.classList.add( 'apex-item-group', 'apex-item-group--password' );
        
        if ( typeof maskPlacement === 'function' ) {
          maskPlacement( passwordInput, wrapper, button );
        } else {
          // Default placement behaviour.
          passwordInput.parentNode.append( wrapper );
          wrapper.append( passwordInput );
          wrapper.append( button );
        }
      }
    } );
  };

})( apex.widget, apex.jQuery, apex.lang );
