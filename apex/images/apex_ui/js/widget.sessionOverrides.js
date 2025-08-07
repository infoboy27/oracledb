/*!
 Copyright (c) 2021, 2024, Oracle and/or its affiliates.
*/
(function ($, lang, server, debug, env, util) {
    'use strict';
    const idSessionOverridesPE = 'SessionOverridesPE';
    const idSessionOverridesEnabled = 'SessionOverridesEnabled';
    const classSessionOverridesSwitch = 'a-SessionOverrides-switch';
    const classSessionOverridesValue = 'a-SessionOverrides-value';

    let sessionOverridesDialog;
    let waitPopup;
    let builderSessionId;

    const getTimezoneOffset = () => {
        const tzOffset = new Date().getTimezoneOffset();
        const sign = Math.sign(tzOffset) > 0 ? "-" : "+";
        const hours = String(parseInt(Math.abs(tzOffset) / 60, 10)).padStart(2, '0');
        const minutes = String(Math.abs(tzOffset) % 60).padStart(2, '0');
        return `${sign}${hours}:${minutes}`;
    };

    const loadFiles = files => {
        for (const file of files) {
            if (file.endsWith('.css') && $(`link[href*='${file}']`).length === 0) {
                $(document.createElement('link')).attr({
                    rel: 'stylesheet',
                    type: 'text/css',
                    href: env.APEX_FILES + file,
                }).appendTo('head');
            }

            if (file.endsWith('.js') && $(`script[src*='${file}']`).length === 0) {
                $(document.createElement('script')).attr({
                    src: env.APEX_FILES + file,
                }).appendTo('head');
            }
        }
    };

    /**
     * Fetch the session overrides values from the database
     * This is used to refresh the data when toggling the dialog
     */
    const fetchSessionOverrides = async () => {
        try {
            return await server.process('developerToolbar', {
                p_flow_id: 4000,
                p_flow_step_id: 0,
                p_instance: builderSessionId,
                x01: 'getSessionOverrides',
                x02: env.APP_ID,
                x07: apex.env.APP_SESSION,
                x08: $(apex.gPageContext$).find("html").attr('lang'),
                x09: getTimezoneOffset()
            });
        } catch (error) {
            debug(error);
            apex.devToolbar.notification(sessionOverridesDialog, lang.getMessage("DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_LOAD"), 'danger');
        }
    };

    /**
     * Apply the session overrides values to the property editor
     * in a format that the property editor understands
     */
    const refreshSessionOverrides = async (sessionOverridesData) => {
        try {
            const propertySet = sessionOverridesData.groups.map(group => {
                const properties = group.props.map(prop => ({
                    propertyName: prop.id,
                    value: '',
                    errors: [],
                    warnings: [],
                    metaData: {
                        type: prop.type,
                        prompt: prop.name,
                        promptContainsHtml: true,
                        entries: prop.entries,
                    },
                }));

                return {
                    displayGroupId: group.id,
                    displayGroupTitle: group.name,
                    properties,
                };
            });

            // Apply the session overrides properties to the property editor
            sessionOverridesDialog.find(`#${idSessionOverridesPE}`).propertyEditor();
            sessionOverridesDialog.find(`#${idSessionOverridesPE}`).propertyEditor('option', 'data', {
                propertySet,
            });

            // Apply the session overrides special global switch
            sessionOverridesDialog.find(`#${idSessionOverridesEnabled}`).prop('checked', sessionOverridesData.enabled);

            // Apply the session overrides other attributes (switch, default, placeholder)
            for (const group of sessionOverridesData.groups) {
                for (const prop of group.props) {
                    if (prop.switch) {
                        sessionOverridesDialog.find(`.${classSessionOverridesSwitch}[data-property-id="${util.escapeHTMLAttr(prop.id)}"]`).prop('checked', prop.switch);
                    }

                    const propValue$ = sessionOverridesDialog.find(`.${classSessionOverridesValue}[data-property-id="${util.escapeHTMLAttr(prop.id)}"]`);

                    if (prop.default) {
                        propValue$.data('default', prop.default);
                    }

                    if (prop.default && !prop.value) {
                        propValue$.val(prop.default);
                    }

                    if (prop.value) {
                        propValue$.val(prop.value);
                    }

                    if (prop.placeholder) {
                        propValue$.attr('placeholder', prop.placeholder);
                    }
                }
            }
        } catch (error) {
            debug(error);
            apex.devToolbar.notification(sessionOverridesDialog, lang.getMessage("DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_LOAD"), 'danger');
        }
    };

    const addPropertyTypes = (types) => {

        // Add property type for text in property editor
        $.apex.propertyEditor.addPropertyType(types.session_overrides_text, {
            render(out, id, prop) {
                out.markup(`
                    <div class="a-Property-fieldContainer">
                    <label class="a-Switch">
                        <input type="checkbox" role="switch" id="${util.escapeHTMLAttr(id)}_switch" class="${classSessionOverridesSwitch}" data-property-id="${util.escapeHTMLAttr(prop.propertyName)}" value="Y" aria-labelledby="${util.escapeHTMLAttr(id)}_label">
                        <span class="a-Switch-toggle"></span>
                    </label>
                    <input id="${util.escapeHTMLAttr(id)}" type="text" value="${util.escapeHTMLAttr(prop.value)}" class="${classSessionOverridesValue} a-Property-field a-Property-field--text margin-left-sm" maxlength="4000" data-property-id="${util.escapeHTMLAttr(prop.propertyName)}">
                    </div>`);
            },
        });

        // Add property type for textarea in property editor
        $.apex.propertyEditor.addPropertyType(types.session_overrides_textarea, {
            render(out, id, prop) {
                out.markup(`
                    <div class="a-Property-fieldContainer">
                    <label class="a-Switch">
                        <input type="checkbox" role="switch" id="${util.escapeHTMLAttr(id)}_switch" class="${classSessionOverridesSwitch}" data-property-id="${util.escapeHTMLAttr(prop.propertyName)}" value="Y"  aria-labelledby="${util.escapeHTMLAttr(id)}_label">
                        <span class="a-Switch-toggle"></span>
                    </label>
                    <textarea id="${util.escapeHTMLAttr(id)}" class="${classSessionOverridesValue} a-Property-field a-Property-field--text margin-left-sm" maxlength="4000" data-property-id="${util.escapeHTMLAttr(prop.propertyName)}">${prop.value}</textarea>
                    </div>`);
            },
        });

        // Add property type for select in property editor
        $.apex.propertyEditor.addPropertyType(types.session_overrides_select, {
            render(out, id, prop) {
                let entries = '';

                if (prop.metaData.entries) {
                    entries = prop.metaData.entries.map(entry => `<option value="${util.escapeHTMLAttr(entry.r)}">${util.escapeHTML(entry.d)}</option>`).join("");
                }

                out.markup(`
                    <div class="a-Property-fieldContainer">
                    <label class="a-Switch">
                        <input type="checkbox" role="switch" id="${util.escapeHTMLAttr(id)}_switch" class="${classSessionOverridesSwitch}" data-property-id="${util.escapeHTMLAttr(prop.propertyName)}" value="Y" aria-labelledby="${util.escapeHTMLAttr(id)}_label">
                        <span class="a-Switch-toggle"></span>
                    </label>
                    <select id="${util.escapeHTMLAttr(id)}" size="1" class="${classSessionOverridesValue} a-Property-field a-Property-field--select margin-left-sm" data-property-id="${util.escapeHTMLAttr(prop.propertyName)}">
                        ${entries}
                    </select>
                    </div>`);
            },
        });
    };

    // Widget factory
    $.widget('apex.sessionOverrides', {
        _create() {

            builderSessionId = this.options.builderSessionId;

            loadFiles([
                'apex_ui/js/widget.propertyEditor.js',
                'apex_ui/css/DevTools.css',
            ]);

            (async () => {
                // Load all DEVELOPER_TOOLBAR_ messages first
                // We will load unnecessary messages but it will be useful
                // to avoid pinging the server many times
                await lang.loadMessages(["DEVELOPER_TOOLBAR%"]);

                sessionOverridesDialog = $('<div id="SessionOverridesDialog"></div>');
                waitPopup = apex.widget.waitPopup();

                this.element.append(sessionOverridesDialog);

                sessionOverridesDialog.append(`
                <div class="${idSessionOverridesEnabled}Container">
                    <div class="a-Property">
                        <div class="a-Property-labelContainer" style="flex-grow: 1;">
                            <span id="${idSessionOverridesEnabled}-label" class="a-Property-label">${lang.getMessage("DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ENABLE")}</span>
                        </div>
                        <div class="a-Property-fieldContainer" style="width: auto;">
                            <label for="${idSessionOverridesEnabled}" class="a-Switch" aria-labelledby="${idSessionOverridesEnabled}-label">
                                <input type="checkbox" role="switch" id="${idSessionOverridesEnabled}" class="${classSessionOverridesSwitch}" value="Y">
                                <span class="a-Switch-toggle"></span>
                            </label>
                        </div>
                    </div>
                </div>
                <div id="${idSessionOverridesPE}"></div>`);

                let sessionOverridesData = await fetchSessionOverrides();

                addPropertyTypes(sessionOverridesData.types);

                sessionOverridesDialog.dialog({
                    autoOpen: true,
                    title: lang.getMessage('DEVELOPER_TOOLBAR_SESSION_OVERRIDES'),
                    dialogClass: 'a-DevTools',
                    resizable: true,
                    draggable: true,
                    width: 500,
                    height: 650,
                    closeOnEscape: true,
                    open() {
                        apex.navigation.beginFreezeScroll();

                        if (waitPopup) {
                            waitPopup.remove();
                            waitPopup = null;
                        }

                        refreshSessionOverrides(sessionOverridesData);
                    },
                    close() {
                        apex.navigation.endFreezeScroll();
                        const SEL_DT_QUICKEDIT = "#apexDevToolbarQuickEdit";
                        const SEL_DT_CUSTOMIZE = '#apexDevCustomize';
                        const C_DISABLED = "is-disabled";
                        $(SEL_DT_QUICKEDIT).add(SEL_DT_CUSTOMIZE).removeClass(C_DISABLED).removeAttr("aria-disabled");
                    },
                    buttons: [
                        {
                            id: 'SessionOverridesReset',
                            text: lang.getMessage('UTR.RESET'),
                            class: 'a-Button a-DevTools-toolbar-item a-DevTools-toolbar-item--left a-DevTools-toolbar-button',
                            click() {
                                sessionOverridesDialog.find(`#${idSessionOverridesEnabled}`).prop('checked', false);

                                for (const group of sessionOverridesData.groups) {
                                    for (const prop of group.props) {
                                        sessionOverridesDialog.find(`.${classSessionOverridesSwitch}[data-property-id="${util.escapeHTMLAttr(prop.id)}"]`).prop('checked', false);
                                        sessionOverridesDialog.find(`.${classSessionOverridesValue}[data-property-id="${util.escapeHTMLAttr(prop.id)}"]`).val('');
                                    }
                                }
                            },
                        },
                        {
                            id: 'SessionOverridesClose',
                            text: lang.getMessage('APEX.DIALOG.CANCEL'),
                            class: 'a-Button a-DevTools-toolbar-item a-DevTools-toolbar-button a-DevTools-toolbar-item--push',
                            click() {
                                sessionOverridesDialog.dialog('close');
                            },
                        },
                        {
                            id: 'SessionOverridesSave',
                            text: lang.getMessage('APEX.DIALOG.SAVE'),
                            class: 'a-Button a-Button--hot a-DevTools-toolbar-item a-DevTools-toolbar-button',
                            click() {
                                const f01 = []; // property ids
                                const f02 = []; // switch values
                                const f03 = []; // input values

                                for (const group of sessionOverridesData.groups) {
                                    for (const prop of group.props) {
                                        f01.push(prop.id);
                                        f02.push(String(sessionOverridesDialog.find(`.${classSessionOverridesSwitch}[data-property-id="${util.escapeHTMLAttr(prop.id)}"]`).prop('checked')));
                                        f03.push(sessionOverridesDialog.find(`.${classSessionOverridesValue}[data-property-id="${util.escapeHTMLAttr(prop.id)}"]`).val() || '');
                                    }
                                }

                                server.process('developerToolbar',
                                    {
                                        p_flow_id: 4000,
                                        p_flow_step_id: 0,
                                        p_instance: builderSessionId,
                                        x01: 'setSessionOverrides',
                                        x02: env.APP_ID,
                                        x06: String(sessionOverridesDialog.find(`#${idSessionOverridesEnabled}`).prop('checked')),
                                        x07: apex.env.APP_SESSION,
                                        x08: $(apex.gPageContext$).find("html").attr('lang'),
                                        x09: getTimezoneOffset(),
                                        f01,
                                        f02,
                                        f03,
                                    }, {
                                    success() {
                                        apex.widget.waitPopup();
                                        location.reload();
                                    },
                                    error(data) {
                                        debug(data);
                                        apex.devToolbar.notification(sessionOverridesDialog, lang.getMessage("DEVELOPER_TOOLBAR_SESSION_OVERRIDES_ERROR_SAVE"), 'danger');
                                    },
                                });
                            },
                        },
                    ],
                });

                sessionOverridesDialog.on('click', `.${classSessionOverridesSwitch}[data-property-id]`, () => {
                    // Turn on the master switch if one switch is on
                    if (sessionOverridesDialog.find(`.${classSessionOverridesSwitch}[data-property-id]:checked`).length > 0 && 
                        !sessionOverridesDialog.find(`#${idSessionOverridesEnabled}`).prop('checked')) {
                        sessionOverridesDialog.find(`#${idSessionOverridesEnabled}`).prop('checked', true);
                    }

                    // Turn off the master switch if all switches are off
                    if (sessionOverridesDialog.find(`.${classSessionOverridesSwitch}[data-property-id]:checked`).length === 0 &&
                        sessionOverridesDialog.find(`#${idSessionOverridesEnabled}`).prop('checked')) {
                        sessionOverridesDialog.find(`#${idSessionOverridesEnabled}`).prop('checked', false);
                    }
                });
            })();
        },
        toggle: async function () {
            if (sessionOverridesDialog.dialog('isOpen')) {
                sessionOverridesDialog.dialog('close');
            } else {
                sessionOverridesDialog.dialog('open');
            }
        }
    });
})(apex.jQuery, apex.lang, apex.server, apex.debug, apex.env, apex.util);
