/*!
 * Copyright (c) 2023, Oracle and/or its affiliates.
 */

/**
 * Main controller file of the tree(s) ( workflow and used shared components ) in the Worklow Designer page ( p9600 ).
 * It contains the configuration of the available nodes ( and their supported actions ), the context menu configuration and
 * observers on the model changes.
 * It's already using the new designerTree widget ( see more about it in f4000.tree.js ).
 *
 */

/* eslint quotes: ["error", "double"] */
/* eslint no-var: "error" */
/* eslint semi: "error" */

/**
 *
 * Known issues:
 * - bug: at the links drag-n-drop the auto-multiselection ( select the link in the from and to ) cause an error ( should we just drop the multiselection )
 *
 */
( function( model, debug, lang, $, pd, message ) {
    "use strict";

    // workflow tree node types
    const TYPE = {
        WORKFLOWS: "workflows",
        WORKFLOW: "workflow",
        WF_PARAMS: "workflow_params",
        WF_PARAM: "workflow_param",
        WF_VERSION: "workflow_version",
        WF_ACTIVITIES: "workflow_activities",
        WF_ACTIVITY: "workflow_activity",
        WF_ACTIVITY_VARS: "workflow_activity_vars",
        WF_ACTIVITY_VAR: "workflow_activity_var",
        WF_TRANSITIONS: "workflow_transitions",
        WF_TRANSITION: "workflow_transition",
        WF_BRANCHES: "workflow_branches",
        WF_BRANCH: "workflow_branch",
        WF_INCOMING_LINKS: "workflow_incoming_links",
        WF_INCOMING_LINK: "workflow_incoming_link",
        WF_OUTGOING_LINKS: "workflow_outgoing_links",
        WF_OUTGOING_LINK: "workflow_outgoing_link",
        WF_PARTICIPANTS: "workflow_participants",
        WF_PARTICIPANT: "workflow_participant",
        WF_VARS: "workflow_variables",
        WF_VAR: "workflow_variable",
        WF_TASK_PARAMS: "workflow_task_params",
        WF_TASK_PARAM: "workflow_task_param",
        WF_API_PARAMS: "workflow_api_params",
        WF_API_PARAM: "workflow_api_param",
        WF_API_WS_PARAMS: "workflow_api_ws_params",
        WF_API_WS_PARAM: "workflow_api_ws_param",
        WF_INVOKE_WF_PARAMS: "workflow_invoke_wf_params",
        WF_INVOKE_WF_PARAM: "workflow_invoke_wf_param",
    };

    const STATE_DEV = "DEVELOPMENT";
    const STATE_ACTIVE = "ACTIVE";
    const STATE_INACTIVE = "INACTIVE";

    const SWITCH = "NATIVE_WORKFLOW_SWITCH";
    const WF_END = "NATIVE_WORKFLOW_END";
    const INVOKE_API = "NATIVE_INVOKE_API";

    const SHARED_COMP_TYPES = [
        {
            typeId: model.COMP_TYPE.BUILD_OPTION,
            type:   "build_option"
        }, {
            typeId: model.COMP_TYPE.EMAIL_TEMPLATE,
            type:   "email_template"
        }, {
            typeId: model.COMP_TYPE.WS_REF,
            type:   "web_service"
        }, {
            typeId: model.COMP_TYPE.TASK_DEFINITION,
            type:   "task_definition"
        }
    ];

    pd.WF_TREE_NODE_TYPE = TYPE;

    function msg( pKey, isTree = true ) {
        return isTree ? lang.getMessage( "PD.TREE." + pKey ) : pd.msg( pKey );
    } // msg

    function formatNoEscape( pKey ) {
        let pattern = msg( pKey ),
            args = [ pattern ].concat( Array.prototype.slice.call( arguments, 1 ) );
        return lang.formatNoEscape.apply( this, args );
    }

    /**
     *
     *
     * @param {object}  pTree$ the tree dom element
     * @returns {array} returns all tree context menu entries ( with their configuration )
     */
    function getContextMenuEntries( pTree$ ) {

        function syncParamsVisible() {
            let invokeApiType;
            let wfActivity = pTree$.designerTree( "getNearestComponent", model.COMP_TYPE.WORKFLOW_ACTIVITY, this[ 0 ] );
            if ( !wfActivity || wfActivity.typeId !== model.COMP_TYPE.WORKFLOW_ACTIVITY || ![ TYPE.WF_API_PARAMS, TYPE.WF_API_WS_PARAMS ].includes( this[ 0 ].type )) {
                return;
            }
            let processType = wfActivity.getProperty( model.PROP.PAGE_PROCESS_TYPE ).getValue();
            // Show "Synchronize Parameters" if it's the "Invoke API" process, but not if the
            // "Type" is "REST Source"
            if ( processType === INVOKE_API ) {
                invokeApiType = wfActivity.getProperty( model.getPluginProperty( wfActivity.typeId, INVOKE_API, 1 ).id ).getValue();
                return invokeApiType !== "WEB_SOURCE";
            }
            return false;
        }

        return [
            {
                label: msg( "WF.ACTIVATE", false ),
                action: function() {
                    let component = pTree$.designerTree( "getComponent", this[ 0 ] );
                    let state = component.getProperty( model.PROP.STATE );

                    pd.validateVersionStateChange( component, STATE_ACTIVE, function(){
                        let message = model.transaction.message( {
                            action:     model.MESSAGE_ACTION.CHANGE,
                            component:  component,
                            property:   state
                        } );
                        let transaction = model.transaction.start( "", message );
                        state.setValue( STATE_ACTIVE );
                        apex.commandHistory.execute( transaction );
                        $( "div.a-Property", $( `input[data-property-id="${ state.id }"]` ) ).trigger( "change" );
                        $( document ).trigger( "selectionChanged", [ pTree$[0].id, pTree$.designerTree( "getSelectedComponents" ) ] );
                    } );
                },
                visible: function() {
                    let component = pTree$.designerTree( "getComponent", this[ 0 ] );
                    return pTree$.designerTree( "isCreatable", this, [ TYPE.WF_VERSION ] ) && component.getProperty( model.PROP.STATE ).getValue() === STATE_DEV;
                }
            }, {
                label: msg( "WF.DEACTIVATE", false ),
                action: function() {
                    let component = pTree$.designerTree( "getComponent", this[ 0 ] );
                    let state = component.getProperty( model.PROP.STATE );

                    pd.validateVersionStateChange( component, STATE_INACTIVE, function() {
                        let message = model.transaction.message( {
                            action:     model.MESSAGE_ACTION.CHANGE,
                            component:  component,
                            property:   state
                        } );
                        let transaction = model.transaction.start( "", message );
                        state.setValue( STATE_INACTIVE );
                        apex.commandHistory.execute( transaction );
                        $( "div.a-Property", $(`input[data-property-id="${ state.id }"]`) ).trigger( "change" );
                        $( document ).trigger( "selectionChanged", [ pTree$[0].id, pTree$.designerTree( "getSelectedComponents" ) ] );
                    } );
                },
                visible: function() {
                    let component = pTree$.designerTree( "getComponent", this[ 0 ] );
                    return pTree$.designerTree( "isCreatable", this, [ TYPE.WF_VERSION ] ) && component.getProperty( model.PROP.STATE ).getValue() === STATE_ACTIVE;
                }
            }, {
                type: "separator",
                visible: function() {
                    let component = pTree$.designerTree( "getComponent", this[ 0 ] );
                    return pTree$.designerTree( "isCreatable", this, [ TYPE.WF_VERSION ] ) && [STATE_ACTIVE, STATE_DEV].includes( component.getProperty( model.PROP.STATE ).getValue() );
                }
            }, {
                typeId: model.COMP_TYPE.WORKFLOW,
                visible: function() {
                    return pTree$.designerTree( "isCreatable", this, [ TYPE.WORKFLOWS ] );
                }
            }, {
                typeId: model.COMP_TYPE.WORKFLOW_VERSION,
                visible: function() {
                    return pTree$.designerTree( "isCreatable", this, [ TYPE.WORKFLOW ] );
                }
            }, {
                typeId: model.COMP_TYPE.WORKFLOW_PARAM,
                visible: function() {
                    return pTree$.designerTree( "isCreatable", this, [ TYPE.WORKFLOW, TYPE.WF_PARAMS ] );
                }
            }, {
                typeId: model.COMP_TYPE.WORKFLOW_ACTIVITY,
                visible: function() {
                    if ( pTree$.designerTree( "isCreatable", this, [ TYPE.WF_VERSION, TYPE.WF_ACTIVITIES ] ) ) {
                        return isNodeInDevelopment( this[ 0 ].type === TYPE.WF_VERSION ? this[ 0 ] : this[ 0 ]._parent );
                    }
                    return false;
                }
            }, {
                typeId: model.COMP_TYPE.WORKFLOW_VARIABLE,
                visible: function() {
                    return ( pTree$.designerTree( "isCreatable", this, [ TYPE.WF_VERSION, TYPE.WF_VARS ] ) && isNodeInDevelopment( this[ 0 ].type === TYPE.WF_VERSION ? this[ 0 ] : this[ 0 ]._parent ) );
                }
            }, {
                typeId: model.COMP_TYPE.WORKFLOW_PARTICIP,
                visible: function() {
                    return ( pTree$.designerTree( "isCreatable", this, [ TYPE.WF_VERSION, TYPE.WF_PARTICIPANTS ] ) && !isNodeInactive( this[ 0 ].type === TYPE.WF_VERSION ? this[ 0 ] : this[ 0 ]._parent ) );
                }
            }, {
                label: msg( "WF.CREATE_ACTIVITY_BELOW", false ),
                action: function() {
                    pTree$.designerTree( "createComponent", this[ 0 ], model.COMP_TYPE.WORKFLOW_ACTIVITY, "BELOW" );
                },
                visible: function() {
                    return ( pTree$.designerTree( "isCreatable", this, [ TYPE.WF_ACTIVITY ] ) && isNodeInDevelopment( this[ 0 ] ) );
                }
            }, {
                label: msg( "WF.CREATE_ACTIVITY_AFTER", false ),
                visible: function() {
                    if ( pTree$.designerTree( "isCreatable", this, [ TYPE.WF_ACTIVITY ] ) && !isNodeInDevelopment( this[ 0 ] ) ) {
                        return false;
                    }
                    let component = pTree$.designerTree( "getComponent", this[ 0 ] );
                    let processType = component?.getProperty ? component.getProperty( model.PROP.PAGE_PROCESS_TYPE ) : undefined;
                    return processType ? ![ "NATIVE_WORKFLOW_SWITCH", "NATIVE_WORKFLOW_END"].includes( processType.getValue() ) : false;
                },
                // let's assume we have "A" and "C" activities and we call this function on "A":
                // - create a new activity "B"
                // - update(/ if doesn't exists, create ) the normal transition from "A" to "C" to "A" to "B"
                // - create a new normal transition from "B" to "C"
                // ( it's like an insert into the activity chain )
                action: function() {
                    let componentTransition, componentTransitionTo;
                    let component = pTree$.designerTree( "getComponent", this[ 0 ] );
                    let message = model.transaction.message( {
                        action:     model.MESSAGE_ACTION.CREATE,
                        component:  component,
                        count:      this.length
                    } );
                    let transaction = model.transaction.start( "", message );

                    // create new activity
                    let activity = new model.Component( {
                        typeId:   model.COMP_TYPE.WORKFLOW_ACTIVITY,
                        parentId: component.parentId,
                        previousComponent: component,
                    } );

                    // store the target of the normal transition
                    componentTransition = component.getChilds( model.COMP_TYPE.WORKFLOW_TRANS, { filters: [ {
                        id: model.PROP.TRANSITION_TYPE,
                        value: "NORMAL"
                    } ] } );

                    if ( componentTransition.length ) {
                        componentTransitionTo = componentTransition[ 0 ].getProperty( model.PROP.TO_WORKFLOW_ACTIVITY ).getValue();
                        // set "to" to the new activity
                        componentTransition[ 0 ].getProperty( model.PROP.TO_WORKFLOW_ACTIVITY ).setValue( activity.id, false, false );
                    } else {
                        // if it does not have a normal transition, create one
                        new model.Component( {
                            typeId: model.COMP_TYPE.WORKFLOW_TRANS,
                            parentId: component.id,
                            previousComponent: component,
                            values: [ {
                                id: model.PROP.FROM_WORKFLOW_ACTIVITY,
                                value: component.id
                            }, {
                                id: model.PROP.TO_WORKFLOW_ACTIVITY,
                                value: activity.id
                            } ]
                        } );
                    }

                    // connect the new activity to the current's target
                    if ( componentTransitionTo ) {
                        // if it does not have a normal transition, create one
                        new model.Component( {
                            typeId: model.COMP_TYPE.WORKFLOW_TRANS,
                            parentId: activity.id,
                            previousComponent: activity,
                            values: [ {
                                id: model.PROP.FROM_WORKFLOW_ACTIVITY,
                                value: activity.id
                            }, {
                                id: model.PROP.TO_WORKFLOW_ACTIVITY,
                                value: componentTransitionTo
                            } ]
                        } );
                    }

                    apex.commandHistory.execute( transaction );
                }
            }, {
                typeId: model.COMP_TYPE.WORKFLOW_ACT_VAR,
                visible: function() {
                    return ( pTree$.designerTree( "isCreatable", this, [ TYPE.WF_ACTIVITY_VARS, TYPE.WF_ACTIVITY ] ) && !isNodeInactive( this[ 0 ].type === TYPE.WF_ACTIVITY ? this[ 0 ] : this[ 0 ]._parent ) );
                }
            }, {
                label: msg( "WF.CREATE_CONNECTION", false ),
                visible: function() {
                    let componentNode = this[ 0 ].type === TYPE.WF_ACTIVITY ? this[ 0 ] : this[ 0 ]._parent;
                    if ( !componentNode || !pTree$.designerTree( "isCreatable", this, [ TYPE.WF_OUTGOING_LINKS, TYPE.WF_ACTIVITY ] ) || !isNodeInDevelopment( componentNode ) ) {
                        return false;
                    }
                    let component = pTree$.designerTree( "getComponent", componentNode );
                    let processType = component?.getProperty ? component.getProperty( model.PROP.PAGE_PROCESS_TYPE ) : undefined;
                    return ( processType && processType.getValue() !== WF_END );
                },
                action: function() {
                    let componentNode = this[ 0 ].type === TYPE.WF_ACTIVITY ? this[ 0 ] : this[ 0 ]._parent;
                    let component = pTree$.designerTree( "getComponent", componentNode );
                    let processType = component?.getProperty ? component.getProperty( model.PROP.PAGE_PROCESS_TYPE ) : undefined;
                    if ( processType ) {
                        let connectionType = processType.getValue() === SWITCH ? model.COMP_TYPE.WORKFLOW_BRANCH : model.COMP_TYPE.WORKFLOW_TRANS;
                        pTree$.designerTree( "createComponent", this[ 0 ], connectionType );
                    }
                }
            }, {
                type: "separator",
                visible: syncParamsVisible
            }, {
                label: msg( "SYNCHRONIZE_API_PARAMS" ),
                action: function() {
                    let wfActivity = pTree$.designerTree( "getNearestComponent", model.COMP_TYPE.WORKFLOW_ACTIVITY, this[ 0 ] );
                    let methodProperty = wfActivity.getProperty( model.getPluginProperty( wfActivity.typeId, INVOKE_API, 4 ).id );
                    if ( !methodProperty ) {
                        methodProperty = wfActivity.getProperty( model.getPluginProperty( wfActivity.typeId, INVOKE_API, 5 ).id );
                    }
                    // Trigger a re-validation of the pl/sql method property which will set the _parameters attribute,
                    //  -> which will call the necessary code in pe.callbacks.js to add/remove parameters.
                    let message = model.transaction.message( {
                        action:    model.MESSAGE_ACTION.CHANGE,
                        component: wfActivity,
                        property:  methodProperty
                    } );
                    let transaction = model.transaction.start( "", message );
                    methodProperty.setValue( methodProperty.getValue(), true );
                    apex.commandHistory.execute( transaction );
                },
                visible: syncParamsVisible
            }, {
                type: "separator"
            }, {
                label: msg( "DUPLICATE" ),
                action: function() {
                    pTree$.designerTree( "duplicateNodes", this );
                },
                visible: function() {
                    for ( let i = 0; i < this.length; i++ ) {
                        if ( !pTree$.designerTree( "getNodeAdapter" ).check( "canDuplicate", this[ i ] ) ) {
                            return false;
                        }
                    }

                    let component = pTree$.designerTree( "getComponent", this[ 0 ] );
                    if ( component && component.typeId === model.COMP_TYPE.WORKFLOW_VERSION && model.getComponents( model.COMP_TYPE.WORKFLOW_VERSION, { parentId: component.parentId, properties: [ {
                        id: model.PROP.STATE,
                        value: STATE_DEV
                    } ] } ).length > 1 ) {
                            return false;
                        }
                    return true;
                }
            }, {
                type: "separator",
                visible: function() {
                    for ( let i = 0; i < this.length; i++ ) {
                        if ( !pTree$.designerTree( "getNodeAdapter" ).check( "canDuplicate", this[ i ] ) ) {
                            return false;
                        }
                    }
                    return true;
                }
            }, {
                label: msg( "EXPAND_ALL_BELOW" ),
                action: function() {
                    pTree$.designerTree( "expandAll", pTree$.designerTree( "getSelection" ) );
                },
                visible: function() {
                    return !!this[ 0 ].children?.length;
                }
            }, {
                label: msg( "COLLAPSE_ALL_BELOW" ),
                action: function() {
                    pTree$.designerTree( "collapseAll", pTree$.designerTree( "getSelection" ) );
                },
                visible: function() {
                    return !!this[ 0 ].children?.length;
                }
            }, {
                type: "separator"
            }, {
                label: msg( "DELETE" ),
                accelerator: "Del",
                action: function() {
                    let component, ancestors, versions, node$ = pTree$.designerTree( "getSelection" );
                    if ( this[ 0 ].type === TYPE.WORKFLOW ) {
                        component = getComponent( this[ 0 ] );
                        ancestors = pd.getConnectedWorkflows( component.id );
                        // child workflow can't be deleted
                        if ( ancestors.length > 0 ) {
                            message.alert( pd.msg( "WF.ERROR.CHILD_WORKFLOW" ) , () => {} );
                            return;
                        } else {
                            versions = component.getChildrenUntil( model.COMP_TYPE.WORKFLOW_VERSION );
                            // workflow with non-inactive version(s) requires a user confirmation to be deleted
                            if ( versions.some( v => [ STATE_ACTIVE, STATE_DEV ].includes( v.getProperty( model.PROP.STATE ).getValue() ) ) ) {
                                message.confirm( msg( "WF.ALERT_DELETE_WF_WITH_VERSION", false ), ( ok ) => {
                                    if ( ok ) {
                                        pTree$.designerTree( "deleteNodes", node$ );
                                    }
                                } );
                                return;
                            }
                        }
                    } else if ( this[ 0 ].type === TYPE.WF_VERSION ) {
                        component = getComponent( this[ 0 ] );
                        let state = component.getProperty( model.PROP.STATE ).getValue();
                        // an inactive version requires user confirmation to be deleted
                        if ( state === STATE_INACTIVE ) {
                            message.confirm( msg( "WF.ALERT_DELETE_VERSION", false ), ( ok ) => {
                                if ( ok ) {
                                    pTree$.designerTree( "deleteNodes", node$ );
                                }
                            } );
                            return;
                        } else if ( state === STATE_DEV ) {
                            ancestors = pd.getConnectedWorkflows( component.parentId );
                            if ( ancestors.length > 0 ) {
                                let otherVersions = component.getSiblings();
                                // in a child workflow the last(ie. only) version can't be deleted
                                if ( otherVersions.length === 0 ) {
                                    message.alert( pd.msg( "WF.ERROR.AT_LEAST_ONE_VERSION" ) , () => {} );
                                    return;
                                }
                            }
                        }
                    } else if ( this[ 0 ].type === TYPE.WF_PARAM ) {
                        component = getComponent( this[ 0 ] );
                        let isRequired = component.getProperty( model.PROP.PARAMETER_REQUIRED )?.getValue();
                        let isReferenced = pd.getConnectedWorkflows( component.parentId );
                        if ( isRequired === "Y" && isReferenced?.length > 0 ) {
                            message.confirm( msg( "WF.ALERT_DELETE_PARAM", false ), ( ok ) => {
                                if ( ok ) {
                                    pTree$.designerTree( "deleteNodes", node$ );
                                }
                            } );
                            return;
                        }
                    }

                    pTree$.designerTree( "deleteNodes", node$ );
                },
                visible: function() {
                    for ( let i = 0; i < this.length; i++ ) {
                        let component = pTree$.designerTree( "getComponent", this[ 0 ] );
                        // non-active versions and workflows always can be deleted
                        if (
                            (
                             component.typeId === model.COMP_TYPE.WORKFLOW_VERSION
                             && component.getProperty( model.PROP.STATE ).getValue() === STATE_ACTIVE
                            )
                         || (
                             component.typeId !== model.COMP_TYPE.WORKFLOW
                             && !pTree$.designerTree( "getNodeAdapter" ).allowDelete( this[ i ] )
                            )
                        ) {
                            return false;
                        }
                    }
                    return true;
                }
            }
        ];
    }

    /**
     * checks if a given tree node is under a version with state "IN DEVELOPMENT"
     *
     * @param {object} node a tree node
     * @returns {boolean}
     */
    function isNodeInDevelopment( node ) {
        let component = node && getComponent( node );
        if ( !component ) {
            return false;
        }
        return isVersion( component, STATE_DEV );
    }

    /**
     * checks if a given tree node is under a version with state STATE_INACTIVE
     *
     * @param {object} node a tree node
     * @returns {boolean}
     */
    function isNodeInactive( node ) {
        let component = getComponent( node );
        if ( !component ) {
            return false;
        }
        return isVersion( component, STATE_INACTIVE );
    }

    /**
     * checks if a given tree node is under a version with state STATE_ACTIVE
     *
     * @param {object} node a tree node
     * @returns {boolean}
     */
    function isNodeActive( node ) {
        let component = getComponent( node );
        if ( !component ) {
            return false;
        }
        return isVersion( component, STATE_ACTIVE );
    }

    /**
     * checks if the given component is under a version with the specified state
     *
     * @param {object} component model component
     * @param {string} type      ACTIVE|IN DEVELOPMENT|INACTIVE the state we check for
     * @returns {boolean}
     */
    function isVersion( component, type ) {
        let parent = component;
        while( parent && parent.typeId !== model.COMP_TYPE.WORKFLOW_VERSION ) {
            parent = parent.getParent();
        }
        if ( !parent ) {
            return false;
        }
        return parent.getProperty( model.PROP.STATE ).getValue() === type;
    }

    /**
     * returns the model component the tree node represents
     *
     * @param {object} node tree node
     * @returns {object}
     */
    function getComponent( node ) {
        if ( !node.data || !Object.keys( node.data ).length ) {
            return undefined;
        }
        return model.getComponents( node.data.typeId, { id: node.data.componentId } )[ 0 ];
    }

    /**
     * returns the workflow tree configuration ( ie. which node can be duplicated, deleted, etc. )
     *
     * @returns {object}
     */
    function getTreeRules() {
        return {
            default: {
                operations: {
                    canAdd: false,
                    canDuplicate: false,
                    canDelete: false,
                    canRename: false,
                    canDrag: false,
                    canSearch: false,
                    canExtCreate: false,
                    canExtEdit: false,
                    canExtCopy: false
                }
            },
            [ TYPE.WF_PARAM ]: {
                operations: {
                    canDelete: true,
                    canDuplicate: true
                }
            },
            [ TYPE.WORKFLOW ]: {
                icon: "icon-gears-alt",
                operations: {
                    canDelete: function( node ){
                        let component = getComponent( node );
                        // the workflow can't be deleted, if it is a child of another workflow (i.e. has ancestor(s))
                        let ancestors = pd.getConnectedWorkflows( component.id );
                        if ( ancestors.length > 0 ) {
                            pd.showError( pd.msg( "WF.ERROR.CHILD_WORKFLOW" ) );
                            return false;
                        }
                        return true;
                    },
                    canDuplicate: true
                }
            },
            [ TYPE.WF_VERSION ]: {
                icon: "icon-activity-native-workflow-version",
                operations: {
                    canDelete: function( node ) {
                        let component = getComponent( node );
                        if ( component.getProperty( model.PROP.STATE ) === STATE_DEV ) {
                            let ancestors = pd.getConnectedWorkflows( component.parentId );
                            if ( ancestors.length > 0 ) {
                                let otherVersions = component.getSiblings( false );
                                if ( otherVersions.length === 0 ) {
                                    pd.showError( pd.msg( "WF.ERROR.AT_LEAST_ONE_VERSION" ) );
                                    return false;
                                }
                            }
                        }
                        return !isNodeActive( node );
                    },
                    canDuplicate: function( node ) {
                        return !isNodeInDevelopment( node );
                    }
                },
                validChildren: [ TYPE.WF_VAR, TYPE.WF_ACTIVITY ]
            },
            [ TYPE.WF_VAR ]: {
                operations: {
                    canDelete: isNodeInDevelopment,
                    canDuplicate: isNodeInDevelopment,
                    canAdd: isNodeInDevelopment
                }
            },
            [ TYPE.WF_ACTIVITIES ]: {
                operations: {
                    canAdd: true // Adapter extraCheck will only allow move within same region
                },
                validChildren: [ TYPE.WF_ACTIVITY ]
            },
            [ TYPE.WF_ACTIVITY ]: {
                operations: {
                    canDelete: function( node ) {
                        return isNodeInDevelopment( node );
                    },
                    canDuplicate: function( node ) {
                        return isNodeInDevelopment( node );
                    },
                    canDrag: function( node ) {
                        return !isNodeInactive( node );
                    },
                    drag: {
                        normal: "move"
                    }
                },
                validChildren: [ TYPE.WF_INCOMING_LINKS, TYPE.WF_OUTGOING_LINKS, TYPE.WF_ACTIVITY_VAR ]
            },
            [ TYPE.WF_OUTGOING_LINKS ]: {
                operations: {
                    canAdd: true,
                }
            },
            [ TYPE.WF_BRANCH ]: {
                operations: {
                    canDelete: function( node ) {
                        return isNodeInDevelopment( node );
                    },
                    canDrag: function( node ) {
                        return !isNodeInactive( node );
                    }
                }
            },
            [ TYPE.WF_TRANSITION]: {
                operations: {
                    canDelete: function( node ) {
                        return isNodeInDevelopment( node );
                    },
                    canDrag: function( node ) {
                        let component = getComponent( node );
                        return !isNodeInactive( node ) && component.getProperty( model.PROP.TRANSITION_TYPE ).getValue() === "ERROR";
                    }
                }
            },
            [ TYPE.WF_PARTICIPANT]: {
                operations: {
                    canDelete: function( node ) {
                        return isNodeInDevelopment( node );
                    },
                    canDuplicate: function( node ) {
                        return !isNodeInactive( node );
                    }
                }
            },
            [ TYPE.WF_ACTIVITY_VAR]: {
                operations: {
                    canDelete: true
                }
            },
            "build_options": {
                operations: {
                    canExtCreate: true
                }
            },
            "build_option": {
                icon: "icon-tree-build-option",
                operations: {
                    canExtCreate: true,
                    canExtEdit:   true
                }
            },
            "email_templates": {
            },
            "email_template": {
                icon: "icon-tree-email",
                operations: {
                    canExtEdit: true
                }
            },
            "web_services": {
                operations: {
                    canExtCreate: true
                }
            },
            "web_service": {
                icon: "icon-tree-web-service",
                operations: {
                    canExtCreate: true
                }
            },
            "references": {
            },
            "referenced_by": {
                operations: {
                    canRename: true
                }
            }
        };
    }

    /**
     * creates the tree workflow structure
     *
     * @param {object} headerNode the starting node / root
     */
    function addWorkflow( headerNode/* , options */ ) {

        let addNode = $.apex.designerTree.addNode;

        function addWorkflowComponents( workflowNode, workflow ) {
            function addParams( workflowNode, workflow ) {
                addNode( workflowNode, {
                    header: {
                        type: TYPE.WF_PARAMS,
                        isOpen: true,
                        omitIfEmpty: true,
                    },
                    setFilter: false,
                    component: {
                        type: TYPE.WF_PARAM,
                        typeId: model.COMP_TYPE.WORKFLOW_PARAM,
                        filter: {
                            parentId: workflow.id
                        }
                    }
                } );
            }

            function addVersions( workflowNode, workflow ) {

                function addVersionComponents( versionNode, version ) {

                    function addActivities( versionNode, version ) {

                        function addActivityComponents( activityNode, activity ) {

                            function addActivityVars( activityNode, activity ) {
                                addNode( activityNode, {
                                    header: {
                                        type: TYPE.WF_ACTIVITY_VARS,
                                        isOpen: true,
                                        omitIfEmpty: true,
                                        title: msg( "WF.VARIABLES", false )
                                    },
                                    setFilter: false,
                                    component: {
                                        type: TYPE.WF_ACTIVITY_VAR,
                                        typeId: model.COMP_TYPE.WORKFLOW_ACT_VAR,
                                        filter: {
                                            parentId: activity.id
                                        }
                                    }
                                } );
                            }

                            function addIncomingLinks( activityNode, activity ) {
                                addNode( activityNode, {
                                    header: {
                                        type: TYPE.WF_INCOMING_LINKS,
                                        isOpen: true,
                                        omitIfEmpty: true,
                                        title: msg( "WF.INCOMING", false )
                                    },
                                    setFilter: false,
                                    component: [ {
                                        type: TYPE.WF_TRANSITION,
                                        typeId: model.COMP_TYPE.WORKFLOW_TRANS,
                                        filter: {
                                            filterFunction: function() {
                                                return this.getProperty( model.PROP.TO_WORKFLOW_ACTIVITY ).getValue() === activity.id;
                                            }
                                        }
                                    }, {
                                        type: TYPE.WF_BRANCH,
                                        typeId: model.COMP_TYPE.WORKFLOW_BRANCH,
                                        filter: {
                                            filterFunction: function() {
                                                return this.getProperty( model.PROP.TO_WORKFLOW_ACTIVITY ).getValue() === activity.id;
                                            }
                                        }
                                    } ]
                                } );
                            }

                            function addOutgoingLinks( activityNode, activity ) {
                                addNode( activityNode, {
                                    header: {
                                        type: TYPE.WF_OUTGOING_LINKS,
                                        isOpen: true,
                                        omitIfEmpty: true,
                                        title: msg( "WF.OUTGOING", false )
                                    },
                                    setFilter: false,
                                    component: [ {
                                        type: TYPE.WF_TRANSITION,
                                        typeId: model.COMP_TYPE.WORKFLOW_TRANS,
                                        filter: {
                                            filterFunction: function() {
                                                return this.getProperty( model.PROP.FROM_WORKFLOW_ACTIVITY ).getValue() === activity.id;
                                            }
                                        }
                                    }, {
                                        type: TYPE.WF_BRANCH,
                                        typeId: model.COMP_TYPE.WORKFLOW_BRANCH,
                                        filter: {
                                            filterFunction: function() {
                                                return this.parentId === activity.id;
                                            }
                                        }
                                    } ]
                                } );
                            }

                            function addActivityCompParams( pActivityNode, pActivity  ) {
                                let lActivityType = pActivity.getProperty( model.PROP.PAGE_PROCESS_TYPE ).getValue();
                                if ( lActivityType === "NATIVE_CREATE_TASK" ) {
                                    addNode( pActivityNode, {
                                        header: {
                                            type: TYPE.WF_TASK_PARAMS,
                                            isOpen: true,
                                            omitIfEmpty: true
                                        },
                                        setFilter: false,
                                        component: {
                                            type: TYPE.WF_TASK_PARAMS,
                                            typeId: model.COMP_TYPE.WF_ACTIVITY_TASK_PARAM,
                                            filter: {
                                                parentId: pActivity.id
                                            }
                                        }
                                    } );
                                }

                                if ( lActivityType === INVOKE_API ) {
                                    addNode( pActivityNode, {
                                        header: {
                                            type: TYPE.WF_API_PARAMS,
                                            isOpen: false,
                                            omitIfEmpty: true
                                        },
                                        setFilter: false,
                                        component: {
                                            type: TYPE.WF_API_PARAM,
                                            typeId: model.COMP_TYPE.WF_ACTIVITY_API_PARAM,
                                            filter: {
                                                parentId: pActivity.id
                                            }
                                        }
                                    } );

                                    addNode( pActivityNode, {
                                        header: {
                                            type: TYPE.WF_API_WS_PARAMS,
                                            isOpen: false,
                                            omitIfEmpty: true
                                        },
                                        setFilter: false,
                                        component: {
                                            type: TYPE.WF_API_WS_PARAM,
                                            typeId: model.COMP_TYPE.WF_ACTIVITY_WS_PARAM,
                                            filter: {
                                                parentId: pActivity.id
                                            }
                                        }
                                    } );

                                }
                                if ( lActivityType === "NATIVE_INVOKE_WF" ) {
                                    addNode( pActivityNode, {
                                        header: {
                                            type: TYPE.WF_INVOKE_WF_PARAMS,
                                            isOpen: true,
                                            omitIfEmpty: true
                                        },
                                        setFilter: false,
                                        component: {
                                            type: TYPE.WF_INVOKE_WF_PARAM,
                                            typeId: model.COMP_TYPE.WF_ACTIVITY_WF_PARAM,
                                            filter: {
                                                parentId: pActivity.id
                                            }
                                        }
                                    } );
                                }
                            }

                            addActivityCompParams( activityNode, activity );

                            addActivityVars( activityNode, activity );

                            addOutgoingLinks( activityNode, activity );

                            addIncomingLinks( activityNode, activity );

                        }

                        addNode( versionNode, {
                            header: {
                                type: TYPE.WF_ACTIVITIES,
                                isOpen: true,
                                omitIfEmpty: false,
                            },
                            setFilter: false,
                            component: {
                                type: TYPE.WF_ACTIVITY,
                                typeId: model.COMP_TYPE.WORKFLOW_ACTIVITY,
                                filter: {
                                    parentId: version.id
                                },
                                addSubComponents: addActivityComponents
                            }
                        } );
                    }

                    function addParticipants( versionNode, version ) {
                        addNode( versionNode, {
                            header: {
                                type: TYPE.WF_PARTICIPANTS,
                                isOpen: true,
                                omitIfEmpty: false,
                            },
                            setFilter: false,
                            component: {
                                type: TYPE.WF_PARTICIPANT,
                                typeId: model.COMP_TYPE.WORKFLOW_PARTICIP,
                                filter: {
                                    parentId: version.id
                                }
                            }
                        } );
                    }

                    function addVariables( versionNode, version ) {
                        addNode( versionNode, {
                            header: {
                                type: TYPE.WF_VARS,
                                isOpen: true,
                                omitIfEmpty: false,
                            },
                            setFilter: false,
                            component: {
                                type: TYPE.WF_VAR,
                                typeId: model.COMP_TYPE.WORKFLOW_VARIABLE,
                                filter: {
                                    parentId: version.id
                                }
                            }
                        } );
                    }

                    addActivities( versionNode, version );

                    addParticipants( versionNode, version );

                    addVariables( versionNode, version );

                }

                addNode( workflowNode, {
                    header: false,
                    setFilter: false,
                    component: {
                        type: TYPE.WF_VERSION,
                        typeId: model.COMP_TYPE.WORKFLOW_VERSION,
                        filter: {
                            parentId: workflow.id
                        },
                        addSubComponents: addVersionComponents
                    }
                } );
            }

            addParams( workflowNode, workflow );
            addVersions( workflowNode, workflow );
        }

        addNode( headerNode, {
            header: false,
            setFilter: false,
            component:[ {
                type: TYPE.WORKFLOW,
                typeId: model.COMP_TYPE.WORKFLOW,
                filter: {},
                addSubComponents: addWorkflowComponents
            } ]
        } );
    }

    /**
     * creates the workflow tree structure
     *
     * @returns {object}
     */
    function getWorkflowData() {
        let node = $.apex.designerTree.addHeaderNode( undefined, {
            title: msg( "WF.TREE.WORKFLOWS", false ),
            type: TYPE.WORKFLOWS,
            showHasComponents: true,
            omitIfEmpty: false
        } );
        addWorkflow( node );
        $.apex.designerTree.postProcessNodes( node );
        return node;
    }

    /**
     * adds the observers/listeners on the designer events
     * @todo very similar to the one from f4000_p4500.tree.js
     *
     * @param {object} pTree$ the tree dom element
     */
    function registerEvents( pTree$ ) {
        let lPropertiesFilter, comps, WIDGET = pTree$[0].id;

        function addSharedCompTypes( pSharedCompTypes ) {

            let lRefByCompProps;

            for ( let i = 0; i < pSharedCompTypes.length; i++ ) {

                if ( Object.prototype.hasOwnProperty.call( pSharedCompTypes[ i ], "typeId" ) ) {

                    // Find all properties which are using the current component type as LOV
                    lRefByCompProps = pd.getRefByCompProps( pSharedCompTypes[ i ].typeId );
                    for ( let j = 0; j < lRefByCompProps.length; j++ ) {
                        comps.push( { typeId: lRefByCompProps[ j ].typeId } );
                        lPropertiesFilter.push( lRefByCompProps[ j ].propertyId );
                    }
                }
                if ( pSharedCompTypes[ i ].children ) {
                    addSharedCompTypes( pSharedCompTypes[ i ].children );
                }
            }
        } // addSharedCompTypes

        if ( WIDGET === "PDSharedCompTree") {
            comps = [];
            // Flatten the shared component types
            addSharedCompTypes( SHARED_COMP_TYPES );
        } else {
            comps = [
                { typeId: model.COMP_TYPE.WORKFLOW },
                { typeId: model.COMP_TYPE.WORKFLOW_VERSION },
                { typeId: model.COMP_TYPE.WORKFLOW_ACTIVITY },
                { typeId: TYPE.WF_PARAMS },
                { typeId: model.COMP_TYPE.WORKFLOW_PARAM },
                { typeId: model.COMP_TYPE.WORKFLOW_PARTICIP },
                { typeId: model.COMP_TYPE.WORKFLOW_VARIABLE },
                { typeId: model.COMP_TYPE.WORKFLOW_ACT_VAR },
                { typeId: model.COMP_TYPE.WORKFLOW_BRANCH },
                { typeId: model.COMP_TYPE.WORKFLOW_TRANS },
                { typeId: model.COMP_TYPE.WF_ACTIVITY_TASK_PARAM },
                { typeId: model.COMP_TYPE.WF_ACTIVITY_API_PARAM },
                { typeId: model.COMP_TYPE.WF_ACTIVITY_WS_PARAM },
                { typeId: model.COMP_TYPE.WF_ACTIVITY_WF_PARAM }
             ];
        }

        if ( WIDGET === "PDsharedCompTree" ) {

            // Register observers to find out if display relevant properties have changed
            model.observer(
                WIDGET,
                {
                    components: comps,
                    events:     [ model.EVENT.CHANGE, model.EVENT.ADD_PROP, model.EVENT.REMOVE_PROP ],
                    properties: lPropertiesFilter
                },
                function( pNotifications ) {

                    debug.trace( "%s: CHANGE/ADD_PROP/REMOVE_PROP component notification received for shared component reference properties", WIDGET, pNotifications );

                    // For now lets to a brute force refresh of the tree
                    pTree$.trigger( "refresh" );
                },
                true );

        } else {

             // Register observers to find out if a component has changed
             model.observer(
                WIDGET,
                {
                    components: comps,
                    events:     [ model.EVENT.CHANGE ],
                    properties: [ model.PROP.DISPLAY_SEQUENCE, model.PROP.EXECUTION_SEQUENCE ]
                },
                function( /* pNotification */ ) {
                    pTree$.trigger( "refresh" );
                }
            );

            // Register observers to find out if a component has changed
            model.observer(
                WIDGET,
                {
                    components: comps,
                    events:     [ model.EVENT.CHANGE ]
                },
                function( pNotification ) {
                    if ( pNotification.component.hasChanged() ) {
                        pTree$.designerTree( "addComponentClass", pNotification.component, pd.CSS.IS_CHANGED, pTree$ );
                    } else {
                        pTree$.designerTree( "removeComponentClass", pNotification.component, pd.CSS.IS_CHANGED, pTree$ );
                    }
                }
            );

            // Register observers to find out if a component has changed it's display title
            model.observer(
                WIDGET,
                {
                    components: comps,
                    events:     [ model.EVENT.DISPLAY_TITLE ]
                },
                function( pNotification ) {

                    debug.trace( "%s: DISPLAY_TITLE component notification received", WIDGET, pNotification );
                    let component = pNotification.component;
                    pTree$.designerTree( "updateComponentNode", component, pTree$, function(){
                        this.label = component.getDisplayTitle();
                        if ( component.typeId === model.COMP_TYPE.WORKFLOW_VERSION ) {
                            let state = component.getProperty(  model.PROP.STATE ).getValue();
                            if ( state === STATE_ACTIVE ) {
                                this.label += ` [${ pd.msg( "WF.ACTIVE" ) }]`;
                            } else if ( state === STATE_DEV ) {
                                this.label += ` [${ pd.msg( "WF.DEV" ) }]`;
                            }
                        }
                    } );
                }
            );

            // Register observers to find out if a component has been created or deleted
            model.observer(
                WIDGET,
                {
                    components: comps,
                    events:     [ model.EVENT.CREATE, model.EVENT.DELETE ]
                },
                function( pNotifications ) {

                    debug.trace( "%s: CREATE/DELETE component notification received", WIDGET, pNotifications );
                    // For now lets to a brute force refresh of the tree
                    pTree$.trigger( "refresh" );
                },
                true );

            model.observer(
                WIDGET,
                {
                    components: comps,
                    events:     [ model.EVENT.CHANGE, model.EVENT.ADD_PROP, model.EVENT.REMOVE_PROP ],
                    properties: [ model.PROP.STATE, model.PROP.TO_WORKFLOW_ACTIVITY, model.PROP.FROM_WORKFLOW_ACTIVITY, model.PROP.ITEM_LABEL ]
                },
                function( pNotifications ) {

                    debug.trace( "%s: CHANGE/ADD_PROP/REMOVE_PROP component notification received for shared component reference properties", WIDGET, pNotifications );

                    // For now lets to a brute force refresh of the tree
                    pTree$.trigger( "refresh" );
                },
                true );

            // Register observers to find out if a component has errors or warnings
            model.observer(
                WIDGET,
                {
                    components: comps,
                    events:     [ model.EVENT.ERRORS, model.EVENT.NO_ERRORS, model.EVENT.VALIDATE_COMPONENT ]
                },
                function( pNotification ) {
                    if ( pNotification.component.hasErrors() ) {
                        pTree$.designerTree( "addComponentClass", pNotification.component, pd.CSS.IS_ERROR, pTree$ );
                    } else {
                        pTree$.designerTree( "removeComponentClass", pNotification.component, pd.CSS.IS_ERROR, pTree$ );
                    }
                } );

            model.observer(
                WIDGET,
                {
                    components: comps,
                    events:     [ model.EVENT.WARNINGS, model.EVENT.NO_WARNINGS ]
                },
                function( pNotification ) {
                    if ( pNotification.component.hasWarnings() ) {
                        pTree$.designerTree( "addComponentClass", pNotification.component, pd.CSS.IS_WARNING, pTree$ );
                    } else {
                        pTree$.designerTree( "removeComponentClass", pNotification.component, pd.CSS.IS_WARNING, pTree$ );
                    }
                } );

            pd.observerIsConditional( WIDGET, comps,
                function( pNotification ) {
                    pTree$.designerTree( "removeComponentClass", pNotification.component, pd.CSS.IS_CONDITIONAL, pTree$ );
                    pTree$.designerTree( "removeComponentClass", pNotification.component, pd.CSS.IS_NEVER, pTree$ );

                    if ( pd.isInactive( pNotification.component ) ) {
                        pTree$.designerTree( "addComponentClass", pNotification.component, pd.CSS.IS_NEVER, pTree$ );
                    } else if ( pd.isConditional( pNotification.component ) ) {
                        pTree$.designerTree( "addComponentClass", pNotification.component, pd.CSS.IS_CONDITIONAL, pTree$ );
                    }
                } );
        }

        // Register event handlers if other widgets on the page select components
        $( document ).on( "selectionChanged." + WIDGET, function( pEvent, pWidget, pComponents ) {

            if ( pWidget !== WIDGET ) {
                debug.trace( "%s: selectionChanged event received from %s", WIDGET, pWidget, pComponents );

                if ( pComponents.length === 0 || comps.some( comp => comp.typeId ===  pComponents[ 0 ].typeId ) ) {
                    pTree$.designerTree( "setSelectedComponents", pComponents, null, false, true );
                }
            }
        } );
    }

    /**
     *
     * @param {object}   tree$          the tree dom element
     * @param {function} dataFunction   function that returns the data for the tree
     * @param {boolean}  showRoot       show the root node of the tree
     */
    function initTree( tree$, dataFunction, showRoot ) {
        let contextMenuId = `${ tree$[ 0 ].id }Menu`;
        tree$.designerTree( {
            getNodeAdapter:     pd.getTreeNodeAdapter( dataFunction, false, getTreeRules() ),
            showRoot:           showRoot,
            collapsibleRoot:    false,
            expandRoot:         false,
            contextMenuEntries: getContextMenuEntries( tree$ ),
            contextMenuId:      contextMenuId,
            multiple:           true,
            doubleClick:        "toggle",
            clickToRename:      false,
            keyboardRename:     false,
            keyboardAdd:        false,
            keyboardDelete:     true,
            tooltip: {
                show:    apex.tooltipManager.defaultShowOption(),
                content: function( pCallback, pNode ) {
                    let lComponent = getComponent( pNode );
                    if ( lComponent ) {
                        return pd.tooltipContentForComponent( lComponent );
                    }
                }
            },
            dragAndDrop:       true,
            dragMultiple:      true,
            dragReorder:       true,
            delay:             10,
            distance:          5,
            dragAppendTo:      document.body,
            dragCursor:        "move",
            dragOpacity:       0.6,
            dragCursorAt:      { left: 10, bottom: 10 },
            dragAnimate:       false,
            dragContainment:   "document",
            createComponent: function( pNode, pComponentTypeId ) {
                let self = this,
                    nodeComponent = this.getComponent( pNode ),
                    lValues       = [],
                    lParentId,
                    lParentComponent,
                    lStartNodeId,
                    lTransaction,
                    lNewComponent,
                    lPrevComponent,
                    lMessage;

                function addValue( pOptions ) {

                    let lComponent;

                    if ( Object.prototype.hasOwnProperty.call( pOptions, "value" ) ) {
                        // Add static value
                        lValues.push( {
                            id:    pOptions.id,
                            value: pOptions.value
                        } );

                    } else if ( pOptions.typeId ) {
                        // Add nearest component with that type
                        lComponent = self.getNearestComponent( pOptions.typeId, pNode );

                        lValues.push( {
                            id:    pOptions.id,
                            value: lComponent ? lComponent.id : ""
                        } );

                    } else if ( pOptions.id ) {
                        // Add nearest property value
                        lValues.push( {
                            id:    pOptions.id,
                            value: self.getNearestValue( pOptions.id, pNode ) + ""
                        } );

                    }
                }

                switch( pComponentTypeId ) {
                    case model.COMP_TYPE.WORKFLOW_PARAM:
                    case model.COMP_TYPE.WORKFLOW_VERSION:
                        lParentComponent = self.getNearestComponent( model.COMP_TYPE.WORKFLOW, pNode );
                        lParentId        = lParentComponent.id;
                        break;
                    case model.COMP_TYPE.WORKFLOW_ACTIVITY:
                    case model.COMP_TYPE.WORKFLOW_VARIABLE:
                    case model.COMP_TYPE.WORKFLOW_PARTICIP:
                        lParentComponent = self.getNearestComponent( model.COMP_TYPE.WORKFLOW_VERSION, pNode );
                        lParentId        = lParentComponent.id;
                        break;
                    case model.COMP_TYPE.WORKFLOW_TRANS:
                    case model.COMP_TYPE.WORKFLOW_BRANCH:
                    case model.COMP_TYPE.WORKFLOW_ACT_VAR:
                        lParentComponent = self.getNearestComponent( model.COMP_TYPE.WORKFLOW_ACTIVITY, pNode );
                        lParentId = lParentComponent.id;
                        if ( pComponentTypeId === model.COMP_TYPE.WORKFLOW_BRANCH ) {
                            addValue( { id: model.PROP.SWITCH_TYPE, value: lParentComponent.getProperty( model.getPluginProperty(  model.COMP_TYPE.PAGE_PROCESS , "NATIVE_WORKFLOW_SWITCH", 1 ).id ).getValue() } );
                        }
                        break;
                }

                if ( nodeComponent ) {
                    lStartNodeId = pNode._parent.id;
                    lPrevComponent = nodeComponent;
                } else {
                    lPrevComponent = "last";
                }

                lMessage = model.transaction.message( {
                    action:     model.MESSAGE_ACTION.CREATE,
                    component:  pComponentTypeId
                } );

                lTransaction = model.transaction.start( "", lMessage );

                lNewComponent = new model.Component( {
                    previousComponent: lPrevComponent,
                    typeId:            pComponentTypeId,
                    parentId:          lParentId,
                    values:            lValues
                } );

                if ( pComponentTypeId === model.COMP_TYPE.WORKFLOW_VERSION ) {

                    // get all the versions of the workflow
                    let components = model.getComponents( pComponentTypeId, { parentId: self.getComponent( pNode ).id } );
                    let inDevelopment = components.filter( component => component.id !== lNewComponent.id && component.getProperty( model.PROP.STATE ).getValue() === "DEVELOPMENT" );
                    if ( inDevelopment.length ) {
                        let componentNames = inDevelopment.reduce( ( acc, curr ) => {
                            acc.push( curr.getProperty( model.PROP.WORKFLOW_VERSION ).getValue() );
                            return acc;
                        }, [] );
                        message.alert( formatNoEscape( "WF.ALERT_DUP_DEV_VERSION", componentNames.join( ", ") ) , () => {
                            lTransaction.cancel();
                        } );
                    } else if ( components.some( component => component.getProperty( model.PROP.STATE ).getValue() === STATE_ACTIVE  ) ) {
                        message.showDialog( pd.msg( "WF.ALERT_NEW_VERSION" ), {
                            confirm:        true,
                            modern:         true,
                            dialogClass:    "ui-dialog--notification ",
                            extraButtons: [ {
                                text: pd.msg( "TREE.DUPLICATE" ),
                                click: function () {
                                    let currentComponent, activeComponent, activeNode;
                                    lTransaction.cancel();

                                    currentComponent = self.getComponent(pNode);
                                    activeComponent = currentComponent.getChilds( model.COMP_TYPE.WORKFLOW_VERSION, {
                                        properties: [ {
                                            id: model.PROP.STATE,
                                            value: STATE_ACTIVE
                                        } ]
                                    })[ 0 ];
                                    activeNode = self.getComponentNode(activeComponent, pNode.id );

                                    self.duplicateNodes( [ activeNode ], pComponentTypeId );
                                    $( this ).data().uiDialog.close();
                                }
                            } ],
                            callback:  ( ok ) => {
                                if ( ok ) {
                                    apex.commandHistory.execute( lTransaction );
                                    self.setSelectedComponents( [ lNewComponent ], lStartNodeId, true );
                                } else {
                                    try {
                                        lTransaction.cancel();
                                    } catch(e) {
                                        debug.info( "There's no pending transaction" );
                                    }
                                }
                            } }
                        );
                    } else {
                        apex.commandHistory.execute( lTransaction );
                        self.setSelectedComponents( [ lNewComponent ], lStartNodeId, true );
                    }
                } else {
                    apex.commandHistory.execute( lTransaction );
                    self.setSelectedComponents( [ lNewComponent ], lStartNodeId, true );
                }
            }
        } );

        // ensures clicking the external context menu will always have a selected node on which to act
        $( `#${ contextMenuId }` ).on( "menubeforeopen", function(){
            if ( tree$.designerTree( "getSelection" ).length === 0 ) {
                tree$.designerTree( "setSelection", $( "[aria-level='1']", tree$ ).first().parent() );
            }
        } );

        tree$.on( "refresh", function( event, nodeToExpand ) {
            let expandedState = tree$.designerTree( "getExpandedState" );

            if ( nodeToExpand ) {
                expandedState[nodeToExpand] = true;
            }

            debug.trace( "%s: refresh tree", tree$[ 0 ].id );
            tree$.designerTree( "option", "getNodeAdapter", pd.getTreeNodeAdapter( dataFunction, expandedState, getTreeRules() ) );

        } );

        registerEvents( tree$, dataFunction );

    }

    $( document ).on( "modelReady", function() {
        let trees$ = $( "#trees" );
        let workflowTree$ = $( "#workflowTree" );
        let sharedTree$ = $( "#PDsharedCompTree" );

        trees$.on( "tabsactivate", function( event, ui ) {
            let tree$ = ui.newPanel.find( ".a-TreeView" ),
                component;

            if ( tree$.length > 0 ) {
                // Notify other widgets on the page that the displayed tree has changed and other selected components
                // have to be displayed. But there is no need to do this if the current tree hasn't selected anything.
                // For example on the previous tab we had selected a page item and we switch to dynamic actions, we
                // still want to see the properties of the page item in the property editor and keep it selected in GLV.
                component = tree$.designerTree( "getSelectedComponents" );
                if ( component.length > 0 ) {
                    debug.trace( "%s: trigger event selectionChanged", tree$.id, component );
                    $( document ).trigger( "selectionChanged", [ tree$.id, component ] );
                }
            }
        } );

        initTree( workflowTree$, getWorkflowData, true );
        initTree( sharedTree$, function(){
            return pd.getSharedData( SHARED_COMP_TYPES );
        }, false );
    } );
})( window.pe, apex.debug, apex.lang, apex.jQuery, window.pageDesigner, apex.message );