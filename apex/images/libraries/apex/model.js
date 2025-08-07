/*!
 Copyright (c) 2015, 2024, Oracle and/or its affiliates.
 */
/**
 * @namespace apex.model
 * @since 5.1
 * @desc
 * <p>The apex.model namespace contains methods used to manage client side Oracle APEX data models. These models
 * store data for display by UI components. They correspond to the view-model in the Model-View-ViewModel (MVVM) pattern.
 * See {@link model} for details.</p>
 * <p>This namespace contains functions to manage the lifecycle of a model:</p>
 * <ul>
 * <li>Use {@link apex.model.create} to create a model.</li>
 * <li>Use {@link apex.model.list} to list all the existing models.</li>
 * <li>Use {@link apex.model.get} to return an existing model.</li>
 * <li>Use {@link apex.model.release} to release a model once you are done with it.</li>
 * </ul>
 * <p>Models are reference counted so for every call to <code class="prettyprint">get</code> or
 * <code class="prettyprint">create</code> you must call <code class="prettyprint">release</code>. Failure to do so can
 * result in unused models taking up memory. Typically, the APEX region associated with the model will manage
 * its life cycle.
 * </p>
 * <p>Models typically act as an intermediary between data persisted on the server and one or more views on the client.
 * The <code class="prettyprint">regionId</code> option associates the model with an APEX region for the purpose of
 * fetching and saving data. Models can be created without a <code class="prettyprint">regionId</code>. These are
 * known as local models and they cannot fetch data from or save data to the server.
 * </p>
 * <p>There are also methods such as {@link apex.model.save}, {@link apex.model.anyChanges}, and {@link apex.model.anyErrors}
 * that operate on multiple models.
 * </p>
 * <div class="hw">
 * <h3 id="master-detail">Master Detail</h3>
 * <a class="bookmarkable-link" title="Bookmarkable Link" aria-label="Bookmark Master Detail" href="#master-detail"></a>
 * </div>
 * <p>Models can be arranged in a master detail configuration. This is done by providing the
 * <code class="prettyprint">parentModel</code> and <code class="prettyprint">parentRecordId</code>
 * options when creating the detail models. A single master model can have multiple kinds of detail models. For example
 * projects can have tasks and members as details. Each kind of detail model has one or more model instances; each related
 * to a record in the master model. Detail instance models share the same name and field configuration but each
 * has a distinct instance id and different data. A model is uniquely identified by a {@link model.ModelId}, which in the case
 * of a detail model contains the detail name and instance id. Detail models are cached so that data doesn't have to be
 * fetched from the server unnecessarily. The view layer typically shows a view of the detail instance model that is
 * associated with the current record of the master view. As the current record of the master changes the view layer
 * changes the detail model instance the detail view is showing. The view layer will get a cached instance model if
 * there is one and if not will create the instance model. The maximum number of detail instances to cache is controlled
 * with the {@link apex.model.getMaxCachedModels} and {@link apex.model.setMaxCachedModels} functions. It is the least
 * recently used model that is kicked out of the cache. Models that have changes are not destroyed unless
 * {@link apex.model.destroy} is called.</p>
 * <p>A detail model can be a master to its own set of sub-detail models. This relationship can be nested to any depth.</p>
 */

/**
 * @interface model
 * @since 5.1
 * @classdesc
 * <p>A model holds data in memory for use by the UI layer. It corresponds to the view-model in the Model-View-ViewModel
 * (MVVM) pattern. The UI can both read and write the data.
 * A model can notify interested parties (subscribers) when the data changes. The data comes (is fetched) from
 * the server and updates can be written back (saved) to the server.</p>
 *
 * <p>Models are created and managed with functions of the {@link apex.model} namespace.
 * A model is uniquely identified by a {@link model.ModelId}, which is a string name and optional string instance id.</p>
 *
 * <p>A model can hold data of different shapes. They are:</p>
 * <ul>
 * <li>table: The data is an ordered collection of records. In database or UI terms the record might be called a row.
 *    See {@link model.Record}.</li>
 * <li>tree: The data is a single root record and each record including the root can have an ordered collection of
 *    any number of child records. When dealing with trees it is common to call the records nodes. See {@link model.Node}.</li>
 * <li>record: The data is a single record. In some cases this is treated as a collection of one.</li>
 * </ul>
 *
 * <p>Each record can have any number of named fields. See {@link model.Record}. All records in the collection must have
 * the same set of fields although the value of some fields may be null. In database or UI terms the fields
 * might be called columns. The actual storage of a record could be an object or an array. If records are objects then the
 * fields of the record are the properties of the object. If the records are arrays the fields of the record are
 * elements of the array and the {@link model.FieldMeta} <code class="prettyprint">index</code> property is used to
 * map from the field name to the record array index.</p>
 *
 * <p>The model has very few restrictions on the values of fields.
 * However typically when the model data is backing APEX items or HTML form controls the values will all be strings.
 * The model optionally uses the following fields for specific purposes:</p>
 * <ul>
 * <li>identity: A string value that uniquely identifies the record. There can be multiple identity fields.
 *      Required for editable models. See {@link apex.model.create} option <code class="prettyprint">identityField</code>.</li>
 * <li>meta: An object with additional metadata about the record. See {@link apex.model.create} option <code class="prettyprint">metaField</code>.</li>
 * <li>children: (tree shape only) An array of the child records (nodes). See {@link apex.model.create} option <code class="prettyprint">childrenField</code>.</li>
 * <li>parent identity: (tree shape only) A string value that identifies the parent record (node) of this record (node).
 *      Required for editable tree shaped models. See {@link apex.model.create} option <code class="prettyprint">parentIdentityField</code>.</li>
 * </ul>
 *
 * <p>Another special case is for field values that have a display value in addition to their intrinsic value. These
 * composite values have the form: <code class="prettyprint">{ d: "<em>display value</em>", v: <em>value</em> }</code>
 * When comparing values during {@link model#setValue} only the value is considered not the display value.
 * Also, when the changes are saved to the server just the value is included without being wrapped
 * in an object. Other special fields such as identity or parent etc. cannot have this structure.</p>
 *
 * <h3>Control Breaks:</h3>
 * <p>A table shape model can facilitate view layer presentation of control breaks by keeping track of the
 * control break values and the boundary between the control breaks. The data must be pre-sorted by the control
 * break field values according to {@link model.FieldMeta} property <code class="prettyprint">controlBreakIndex</code>
 * and the last record in each control break must have the {@link model.RecordMetadata} property
 * <code class="prettyprint">endControlBreak</code> set to true.
 *
 * <h3>Aggregations:</h3>
 * <p>A table shape model can contain aggregate information. Aggregations are just records that the server
 * includes in order among all the other records marked with metadata
 * property <code class="prettyprint">agg: "<em>AggregateFunctionName</em>"</code>. Aggregate records can also
 * be created by the model when fields have {@link model.FieldMeta} property
 * <code class="prettyprint">aggregates</code> defined.
 * The aggregate record has most fields empty except for the aggregate fields that contain the aggregate value.
 * The results of each different aggregate function is in a separate record.</p>
 *
 * <h3>Ajax Messages:</h3>
 * <p>This section defines the JSON content of the Ajax requests the model sends to the server and the responses
 * it expects back. This information is useful when creating a plug-in that uses the model.</p>
 *
 * <p>All the requests and responses use the regions array structure shown in {@link apex.server.plugin}. The top
 * level object contains a property called "regions" which is an array of region objects. Each region object,
 * in both the request and response, contains the "id" (region id) and "ajaxIdentifier" associated with the
 * region plug-in. The rest of the region object content depends on the type of request.</p>
 *
 * <pre class="prettyprint"><code>{
 *     "regions": [ {
 *        "id": <em>region-id-or-static-id</em>,
 *        "ajaxIdentifier": <em>ajaxIdentifier</em>,
 *        // model create option regionData is merged here
 *        // method specific properties go here
 *     }, ...]
 * }
 * </code></pre>
 *
 * <h4>Method {@link model#fetch} request:</h4>
 * <p>Model shape table:</p>
 * <pre class="prettyprint"><code>"fetchData": {
 *     "firstRow": <em>n</em>, // one based
 *     "maxRows": <em>n</em>, // null if paginationType is "none"
 *     "version": <em>version</em> // model create option version
 *     // model create option fetchData is merged here
 * }
 * </code></pre>
 * <p>Model shape tree or record:</p>
 * <pre class="prettyprint"><code>"fetchData": {
 *     "version": <em>version</em> // model create option version
 *     // model create option fetchData is merged here
 * }
 * </code></pre>
 *
 * <h4>Method {@link model#fetch} response:</h4>
 * <p>Model shape table:</p>
 * <pre class="prettyprint"><code>"fetchedData": {
 *     "values": [<em>record</em>, ...],
 *     "firstRow": <em>n</em>, // one based
 *     "moreData": <em>true|false</em>, // true if there are more records on the server and false otherwise
 *     "dataOverflow": <em>true|false</em>, // optional, true if the server has more data than can be returned
 *         // even with pagination. When this is true the totalRows should reflect what the server is willing
 *         // to return not the total number of rows in the database.
 *     "totalRows": <em>n</em> // only required when option hasTotalRecords is true
 * }
 * </code></pre>
 * <p>Model shape tree:</p>
 * <pre class="prettyprint"><code>"fetchedData": {
 *     "root": <em>node</em>
 * }
 * </code></pre>
 * <p>Model shape record:</p>
 * <pre class="prettyprint"><code>"fetchedData": {
 *     "value": <em>record</em>
 * }
 * </code></pre>
 *
 * <h4>Method {@link model#fetchRecords} request:</h4>
 * <pre class="prettyprint"><code>"fetchData": {
 *     "primaryKeys": [<em>key</em>, ...] // a key is { "recordId": <em>stringId</em>, "pk": [<em>identityValue</em>, ...] }
 *     "version": <em>version</em> // model create option version
 *     // model create option fetchData is merged here
 * }
 * </code></pre>
 *
 * <h4>Method {@link model#fetchRecords} response:</h4>
 * <pre class="prettyprint"><code>"fetchedData": {
 *     "values": [<em>record</em>, ...]
 * }
 * </code></pre>
 *
 * <h4>Method {@link model#save} request:</h4>
 * <pre class="prettyprint"><code>"saveData": {
 *     "models": [
 *         {
 *             "version": <em>version</em> // model create option version
 *             "instance": <em>modelInstance</em>, // model instance or null
 *             "values": [<em>record</em>, ...] // meta column contains "op": <em>i|u|d</em> for operation insert, update, delete
 *                 // Note additional properties in the meta column are not yet formally defined
 *                 // inserted records have identityField values set to "".
 *             // model create option saveData is merged here
 *         }, ... // when saving a master model there can be additional detail models
 *     ]
 * }
 * </code></pre>
 *
 * <h4>Method {@link model#save} response:</h4>
 * <pre class="prettyprint"><code>"fetchedData": {
 *     models: [
 *         {
 *             "values": [<em>record</em>, ...], // records updated or inserted are returned
 *         }, ... // when saving a master model there can be additional detail models
 *     ]
 * }
 * </code></pre>
 *
 * <h4>Method {@link model#fetchChildNodes} request:</h4>
 * <pre class="prettyprint"><code>"fetchData": {
 *     "parentId": [<em>identityValue</em>, ...], // an array of identity field values or null
 *     "version": <em>version</em> // model create option version
 *     // model create option fetchData is merged here
 * }
 * </code></pre>
 *
 * <h4>Method {@link model#fetchChildNodes} response:</h4>
 * When parentId in the request is null the response contains the whole tree:
 * <pre class="prettyprint"><code>"fetchedData": {
 *     "root": <em>node</em>
 * }
 * </code></pre>
 * When parentId is given in the request the response contains an array of child nodes:
 * <pre class="prettyprint"><code>"fetchedData": {
 *     <em>childrenField</em>: [<em>node</em>, ...]
 * }
 * </code></pre>
 *
 * @example <caption>Models are typically used by advanced UI controls (views) to display, interact with, and edit data.
 * The following is a high level sketch of how a UI control might use a table shape model. </caption>
 * // The widget can create the model during widget initialization
 * this.model = apex.model.create( modelName, options, initialData, ... );
 *
 * // Or it can be configured with the name of a model that already exists and get a reference to it
 * this.model = apex.model.get( modelName );
 *
 * // In either case subscribe to model notifications
 * this.modelViewId = this.model.subscribe( {
 *     onChange: modelNotificationFunction,
 * } );
 *
 * // During create or when the widget is refreshed it should render data from the model
 * // this.pageOffset starts at 0. When the user changes pages or additional page data is needed, run this code again.
 * // The model fetches more data from the server as needed.
 * var count = 0;
 * this.model.forEachInPage( this.pageOffset, pageSize, function( record, index, id ) {
 *     if ( record ) {
 *         // render the row record
 *         count += 1;
 *     }
 *     if ( count === pageSize || !record ) {
 *         // done rendering this page of records
 *     }
 * } );
 *
 * // When settings change that affect the data such as changing the sort order or applying a filter
 * // the new sort order or filter information can be communicated to the server in the model fetchData or
 * // regionData option or it can be sent in a separate Ajax request.
 * this.model.clearData();
 *
 * // Clearing the data will result in a refresh notification. The modelNotificationFunction should
 * this.pageOffset = 0;
 * // call the above forEachInPage code to fetch and render the new data.
 *
 * // When the widget is destroyed it needs to release the model
 * this.model.unSubscribe( this.modelViewId );
 * this.model.release( modelName );
 */
/*
 * TODO
 * add these to above list of special columns once ready
 * <li>type: a string value that identifies the type of record for the purpose of making decisions such as if the
 *      record can be edited or deleted etc. The type is used to access additional metadata about the record based on
 *      its type. See the types model option.</li>
 * <li>sequence: a string representation of a JavaScript floating point number greater than 0 that determines the order
 *      of a record in the collection (lower numbers first). The data must already be sorted by this sequence.
 *      If the collection is a tree then it is the sequence among its siblings. Only required for editable models that
 *      support reordering.</li>
 *
 * The example above used to say
 * "Much of the work in interfacing with a model is handled by {@link tableModelViewBase} so deriving a widget from that
 * base widget can save time and effort."
 * but now that jQuery UI is deprecated deriving from tableModelViewBase should not be recommended.
 */
/*
 * Note: treeView widget $.apex.treeView.makeModelNodeAdapter extends the model interface.
 *
 * Future
 * - Consider local data for offline usage
 *
 * Depends:
 *    core.js
 *    debug.js
 *    util.js
 *    locale.js
 *    server.js
 *    item.js
 */

apex.model = {};

(function( model, server, debug, util, apexItem, locale, $ ) {
    "use strict";

    const DEFAULT_MAX_MODELS = 10,
        SHAPE_TABLE = "table",
        SHAPE_TREE = "tree",
        SHAPE_RECORD = "record",
        DEFAULT_REC_ID = "0", // for record shape that has no identity field; as if at index 0
        BAD_RESPONSE = "Malformed response";

    // notifications
    const N_REFRESH = "refresh",
        N_ADD_DATA = "addData",
        N_REVERT = "revert",
        N_REFRESH_RECORDS = "refreshRecords",
        N_DELETE = "delete",
        N_CLEAR_CHANGES = "clearChanges",
        N_SET = "set",
        N_DESTROY = "destroy";

    const PT_ONE = "one",
        PT_NONE = "none",
        PT_PROGRESSIVE = "progressive";

    let gModels = {}, // A place to keep track of all the models by name todo consider Map
        gModelsLRU = [], // least recently used list
        gNextViewId = 100,
        gMaxCachedModels = DEFAULT_MAX_MODELS;

    const gSettableOptions = new Set( [
        "genIdPrefix",
        "pageItemsToSubmit",
        "fetchData",
        "saveData",
        "regionData",
        "requestOptions",
        "parentRecordId",
        "editable",
        "pageSize",
        "callServer",
        "visibilityFilter",
        "visibilityFilterContext",
        "trackChanges",
        "onlyMarkForDelete",
        "delayClearData"
        ] );

    const hasOwnProperty = util.hasOwnProperty,
        extend = $.extend,
        isArray = Array.isArray,
        isPlainObject = $.isPlainObject,
        isFunction = ( fn ) => {
            return typeof fn === "function";
        },
        makeDeferred = $.Deferred,
        equalValue = util.equalValue,
        toNumber = locale.toNumber; // toNumber(value, formatMask)

    function idListToArray( idStr ) {
        return idStr.replace( /#/g, "" ).split( /\s*,\s*/ );
    }

    function objectWithValue( o ) {
        return typeof o === "object" && hasOwnProperty( o, "v" );
    }

    function makeModelId( id ) {
        if ( typeof id === "string" ) {
            return [ id, null ];
        } if ( isArray (id) && id.length === 2 && typeof id[0] === "string" && ( id[1] === null || typeof id[1] === "string" )) {
            return id;
        }
        throw new Error( "Invalid model id" );
    }

    const nextIds = new Map();

    /*
     * Return a unique sequence of numbers starting at 1000 for the given model name.
     * New records added to the model need to have unique IDs. The id sequences need to be kept per
     * modelName, meaning shared with all instances of a model, so that adding new rows on multiple of
     * levels of master detail works. A newly inserted row can be the master of another new detail model
     * in which case the new row id becomes the detail model instance. (See bug 31799257.)
     * @ignore
     * @param {string} modelName
     * @returns {number}
     */
    function nextTempId( modelName ) {
        let next = nextIds.get( modelName );

        if ( !next ) {
            next = 1000;
        }
        nextIds.set( modelName, next + 1 );
        return next;
    }

    function resetTempIds() {
        nextIds.clear();
    }

    function pageOffset( offset, pageSize ) {
        return Math.floor( offset / pageSize ) * pageSize;
    }

    function copyItem( item ) {
        if ( isArray( item ) ) {
            let a = [];

            for ( let i = 0; i < item.length; i++ ) {
                a.push( copyItem( item[i] ) );
            }
            return a;
        } else if ( isPlainObject( item ) ) {
            return extend( true, {}, item );
        } // else
        return item;
    }

    function copyRecord( record ) {
        let i, copy;

        if ( isArray( record ) ) {
            copy = [];
            for ( i = 0; i < record.length; i ++) {
                copy[i] = copyItem( record[i] );
            }
        } else {
            copy = {};
            for ( i in record ) {
                if ( hasOwnProperty( record, i ) ) {
                    copy[i] = copyItem( record[i] );
                }
            }
        }
        return copy;
    }

    function notifyChange( model, changeType, change ) {
        let listeners = model._listeners;

        for ( let i = 0; i < listeners.length; i++ ) {
            // don't let one listener stop others from being notified
            try {
                listeners[i].onChange( changeType, change );
            } catch( ex ) {
                debug.error( "Error in model listener.", ex );
            }
        }
    }

    function callForEachCallback( thisArg, callback, record, index, id, error ) {
        if ( thisArg ) {
            callback.call( thisArg, record, index, id, error );
        } else {
            callback( record, index, id, error );
        }
    }

    function updateWithAllowedOps( iNode ) {
        if ( iNode.allowedOperations ) {
            iNode.canEdit = !!iNode.allowedOperations.update;
            iNode.canDelete = !!iNode.allowedOperations.delete;
        }
    }

    function makeIdentityKey( recordIdentity ) {
        if ( typeof recordIdentity === "string" ) {
            return recordIdentity;
        } else if ( isArray( recordIdentity ) ) {
            if ( recordIdentity.length === 1 ) {
                return "" + recordIdentity[0];
            }
            return JSON.stringify(recordIdentity);
        }
        // really shouldn't get here
        return recordIdentity.toString();
    }

    function makeLoadingIndicatorFunction( model, extraModels ) {
        let progressViews = [],
            progressOptions = [];

        function addViews( m ) {
            let pv$,
                listeners = m._listeners;

            for ( let i = 0; i < listeners.length; i++ ) {
                pv$ = listeners[i].progressView;
                // if there is a progress view that is visible
                if ( pv$ && pv$[0] && pv$[0].offsetWidth && pv$[0].offsetHeight ) {
                    progressViews.push( pv$ );
                    progressOptions.push( listeners[i].progressOptions || null );
                }
            }
        }

        addViews(model);
        if ( extraModels ) {
            for ( let i = 0; i < extraModels.length; i++ ) {
                addViews( extraModels[i] );
            }
        }
        if ( progressViews.length === 0 ) {
            return null;
        } // else
        if ( model._options.makeLoadingIndicator ) {
            return model._options.makeLoadingIndicator( progressViews, progressOptions );
        } else {
            return function() {
                let spinner$,
                    toRemove$ = $();

                for ( let i = 0; i < progressViews.length; i++ ) {
                    spinner$ = util.showSpinner( progressViews[i], progressOptions[i] );
                    toRemove$ = toRemove$.add( spinner$ );
                }
                return function () {
                    toRemove$.remove();
                };
            };
        }
    }

    function makeRequestOptions( options, model ) {
        return extend( {}, options.requestOptions, {
            loadingIndicator: makeLoadingIndicatorFunction( model )
        } );
    }

    function makeAjaxError( message, jqXHR, textStatus, errorThrown ) {
        let e,
            text = message; // todo think about what is useful for the error

        if ( errorThrown ) {
            text += " Server status: " + errorThrown;
        }
        e = new Error( text );
        if ( jqXHR && jqXHR.status >= 0 ) {
            e.status = jqXHR.status;
        }
        return e;
    }

    function clearRecordChanges( iNode, errorsOnly ) {
        // clear out any field changes or errors
        delete iNode.error;
        delete iNode.warning;
        delete iNode.message;
        for ( let fieldName in iNode.fields ) {
            if ( hasOwnProperty( iNode.fields, fieldName ) ) {
                let fieldMeta = iNode.fields[fieldName];

                if ( !errorsOnly ) {
                    delete fieldMeta.changed;
                    delete fieldMeta.stale;
                }
                delete fieldMeta.error;
                delete fieldMeta.warning;
                delete fieldMeta.message;
            }
        }
    }

    function getSequenceBounds( a, index, seqKey) {
        let beginSeq = -1,
            endSeq = -1;

        if ( index - 1 >= 0) {
            beginSeq = parseFloat( a[index - 1][seqKey] );
        }
        if ( index < a.length ) {
            endSeq = parseFloat( a[index][seqKey] );
        }
        return [beginSeq, endSeq];
    }

    function getSequence( sequenceStep, beginSeq, endSeq, count, index, current ) {
        let range;

        if ( beginSeq === -1 ) {
            beginSeq = 0;
        }
        if ( current && current > beginSeq && ( endSeq === -1 || current < endSeq ) ) {
            // current value is good as is so use it
            return current;
        } // else
        if ( endSeq === -1 ) {
            endSeq = beginSeq + ( sequenceStep * count );
        }
        range = endSeq - beginSeq;
        return beginSeq + ( range / ( count + 1 ) ) * index;
    }

    const invalidShapeError = ( method ) => {
            return new Error( `Model has invalid shape for the ${method} method` );
        }, invalidDataTypeError = ( func ) => {
            return new Error( `Wrong data type for ${func} aggregate` );
        }, identityFieldRequiredError = () => {
            return new Error( "Model must have identityField defined" );
        }, fieldDependsError = ( fieldName, itemName ) => {
            return new Error( `Field '${fieldName}' depends on unknown field/item '${itemName}'` );
        }, fieldNotFoundError = ( label, name ) => {
            return new Error( label + " field not found: " + name );
        };

    function normalizeDataValues( rec, fields, recordIsArray ) {
        var i, field, key, value;

        for ( i in fields ) {
            if ( hasOwnProperty( fields, i ) ) {
                field = fields[i];
                if ( !field.volatile && !field.virtual ) {
                    key = recordIsArray ? field.index : i;
                    value = rec[key];
                    if ( typeof value === "string" ) {
                        rec[key] = value.replace( /\r\n/g, "\n" );
                    }
                }
            }
        }
    }

    // for each field dependent on call the calc function or mark as invalidated
    function doCalculations( model, iNode, dependents, notify, alreadyDone ) {
        let o = model._options,
            record = iNode.record,
            identity = model._getIdentity( record ),
            added = alreadyDone || {},
            outstandingCalcs = [];

        function orderDependencies( deps, added, depsOut ) {
            // for each dependency
            for ( let i = 0; i < deps.length; i++ ) {
                let dependent,
                    fieldName = deps[i],
                    field = o.fields[fieldName];

                // don't care about dependencies not in this model
                if ( field && !added[fieldName] ) {
                    // first see if it has any dependencies
                    if ( field.dependsOn ) {
                        orderDependencies( field.dependsOn, added, depsOut );
                    }
                    if ( !added[fieldName] && ( field.calcValue || field.dependsOn ) ) {
                        depsOut.push( fieldName );
                        added[fieldName] = 1;
                        // once this field is set it may require other fields to be calculated
                        dependent = model._dependentFields[fieldName];
                        if ( dependent ) {
                            orderDependencies( dependent, added, depsOut );
                        }
                    }
                }
            }
        }

        orderDependencies( dependents, added, outstandingCalcs );

        for ( let i = 0; i < outstandingCalcs.length; i++ ) {
            let key, oldValue, depName, depField,
                meta, args, arg, value,
                fieldName = outstandingCalcs[i],
                field = o.fields[fieldName];

            if ( field.calcValue ) {
                args = [];
                for ( let j = 0; j < field.dependsOn.length; j++ ) {
                    depName = field.dependsOn[j];
                    if ( depName.substr( 0, 1 ) === ":" ) { // todo doc this syntax
                        // its a page item
                        arg = apexItem( depName.substr( 1 ) ).getValue();
                        // todo consider getNativeValue if available
                    } else {
                        // its a column
                        // todo check parent models
                        depField = o.fields[depName];
                        arg = model.getValue( record, depName );
                        if ( field.dataType === "NUMBER" ) {
                            arg = toNumber( arg, depField ? depField.formatMask : null ); // todo doc this behavior
                        }
                        // todo dates
                    }
                    args.push( arg );
                }
                value = field.calcValue( args, model, record );

                // Don't use setValue model method. Want a lighter set value
                //   - don't care about allowEdit checks or readonly checks (except for a checksum)
                //   - calculations not allowed for identity, parent, or sequence fields etc. so none of that special processing needed.
                //   - there is no caller to return to so no need to indicate set, dup or no change
                //   - do set the value and do notify in some cases
                //   - should not affect row or field validity
                //   - a calculated value should never be the first change thus won't need to save the original

                key = model.getFieldKey( fieldName );
                // if the field is readonly because of a checksum (ck); calculated set ignores other readonly settings
                if ( iNode.fields && iNode.fields[fieldName] && iNode.fields[fieldName].ck ) {
                    throw new Error( "Set calculated value not allowed for field" );
                }

                // only update if new value is different from current value
                // Note: setting the value back to its original value does not "un-change" the record
                oldValue = record[key];
                if ( !equalValue( oldValue, value ) ) {
                    // set the calculated value in the record
                    record[key] = value;

                    // must already be updated so no need for: iNode.updated = true;
                    if ( !iNode.fields ) {
                        iNode.fields = {};
                    }
                    meta = iNode.fields[fieldName];
                    if ( !meta ) {
                        meta = {};
                        iNode.fields[fieldName] = meta;
                    }
                    if ( o.trackChanges ) {
                        meta.changed = true; // todo consider when this change isn't really a change from db perspective
                    }

                    if ( notify ) {
                        notifyChange( model, N_SET, {
                            oldValue: oldValue,
                            oldIdentity: null,
                            recordId: identity,
                            record: record,
                            field: fieldName
                        } );
                    }
                    model._checkAggregates( fieldName );
                }
            } else if ( field.cellTemplate ) {
                // when a field has a cell template and depends on other columns notify that the cell has changed
                // so that the cellTemplate can be reapplied.
                key = model.getFieldKey( fieldName );
                oldValue = record[key];
                if ( notify ) {
                    notifyChange( model, N_SET, {
                        oldValue: oldValue,
                        oldIdentity: null,
                        recordId: identity,
                        record: record,
                        field: fieldName
                    } );
                }
            } else {
                meta = iNode.fields[fieldName];
                if ( !meta ) {
                    meta = {};
                    iNode.fields[fieldName] = meta;
                }
                meta.stale = true;
                if ( notify ) {
                    model.metadataChanged( identity, fieldName, "stale" );
                }
            }
        }
    }

    function calcRecordValues( model, iNode ) {
        let done = {},
            rec = iNode.record,
            toCalculate = [];

        for ( let i = 0; i < model._calculatedFields.length; i++ ) {
            let fieldName = model._calculatedFields[i],
                value = rec[model.getFieldKey( fieldName )];

            if ( value == null ) { // using == on purpose
                // a calculated field with a null value needs to be calculated
                toCalculate.push( fieldName );
            } else {
                done[fieldName] = 1;
            }
        }
        if ( toCalculate.length > 0 ) {
            doCalculations( model, iNode, toCalculate, false, done );
        }
    }

    const gAggregateFunctions = {
        SUM: {
            name: "SUM",
            init: function( state ) {
                if ( state.dataType && state.dataType !== "NUMBER" ) {
                    throw invalidDataTypeError( "SUM" );
                }
                state.total = 0;
                state.grandTotal = 0;
            },
            add: function( state, value ) {
                value = toNumber( value, state.formatMask ); // assume no display value for number columns
                if ( !isNaN( value ) ) {
                    state.total += value;
                    state.grandTotal += value;
                }
            },
            get: function( state, subTotal ) {
                const result = subTotal ? state.total : state.grandTotal;

                if ( subTotal ) {
                    state.total = 0;
                }
                return result;
            }
        },
        AVG: {
            name: "AVG",
            init: function( state ) {
                if ( state.dataType && state.dataType !== "NUMBER" ) {
                    throw invalidDataTypeError( "AVG" );
                }
                state.total = 0;
                state.grandTotal = 0;
                state.count = 0;
                state.totalCount = 0;
            },
            add: function( state, value ) {
                value = toNumber( value, state.formatMask ); // assume no display value for number columns
                if ( !isNaN( value ) ) {
                    state.total += value;
                    state.grandTotal += value;
                    state.count += 1;
                    state.totalCount += 1;
                }
            },
            get: function( state, subTotal ) {
                const result = subTotal ? state.total / state.count : state.grandTotal / state.totalCount;

                if ( subTotal ) {
                    state.total = 0;
                    state.count = 0;
                }
                return result;
            }
        },
        MAX: {
            name: "MAX",
            init: function( state ) {
                state.max = null;
                state.overallMax = null;
            },
            add: function( state, value ) {
                if ( state.dataType === "NUMBER" ) {
                    value = toNumber( value, state.formatMask );
                // todo dates
                } else {
                    if ( value.d ) {
                        value = value.d; // use the display value
                    }
                }
                if ( value !== null && value.toString().trim() !== "" && !isNaN( value ) ) {
                    if ( state.max === null || value > state.max ) { // todo dates
                        state.max = value;
                    }
                    if ( state.overallMax === null || value > state.overallMax ) {
                        state.overallMax = value;
                    }
                }
            },
            get: function( state, subTotal ) {
                const result = subTotal ? state.max : state.overallMax;

                if ( subTotal ) {
                    state.max = null;
                }
                return result;
            }
        },
        MIN: {
            name: "MIN",
            init: function( state ) {
                state.min = null;
                state.overallMin = null;
            },
            add: function( state, value ) {
                if ( state.dataType === "NUMBER" ) {
                    value = toNumber( value, state.formatMask );
                // todo dates
                } else {
                    if ( value.d ) {
                        value = value.d; // use the display value
                    }
                }
                if ( value !== null && value.toString().trim() !== "" && !isNaN( value ) ) {
                    if ( state.min === null || value < state.min ) { // todo dates
                        state.min = value;
                    }
                    if ( state.overallMin === null || value < state.overallMin ) {
                        state.overallMin = value;
                    }
                }
            },
            get: function( state, subTotal ) {
                const result = subTotal ? state.min : state.overallMin;

                if ( subTotal ) {
                    state.min = null;
                }
                return result;
            }
        },
        MEDIAN: {
            name: "MEDIAN",
            init: function( state ) {
                // todo support dates, current assumes number
                state.values = [];
                state.allValues = [];
            },
            add: function( state, value ) {
                value = toNumber( value, state.formatMask ); // assume no display value for number columns todo dates
                if ( !isNaN( value) ) {
                    state.values.push(value);
                    state.allValues.push(value);
                }
            },
            get: function( state, subTotal ) {
                const a = subTotal ? state.values : state.allValues,
                    len = a.length;
                let result;

                a.sort(function(a, b) { return a - b; } );
                if ( len % 2 === 0 ) {
                    result = (a[len / 2] + a[(len / 2 )- 1]) / 2;
                } else {
                    result = a[(len - 1) / 2];
                }
                if ( subTotal ) {
                    state.values = [];
                }
                return result;
            }
        },
        COUNT: {
            name: "COUNT",
            init: function( state ) {
                state.count = 0;
                state.totalCount = 0;
            },
            add: function( state, value ) {
                if ( value.v ) {
                    value = value.v;
                }
                if ( value !== null && value.toString().trim() !== "" ) {
                    state.count += 1;
                    state.totalCount += 1;
                }
            },
            get: function( state, subTotal ) {
                const result = subTotal ? state.count : state.totalCount;

                if ( subTotal ) {
                    state.count = 0;
                }
                return result;
            }
        },
        COUNT_DISTINCT: {
            name: "COUNT_DISTINCT",
            init: function( state ) {
                state.count = 0;
                state.totalCount = 0;
                state.distinctValues = {}; // todo use a Set
            },
            add: function( state, value ) {
                if ( value.v ) {
                    value = value.v;
                }
                if ( value !== null && value.toString().trim() !== "" ) {
                    if ( !state.distinctValues[value] ) {
                        state.count += 1;
                        state.totalCount += 1;
                    }
                    state.distinctValues[value] = 1;
                }
            },
            get: function( state, subTotal ) {
                const result = subTotal ? state.count : state.totalCount;
                if ( subTotal ) {
                    state.count = 0;
                }
                return result;
            }
        }
    };

    /**
     * @lends model.prototype
     */
    const modelPrototype = {

        /**
         * Return the model id for this model.
         *
         * @return {model.ModelId}
         */
        modelId: function() {
            if ( this.instance === null ) {
                return this.name;
            }
            return [this.name, this.instance];
        },

        _addToFetchRequest: function( pRequestData, pOffset ) {
            let request, thisRegion,
                self = this,
                o = this._options;

            function findFreeOffset( offset ) {
                let i, a = self._data;

                for ( i = offset; i < a.length; i++ ) {
                    if ( a[i] === undefined ) {
                        break;
                    }
                }
                return i;
            }

            if ( o.shape === SHAPE_TABLE ) {
                let srvRecOffset,
                    count = null,
                    pageStart = pageOffset( pOffset, o.pageSize );

                // if clear data is pending want fetch to behave as if there were no data
                if ( !this._clearDataPending ) {
                    pOffset = findFreeOffset( pageStart ); // because of aggregate records may be greater than pageStart
                    if ( ( this._haveAllData && pOffset >= this._data.length ) ||
                            this._masterRecordIsInserted || this._masterRecordIsDeleted ) {
                        return false;
                    }
                }
                if ( o.paginationType === PT_NONE && pOffset !== 0 ) {
                    return false; // when pagination is none must always start at 0.
                }

                srvRecOffset = this._getServerOffset( pOffset );

                if ( o.paginationType !== PT_NONE ) {
                    // the offset may not be on a page boundary
                    // round up count of records so that at least one page size is requested if it fits
                    count = pageStart + o.pageSize - srvRecOffset; // keep the count in server terms
                    if ( count < o.pageSize && this._data[pageStart + o.pageSize] === undefined ) {
                        count += o.pageSize;
                    }
                }
                request = {
                    version: o.version,
                    firstRow: srvRecOffset + 1,
                    maxRows: count
                };
            } else {
                if ( o.shape === SHAPE_RECORD && this._haveAllData ) {
                    return false;
                }

                request = {
                    version: o.version
                };
            }

            // Check if there is an outstanding request
            if ( this._requestsInProgress.fetch ) {
                return null;
            }

            thisRegion = extend( {}, o.regionData, {
                id: o.regionId,
                ajaxIdentifier: o.ajaxIdentifier,
                fetchData: extend( {}, o.fetchData, request )
            } );
            if ( !pRequestData.regions ) {
                pRequestData.regions = [];
            }
            pRequestData.regions.push( thisRegion );

            if ( o.pageItemsToSubmit ) {
                let myPageItems,
                    pageItems = pRequestData.pageItems;

                if ( !pageItems ) {
                    pageItems = [];
                    pRequestData.pageItems = pageItems;
                } else if ( !isArray( pageItems ) ) {
                    // turn list of page item id selectors into an array for easy processing
                    pageItems = idListToArray( pageItems );
                    pRequestData.pageItems = pageItems;
                }
                // pageItems must be an array now
                myPageItems = o.pageItemsToSubmit;
                if ( !isArray( myPageItems ) ) {
                    // turn list of page item id selectors into an array for easy union
                    myPageItems = idListToArray( myPageItems );
                }
                for ( let i = 0; i < myPageItems.length; i++ ) {
                    if ( !pageItems.includes( myPageItems[i] ) ) {
                        pageItems.push( myPageItems[i] );
                    }
                }
            }
            this._addParentItems( thisRegion );

            this._requestsInProgress.fetch = true;

            // return a function that will be called right away after the fetch request is started so
            // that callbacks can be added to the fetch request promise.
            return function ( promise ) {

                promise.done( function ( responseData ) {
                    let processed = false;

                    delete self._requestsInProgress.fetch; // must be gone before processing the data

                    if ( self._destroyed ) {
                        return;
                    }

                    if ( responseData.regions ) {
                        // find our region and instance
                        for ( let i = 0; i < responseData.regions.length; i++ ) {
                            let regionData = responseData.regions[i];

                            if ( regionData.id === o.regionId ) {
                                let data = null,
                                    total = null,
                                    srvRecOffset = null,
                                    moreData = null,
                                    dataOverflow = null;

                                regionData = regionData.fetchedData;
                                if ( o.shape === SHAPE_TABLE ) {
                                    data = regionData.values;
                                    total = regionData.totalRows;
                                    srvRecOffset = regionData.firstRow - 1;
                                    moreData = regionData.moreData;
                                    dataOverflow = regionData.dataOverflow;
                                } else if ( o.shape === SHAPE_TREE ) {
                                    data = regionData.root;
                                } else if ( o.shape === SHAPE_RECORD ) {
                                    data = regionData.value;
                                }
                                if ( data || o.shape === SHAPE_RECORD ) {
                                    self._checkClearPending();
                                    self._addData( pOffset, srvRecOffset, data, total, moreData, dataOverflow );
                                    processed = true;
                                }
                            }
                        }
                    }
                    if ( !processed ) {
                        let error = makeAjaxError( BAD_RESPONSE );

                        debug.error( "Failed to fetch data.", error );
                        responseData.error = error;
                    }
                } ).fail( function ( /* jqXHR, textStatus, errorThrown */ ) {
                    delete self._requestsInProgress.fetch;
                } );
            };
        },

        /**
         * <p>Retrieve model data from the server. Data is requested starting at the given offset (or 0 if offset is
         * not given). Data is fetched in model option <code class="prettyprint">pageSize</code> chunks.
         * Can use either the callback argument or the returned promise to determine when the request is complete.</p>
         *
         * @param {number=} pOffset Zero based offset of the data to fetch. Only applies to table shape
         *                           models. This is rarely needed because table data is automatically fetched as
         *                           needed when requested via the {@link model#forEachInPage} method.
         *                           Omit this parameter when not needed.
         * @param {function} [pCallback] A function to call when the request is complete. The callback is passed an
         *                           Error argument only if there is an error.
         * @param {boolean} [pNoProgress] Set to true to not show progress during the fetch.
         * @return {promise} A promise if the fetch is initiated, null if there is already a fetch in progress,
         * and false if <code class="prettyprint">pOffset</code> is beyond the end of the data or master record is
         * inserted or deleted or if <code class="prettyprint">pOffset</code> != 0
         * when <code class="prettyprint">paginationType</code> is "none".
         * If and only if a promise is returned, <code class="prettyprint">pCallback</code> will be called.
         * It receives no arguments when resolved and an <code class="prettyprint">Error</code> argument when rejected.
         * @fires model#event:addData
         */
        fetch: function( pOffset, pCallback, pNoProgress ) {
            let p, cb, promiseRet, requestOptions,
                o = this._options,
                deferred = makeDeferred(),
                requestData = {};

            if ( typeof pOffset !== "number" ) {
                pNoProgress = pCallback;
                pCallback = pOffset;
                pOffset = 0;
            }

            cb = this._addToFetchRequest( requestData, pOffset );
            if ( !cb ) {
                return cb; // could be null or false
            }

            requestOptions = extend( {}, o.requestOptions );
            if ( pNoProgress ) {
                delete requestOptions.loadingIndicator;
            } else {
                requestOptions.loadingIndicator = makeLoadingIndicatorFunction( this );
            }

            p = this._callServer( requestData, requestOptions );
            cb( p );
            p.done( responseData => {
                if ( responseData.error ) {
                    deferred.reject( responseData.error );
                } else if ( responseData.errors ) {
                    deferred.reject( responseData.errors );
                } else {
                    deferred.resolve();
                }
            } ).fail( ( jqXHR, textStatus, errorThrown ) => {
                deferred.reject( makeAjaxError( "Error fetching data.", jqXHR, textStatus, errorThrown ) );
            } );

            promiseRet = deferred.promise();
            promiseRet.always( err => {
                if ( this._destroyed ) {
                    return;
                }

                if ( pCallback ) {
                    pCallback( err );
                }
                this._drainWaiters( err );
            } );
            return promiseRet;
        },

        /**
         * <p>Fetch all the data from the server into the model. This repeatedly calls {@link model#fetch} until the
         * server reports there is no more data. This is only for table shape models.
         * Data is fetched in chunks that may be larger than model option <code class="prettyprint">pageSize</code>.
         * Since all the data is to be loaded the intent is to do so in fewer ajax requests.</p>
         * <p>Use with caution. Loading too much data onto the client can take a long time and cause the browser to
         * become unresponsive.</p>
         *
         * @param {function} pCallback Function that is called after each fetch completes. It receives an object with properties:
         * <ul>
         *   <li>offset: the current offset in the model that was just added</li>
         *   <li>total: total records in the model (see {@link model#getTotalRecords})</li>
         *   <li>done: true if all the data is fetched false otherwise. When true this is the last time the callback is called.</li>
         * </ul>
         * @param {boolean} [pNoProgress=true] Set to false to show progress during fetch. Set to true
         *   to hide progress spinner during fetch. The default is true.
         * @example <caption>This example fetches all the data before using {@link model#forEach} to loop over the records.</caption>
         * model.fetchAll( function( status ) {
         *     if ( status.done ) {
         *         model.forEach( function( record, index, id ) {
         *             // do something with each record
         *         } );
         *     }
         * } );
         */
        fetchAll: function( pCallback, pNoProgress = true ) {
            const self = this,
                o = this._options,
                savePageSize = o.pageSize,
                scopeName = "m" + this.modelId();
            let count, loadingIndicator, loading$,
                offset = 0;

            function load() {
                const r = self.fetch( offset, function( err ) {
                    if (err) {
                        pCallback({
                            error: err
                        });
                    } else {
                        // todo think: the offset reported here is what fetch was called with and not
                        //   what fetch asked the server for.
                        pCallback({
                            offset: offset,
                            total: self.getTotalRecords(),
                            done: false
                        });
                        offset += count;
                        load();
                    }
                }, true ); // no progress because want progress to bracket all the requests
                if ( r === null ) {
                    // request in progress wait and try again
                    setTimeout( function() {
                        load();
                    }, 500 );
                } else if ( r === false ) {
                    // restore the page size to what it was
                    o.pageSize = savePageSize;
                    if ( loadingIndicator ) {
                        util.delayLinger.finish( scopeName, function() {
                            if ( isFunction( loading$ ) ) {
                                loading$();
                            } else {
                                loading$.remove();
                            }
                        } );
                    }
                    // done
                    pCallback({
                        offset: offset,
                        total: self.getTotalRecords(),
                        done: true
                    });
                }
            }

            if ( o.shape !== SHAPE_TABLE ) {
                throw invalidShapeError( "fetchAll" );
            }

            /*
             * The pageSize is intended to get small amounts of data over time. Enough to satisfy view requests
             * balanced with the likelihood that the user may never bother to look at it all.
             * But in this case all the data is to be fetched at once so it makes sense to request more data
             * to reduce the number of requests.
             * This assumes that no other fetch request will interrupt these fetchAll initiated fetch requests
             * todo consider if can be smarter about choosing a size
             */
            if ( savePageSize < 1000 ) {
                o.pageSize = 1000;
            }
            count = o.pageSize;

            if ( !pNoProgress ) {
                const loadingIndicatorTmpl$ = $( '<span class="u-Processing u-Processing--inline"><span class="u-Processing-spinner"></span></span>' );

                loadingIndicator = makeLoadingIndicatorFunction( this );
                if ( loadingIndicator ) {
                    util.delayLinger.start( scopeName, function () {
                        loading$ = loadingIndicator( loadingIndicatorTmpl$ );
                    } );
                }
            }

            // todo make more efficient by knowing where the holes are or at least the end of starting contiguous rows
            //   and don't fetch what already have
            while ( this._data[offset] ) {
                offset += 1;
            }

            load();
        },

        /**
         * <p>Fetches fresh data from the server for the given records. The existing records in the model are replaced
         * with the new returned record from the server. The model must have a <code class="prettyprint">identityField</code>
         * option defined for this to work.
         * Can use either the callback argument or the returned promise to determine when the request is complete.</p>
         *
         * @param {model.Record} pRecords Array of records to be fetched.
         * @param {function} [pCallback] A function to call when the request is complete. The callback is passed an
         *  Error argument only if there is an error.
         * @return {promise} A promise that receives no arguments when resolved and an Error argument when rejected.
         *  If there are no records to fetch then null is returned and <code class="prettyprint">pCallback</code> is not called.
         * @fires model#event:refreshRecords
         * @example <caption>This example fetches the selected records from interactive grid with static id "emp".
         * There is often no need know when the Ajax request completes because the view is updated from model
         * notifications.</caption>
         * var model = apex.region( "emp" ).call( "getCurrentView" );
         * model.fetchRecords( apex.region( "emp" ).call( "getSelectedRecords" );
         */
        fetchRecords: function( pRecords, pCallback ) {
            let p, promiseRet, requestData, requestOptions, thisRegion,
                o = this._options,
                keys = [],
                deferred = makeDeferred();

            if ( o.shape === SHAPE_RECORD ) {
                throw invalidShapeError( "fetchRecords" );
            }
            if ( this._identityKeys === undefined ) {
                throw identityFieldRequiredError();
            }

            for ( let i = 0; i < pRecords.length; i++ ) {
                let id = this._getIdentity( pRecords[i] ),
                    iNode = this.getRecordMetadata( id );

                if ( iNode && !iNode.inserted ) {
                    keys.push( { recordId: id, pk: this._getPrimaryKey( pRecords[i] ) } );
                }
            }

            if ( keys.length === 0 )  {
                return null;
            }

            thisRegion = extend( {}, o.regionData, {
                id: o.regionId,
                ajaxIdentifier: o.ajaxIdentifier,
                fetchData: extend( {}, o.fetchData, {
                    version: o.version,
                    primaryKeys: keys
                } )
            } );
            requestData = {
                regions: [ thisRegion ]
            };
            if ( o.pageItemsToSubmit ) {
                requestData.pageItems = o.pageItemsToSubmit;
            }
            this._addParentItems( requestData.regions[0] );

            requestOptions = makeRequestOptions( o, this );
            p = this._callServer( requestData, requestOptions );
            p.done( responseData => {
                let data;

                if ( this._destroyed ) {
                    return;
                }

                if ( responseData.regions && responseData.regions.length > 0 ) {
                    let region = responseData.regions[0];

                    // only expect to get response data for this model/region so it is in first and only region
                    // but do make sure it is for us
                    if ( region.fetchedData && region.id === o.regionId ) {
                        data = region.fetchedData.values;
                    }
                }

                if ( data ) {
                    // the response should include a record for each one we asked for. If it doesn't exist (within the SQL where clause) it is marked not found
                    // todo is this different for trees?
                    this._updateData( data );
                    deferred.resolve();
                } else {
                    let error = makeAjaxError( BAD_RESPONSE );

                    debug.error( "Failed update data.", error );
                    deferred.reject( error );
                }
            } ).fail( function( jqXHR, textStatus, errorThrown ) {
                deferred.reject( makeAjaxError( "Error fetching records.", jqXHR, textStatus, errorThrown ) );
            } );

            promiseRet = deferred.promise();
            if ( pCallback ) {
                promiseRet.always( pCallback );
            }
            return promiseRet;
        },

        /**
         * <p>Save all changed model data to the server. The current changes are copied to the save request except
         * that volatile fields are not included (they are omitted/deleted i.e. not null or undefined) and the metadata
         * has the <code class="prettyprint">op</code> property added with value "d" if the record was deleted,
         * "i" if the record was inserted, and "u" if the record was updated.
         * If the record has no metadata field defined then one is added. For array
         * records it is the last element, for object records it is property <code class="prettyprint">_meta</code>.</p>
         *
         * <p>It is possible to continue making changes to the model while a save is in progress.
         * Can use either the callback argument or the returned promise to determine when the request is complete.</p>
         *
         * <p>See also {@link apex.model.save}.</p>
         *
         * @param {function} [pCallback] A function to call when the save request is complete.
         *                           callback( error, responseData );
         *                           The callback is passed an Error argument or array of server errors only
         *                           if there is an error. Otherwise, error is null.
         * @return {promise} A promise if the save is initiated and null otherwise (there is already a save in progress or
         * there is nothing to save). If and only if a promise is returned, pCallback will be called. The promise receives no
         * arguments when resolved and an Error argument when rejected.
         */
        // todo improve doc of save error format and response data.
        save: function( pCallback ) {
            let p, cb, promiseRet,
                o = this._options,
                requestOptions = makeRequestOptions( o, this ),
                deferred = makeDeferred(),
                requestData = {};

            cb = this.addChangesToSaveRequest( requestData );
            if ( !cb ) {
                return null;
            }
            p = this._callServer( requestData, requestOptions );
            cb( p );
            p.done( function( responseData ) {
                if ( responseData.errors ) {
                    deferred.reject( responseData.errors );
                } else if ( responseData.error ) {
                    deferred.reject( responseData.error );
                } else {
                    deferred.resolve( null, responseData );
                }
            } ).fail( function( jqXHR, textStatus, errorThrown ) {
                deferred.reject( makeAjaxError( "Error saving data.", jqXHR, textStatus, errorThrown ) );
            } );
            promiseRet = deferred.promise();
            if ( pCallback ) {
                promiseRet.always( pCallback );
            }
            return promiseRet;
        },

        /**
         * Determine if a save operation is in progress. Only exposed for use by unit tests.
         *
         * @ignore
         * @return {boolean} true if currently saving the model, false otherwise
         */
        saveInProgress: function() {
            return !!this._requestsInProgress.save;
        },

        /**
         * Rarely needed. Only useful if making your own call to the server.
         * See {@link model#save}, {@link apex.model.addChangesToSaveRequest}, and {@link apex.model.save}.
         *
         * @param {object} pRequestData An empty or partially filled in object to which changes for this model will be added.
         */
        addChangesToSaveRequest: function( pRequestData ) {
            let field, key, iNode, regions, region, models, modelSaveData,
                self = this,
                o = this._options,
                metaDestKey = this._metaKey, // only correct when record is an object see below where it is fixed
                toDelete = [],
                saveFields = [],
                saveFieldsMap = {}, // map fieldKey -> field name
                saveData = [],
                totalFields = 0;

            function changesNotSaved() {
                delete self._requestsInProgress.save;
                // if the save fails then all the pending changes didn't get saved so they are still changes again
                // todo but what if there are conflicts with changes done during the save?
                self._changes = self._pendingChanges.concat(self._changes);
            }

            function copyRecord( iNode ) {
                let copy, value, key, op, idIsGenerated, fieldName,
                    record = iNode.record;

                // if the node is inserted and there is no originalId it means that the user never edited any identity fields so the ids must be generated
                idIsGenerated = iNode.inserted && !iNode.originalId;

                if ( o.recordIsArray ) {
                    copy = [];
                } else {
                    copy = {};
                }
                for ( let i = 0; i < saveFields.length; i++ ) {
                    key = saveFields[i];
                    value = record[key];
                    if ( value !== null && objectWithValue( value ) ) {
                        value = value.v;
                    }
                    // APEX has well established but somewhat non-standard behavior related to disabled fields
                    // A disabled field is not submitted, which in other frameworks typically means no change on the server,
                    // but because of the way APEX maps request parameters to PL/SQL procedure parameters something
                    // not submitted is null and that is the same as an empty string. So by disabling something on
                    // submit you have set it to null/empty string on the server. The model preserves this behavior.
                    fieldName = saveFieldsMap[key];
                    if ( iNode.fields && iNode.fields[fieldName] && iNode.fields[fieldName].disabled ) {
                        value = ""; // disabled values are empty
                    }
                    // never send a generated id to the server as part of the record
                    if ( idIsGenerated && self.isIdentityField(fieldName) && ( !iNode.original || value === iNode.original[key] ) ) {
                        value = "";
                    }
                    // With normal HTML forms the way to submit multi-line text is with a textarea and the
                    // standard says that textareas use \r\n for new lines. But the JavaScript convention for new lines is \n.
                    // For consistency with forms models also use \r\n for new line.
                    if ( typeof value === "string" ) {
                        value = value.replace( /\n/g, "\r\n" );
                    }

                    if ( o.recordIsArray ) {
                        copy.push( copyItem( value ) );
                    } else {
                        copy[key] = copyItem( value );
                    }
                }
                // todo the copy will just have the initial metadata; could be out of date?
                op = null;
                if ( iNode.deleted ) {
                    op = "d";
                } else if ( iNode.inserted ) {
                    op = "i";
                } else if ( iNode.updated ) {
                    op = "u";
                }
                if ( !copy[metaDestKey] ) {
                    copy[metaDestKey] = {};
                }
                if ( op ) {
                    copy[metaDestKey].op = op;
                }
                copy[metaDestKey].recordId = self._getIdentity( record );
                if ( iNode.originalId ) {
                    copy[metaDestKey].originalId = iNode.originalId;
                }
                if ( o.saveSelection ) {
                    copy[metaDestKey].sel = iNode.sel ? "Y" : "N";
                }

                saveData.push( copy );
            }

            // add page items to submit if we have any
            if ( o.pageItemsToSubmit ) {
                let myPageItems,
                    pageItems = pRequestData.pageItems;

                if ( !pageItems ) {
                    pageItems = [];
                    pRequestData.pageItems = pageItems;
                }
                // if pageItems is not an array it means that page items have already been processed and it
                // should be a full page request which means that all page items are included.
                if ( isArray( pageItems ) ) {
                    myPageItems = o.pageItemsToSubmit;
                    if ( !isArray( myPageItems ) ) {
                        // turn list of page item id selectors into an array for easy union
                        myPageItems = idListToArray( myPageItems );
                    }
                    for ( let i = 0; i < myPageItems.length; i++ ) {
                        if ( !pageItems.includes( myPageItems[i] ) ) {
                            pageItems.push( myPageItems[i] );
                        }
                    }
                }
            }

            // if there are no changes or a save on this model is in progress then do nothing
            if ( this._requestsInProgress.save || ( this._changes.length === 0 && !o.saveSelection ) ) {
                return null;
            }

            // todo could do this just once
            for ( let i in o.fields ) {
                if ( hasOwnProperty( o.fields, i ) ) {
                    field = o.fields[i];
                    if ( !field.virtual ) {
                        totalFields += 1;
                    }
                    if ( !field.volatile && !field.virtual ) {
                        key = o.recordIsArray ? field.index : i;
                        saveFields.push( key );
                        saveFieldsMap[key] = i;

                        if ( o.recordIsArray && field.index === this._metaKey ) {
                            metaDestKey = saveFields.length - 1;
                        }
                    }
                }
            }
            if ( o.recordIsArray ) {
                saveFields.sort( function(a,b) {
                    return a - b;
                } );
            }
            // if the records don't have a metadata field then add one.
            if ( !metaDestKey ) {
                if ( o.recordIsArray ) {
                    metaDestKey = saveFields.length;
                } else {
                    metaDestKey = "_meta";
                }
            }

            // see if there are any auto inserted records that shouldn't be saved.
            for ( let i = 0; i < this._changes.length; i++ ) {
                iNode = this._changes[i];
                if ( iNode.autoInserted && !iNode.updated ) {
                    // skip records that were auto inserted and never updated.
                    // Note in theory this can result in nothing to save but using isChanged first will tell you if there is nothing to save
                    toDelete.push( iNode.record );
                }
            }
            if ( toDelete.length ) {
                this.deleteRecords( toDelete );
            }

            // copy all the changes
            for ( let i = 0; i < this._changes.length; i++ ) {
                iNode = this._changes[i];
                copyRecord( iNode );
            }
            this._pendingChanges = this._changes;
            this._changes = [];

            if ( o.saveSelection ) {
                // todo need to send to the server the select all indication
                for ( const iNode of this._selection.values() ) {
                    // don't copy if it was already copied because it is changed
                    if ( !( iNode.inserted || iNode.deleted || iNode.updated ) ) {
                        copyRecord( iNode );
                    }
                }
            }

            // find region to add changes to
            regions = pRequestData.regions;
            if ( !regions ) {
                pRequestData.regions = regions = [];
            }
            for ( let i = 0; i < regions.length; i++ ) {
                region = regions[i];
                if ( region.id === o.regionId ) {
                    break;
                }
                region = null;
            }
            // if no existing region found add one
            if ( !region ) {
                region = extend( {}, o.regionData, {
                    id: o.regionId,
                    ajaxIdentifier: o.ajaxIdentifier,
                    saveData: {
                        models: []
                    }
                } );
                regions.push( region );
            }
            models = region.saveData.models;
            modelSaveData = extend( {}, o.saveData, {
                instance: this.instance,
                version: o.version,
                values: saveData
            } );
            this._addParentItems( modelSaveData );
            models.push( modelSaveData );

            this._requestsInProgress.save = true;
            // return a function that will be called right away after the save request is started so
            // that callbacks can be added to the save request promise.
            return function( promise ) {
                promise.done( function( responseData ) {
                    let regionData,
                        metaKey; // intentionally undefined

                    if ( self._destroyed ) {
                        return;
                    }

                    if ( responseData.errors ) {
                        // go through all the errors
                        for ( let i = 0; i < responseData.errors.length; i++ ) {
                            let error = responseData.errors[i],
                                errorMessage = error.message;

                            // the server by default pre-escapes the error message and marks it as not unsafe,
                            //  but the model expects an unescaped message as it's up to the view to re-escape it accordingly
                            if ( !error.unsafe ) {
                                errorMessage = util.unescapeHTML( errorMessage );
                            }

                            // if the region id matches and the error pertains to a record and has a matching instance then it is for this model
                            // todo Model used to check if error.regionStaticId === o.regionId and it worked now it fails
                            // using == on purpose because server omits nulls
                            if ( error.regionStaticId === o.regionStaticId && error.recordId && error.instance == self.instance ) { // eslint-disable-line eqeqeq
                                self.setValidity( "error", error.recordId, error.columnName || null, errorMessage );
                            }
                        }
                        changesNotSaved();
                    } else if ( responseData.regions ) {
                        // find our region and instance
                        let models,
                            processed = false,
                            data = null;

                        for ( let i = 0; i < responseData.regions.length; i++ ) {
                            regionData = responseData.regions[i];
                            if ( regionData.id === o.regionId ) {
                                models = regionData.fetchedData.models;
                                for ( let j = 0; j < models.length; j++ ) {
                                    // The == test is intentional because when instance is null the server may not return a property at all
                                    if ( models[j].instance == self.instance ) { // eslint-disable-line eqeqeq
                                        data = models[j].values;
                                        // if there is no metadata key defined there may still be record metadata because of inserts
                                        if ( !self._metaKey ) {
                                            if ( o.recordIsArray ) {
                                                metaKey = totalFields;
                                            } else {
                                                metaKey = "_meta";
                                            }
                                        }

                                        if ( data ) {
                                            self._updateData( data, metaKey );
                                            processed = true;
                                        }
                                        break;
                                    }
                                }
                                break;
                            }
                            regionData = null;
                        }
                        // todo think what if some models are processed correctly and some not
                        if ( !processed ) {
                            let error = makeAjaxError( BAD_RESPONSE );

                            debug.error( "Failed update data after save.", error );
                            responseData.error = error;
                            // The server may have processed the data correctly (or not) and just messed up the response
                            // let the changes be cleared because trying again probably won't help; this situation is
                            // very unexpected.
                            // The changes are cleared but because the data is not updated the metadata on
                            // rows and columns remains as if not saved.
                        }
                        self._clearChanges( "_pendingChanges" );
                    }
                    delete self._requestsInProgress.save;
                } ).fail( function( /* jqXHR, textStatus, errorThrown */ ) {
                    changesNotSaved();
                } );

            };
        },

        /**
         * <p>Give the model data. This is used in cases where the model doesn't get data from the server or at least
         * not using the built-in mechanisms or when the model is created without any initial data.</p>
         *
         * @param {array} pData Model data to set.
         * @param {number} [pOffset] Offset at which to add the data. Defaults to 0.
         *   If adding the root of a tree shape model set this to null;
         * @param {number} [pTotal] Total number of records in the server's collection. Only applies for
         *   table shape models.
         * @param {boolean} [pMoreData] If true there is more data available on the server for this model. If false
         *   <code class="prettyprint">pData</code> contains all the data. If omitted or null determine if there is more
         *   data based on <code class="prettyprint">pData</code> and <code class="prettyprint">pTotal</code>.
         *   If <code class="prettyprint">pTotal</code> is not given assume there is more data on server.
         *   Only applies for table shape models and only if
         *   <code class="prettyprint">paginationType</code> is not "none".
         * @fires model#event:refresh
         * @fires model#event:addData
         */
        setData: function( pData, pOffset = 0, pTotal = null, pMoreData = false ) {
            let change = {
                clearDataPending: false
            };

            if ( this._options.shape === SHAPE_TABLE ) {
                change.keepPagination = false;
            }
            if ( pTotal === null && pData && !pMoreData ) {
                pTotal = pData.length;
            }
            // offset 0 will result in _clear being called
            // note: by using pOffset for both the model offset and the server's recordOffset this assumes there are
            // no aggregate records
            this._checkClearPending();
            this._addData( pOffset, pOffset, pData, pTotal, pMoreData, false );
            if ( pOffset === 0 || pOffset === null ) {
                notifyChange( this, N_REFRESH, change );
            }
        },

        /**
         * <p>Remove all data from the model. This is called by view layers to indicate that the model should
         * be refreshed with new data from the server. The model sends a refresh notification and the views
         * respond by requesting new data with {@link model#fetch} or {@link model#forEachInPage}.
         * The <code class="prettyprint">delayClearData</code> option controls when the data is actually cleared.</p>
         * <p>When <code class="prettyprint">delayClearData</code> is false the data is cleared right away, before
         * the refresh notification is sent, and the view should remove the displayed data or block all interaction
         * with it, because there is no data backing it in the model.</p>
         * <p>When <code class="prettyprint">delayClearData</code> is true the data will be cleared when the
         * next {@link model#fetch} request completes. The view can continue to display the current data until fetch
         * completes. The model will not allow editing while clear data is pending.
         * </p>
         *
         * @param {boolean} [pNotify] If false don't send the refresh notification.
         *   The default is true to send the refresh notification.
         * @returns {boolean} true for success and false if the model is not cleared because fetch or save
         *  requests are in progress.
         * @fires model#event:refresh
         * @example <caption>Clear the data for a model. This will typically cause any views to refresh, which results
         * in requesting new data from the model.</caption>
         * myModel.clearData();
         * @example <caption>See example for {@link apex.model.multipleFetch}.</caption>
         */
        // todo doc pKeepPagination only for table shape models
        clearData: function( pNotify = true, pKeepPagination = false ) {
            const o = this._options;
            let requestsInProgress = this._requestsInProgress,
                change = {
                    clearDataPending: false
                };

            // If there is a request in progress don't clear (see bug 34023939)
            // todo should this apply to fetchRecords and fetchChildNodes?
            if ( requestsInProgress.fetch || requestsInProgress.save ) {
                return false;
            }
            if ( o.shape === SHAPE_TABLE ) {
                change.keepPagination = Boolean( pKeepPagination );
            }

            if ( o.delayClearData ) {
                this._clearDataPending = true;
                change.clearDataPending = true;
            } else {
                this._clear();
            }
            if ( pNotify ) {
                notifyChange( this, N_REFRESH, change );
            }
            return true;
        },

        /**
         * <p>Returns the total number of records in the model collection or -1 if unknown.</p>
         *
         * <p>For table shape models the total number of records may not be known or it may be an estimate.
         * If the pagination type is "none" then the total records is known and it is the same as what is
         * in the collection.
         * If the pagination type is "progressive" and the model has paged to the end (all pages
         * have been received and the server has said there is no more) then the total records is known and it
         * is the same as what is in the collection (which could be different from what is actually on the server).
         * If the server has told the model how many records it has then that is returned. This is an estimate of what
         * the client model may eventually hold. This value may change as new pages are fetched.
         * If the server has not told the model how many records it has then the total is unknown.
         * </p>
         * <p>For tree shape models the total number of nodes is only available when the model
         * defines the <code class="prettyprint">identityField</code> option. The total doesn't include nodes
         * that have not yet been fetched and never returns -1 (unknown) even if there are nodes that haven't been
         * fetched. If there is no <code class="prettyprint">identityField</code> this returns 0.
         * </p>
         * <p>For record shape the number is always 1 unless <code class="prettyprint">pCurrentTotal</code> is true
         * and there is no record in which case it returns 0.</p>
         *
         * <p>Note: Includes records that are marked for delete in the count.
         * Also includes aggregate records if any in the count.</p>
         *
         * @param {boolean} [pCurrentTotal] If true, for table shape models will return the current total
         *   records in the collection rather than -1 if the total records is unknown.
         *   If true, for record shape models will return 0 if the record is null.
         * @return {number} The number of records or -1 if unknown.
         */
        getTotalRecords: function( pCurrentTotal ) {
            let o = this._options;

            if ( o.shape === SHAPE_TABLE ) {
                if ( this._haveAllData || o.paginationType === PT_NONE ) {
                    return this._data.length;
                } // else
                if ( this._totalRecords < 0 && pCurrentTotal !== true ) {
                    return this._totalRecords; // unknown
                } // else
                return Math.max( this._data.length, this._totalRecords ); // estimate based on what the server has reported
            } else if ( o.shape === SHAPE_RECORD ) {
                return ( pCurrentTotal && this._data === null ) ? 0 : 1;
            } else if ( o.shape === SHAPE_TREE ) {
                return this._index.size;
            }
        },

        /**
         * <p>Returns the total number of records from the server's perspective or -1 if unknown.</p>
         *
         * <p>For table shape models the server provides the total but for editable grids the number of inserted records
         * is added and the number of deleted records subtracted. This is so the number reflects what is likely
         * to be on the server after changes are saved.</p>
         *
         * <p>For tree shape models this is not supported; returns -1.</p>
         *
         * <p>For record shape models the number is always 1.</p>
         *
         * <p>Note: Aggregate records are never included.</p>
         *
         * @return {number} The number of records or -1 if unknown.
         */
        getServerTotalRecords: function() {
            const o = this._options;

            if ( o.shape === SHAPE_TABLE ) {
                if ( this._totalRecords < 0 ) {
                    return this._totalRecords; // unknown
                }
                return this._totalRecords + this._numInsertedRecords - this._numDeletedRecords;
            } else if ( o.shape === SHAPE_RECORD ) {
                return 1;
            } else if ( o.shape === SHAPE_TREE ) {
                // todo consider if the server could specify the total like it does for tables
                return -1;
            }
        },

        /**
         * <p>Return true if the number of records in the data set on the server exceeds some server
         * configured maximum. A server may put a limit on how much data it is willing to return. If
         * the amount of data requested exceeds this limit it will indicate that there is data overflow.
         * This method allows a UI layer to alert the user that there is more data than they can see.
         * Typically, the UI layer would allow filtering so that a reasonable amount of data is returned.</p>
         *
         * @return {boolean}
         * @example <caption>This example determines if there is data overflow.</caption>
         * let tooMuchData = model.getDataOverflow();
         * // tooMuchData is true if the server has indicated that it has more data than it is willing or able
         * // to return to the client.
         */
        getDataOverflow: function() {
            return !!this._dataOverflow;
        },

        /**
         * This callback is used by the {@link model#forEach} and {@link model#forEachInPage} methods.
         *
         * @callback model.IteratorCallback
         * @param {model.Record} pRecord The current record.
         * @param {number} pIndex The zero based index within the model collection of the current record.
         * @param {string} pId The identity of the current record if the model
         *   <code class="prettyprint">identityField</code> option is given. If there is no identity then this is
         *   undefined for tree models and is the <code class="prettyprint">pIndex</code> as a string for table models.
         * @param {Error} [pError] If and only if there is an error fetching data during a call to
         *   {@link model#forEachInPage} this is the error object otherwise this is false or undefined.
         */

        /**
         * <p>Iterate over the model collection. Calls <code class="prettyprint">pCallback</code> for each record in the model.
         * Similar to <code class="prettyprint">Array.prototype.forEach</code>. The model shape must be table or tree.
         * This will never fetch new data. This includes aggregate records if any.
         * For shape tree see also {@link model#walkTree}.</p>
         *
         * <p>The callback receives the record, the zero based index of the record, and the identity (recordId)
         * of the record.</p>
         *
         * @param {model.IteratorCallback} pCallback Function called for each record in the model collection.
         *     The function is given the current record, index, and id.
         * @param {*} [pThisArg] Value to use as <code class="prettyprint">this</code>
         *     when calling <code class="prettyprint">pCallback</code>.
         * @example <caption>This example calculates the total of field SALARY for all the records that are
         * currently in the model. Deleted and aggregate records are skipped.</caption>
         * var total = 0;
         * model.forEach( function( record, index, id ) {
         *     var salary = parseFloat( model.getValue( record, "SALARY" ) ),
         *         meta = model.getRecordMetadata( id );
         *
         *     if ( !isNaN( salary ) && !meta.deleted && !meta.agg ) {
         *         total += salary;
         *     }
         * } );
         * // do something with total
         */
        forEach: function( pCallback, pThisArg ) {
            const o = this._options,
                a = this._data;

            if ( o.shape === SHAPE_RECORD ) {
                throw invalidShapeError( "forEach" );
            } else if ( o.shape === SHAPE_TREE) {
                let i = 0;

                if ( a ) {
                    this.walkTree(a, {
                        node: ( node ) => {
                            callForEachCallback( pThisArg, pCallback, node, i, this._getIdentity( node ) );
                            i += 1;
                        }
                    });
                }
            } else {
                const len = a.length;

                // todo THINK in the virtual paging case this is very inefficient
                for ( let i = 0; i < len; i++ ) {
                    let rec = a[i];

                    if ( rec ) {
                        callForEachCallback( pThisArg, pCallback, rec, i, this._getIdentity( rec, i ) );
                    }
                }
            }
        },

        /*
         * TODO doc fetchData option when ready
         * @param {number} pOptions.count Count of records starting at offset to process. If fetchData is false defaults
         *                          to all the data currently in the model. If fetchData is true defaults to the models
         *                          pageSize option. If fetchData is true and count is -1 then all the data will be fetched
         *                          in pageSize chunks. todo this is async
         * @param {boolean} pOptions.fetchData: If true allow more data to be fetched as needed by using forEachInPage otherwise
         *                          forEach is used to loop over the records that are currently in the model.
         * @param {function} pOptions.done: function( data ) todo to support async
         */
        /**
         * <p>Transform a copy of the table shape model data into another data structure according to the provided template rules.
         * The transformed output data structure is returned.</p>
         *
         * @param {Object} pOptions An object with properties that define how the model data is to be transformed.
         *     All properties are optional except for template.
         * @param {Object[]} pOptions.template An array of rule objects each one describing where and how to create an array
         *                           in the output data. Each rule object can have these properties:
         * @param {string} pOptions.template.path A "/" separated list of property names or indexed fields. The path specifies
         *      where in the output object structure to create an (or use existing) array to
         *      add items to. For example a path of "a/b" will result in output:
         *  <pre class="prettyprint"><code>
         *  {
         *      a: {
         *          b: [&lt;items go here>]
         *      }
         *  }
         *  </code></pre>
         *      <p>An indexed field is the name of a record field wrapped in square brackets.
         *      This creates an array for each unique value of the field. For example a path
         *      of "a/[ENABLED]/b" where the field ENABLED can have values of "yes" and "no" results in output:</p>
         *  <pre class="prettyprint"><code>
         *  {
         *      a: [
         *          {
         *              b: [&lt;items for records with enabled = yes go here>]
         *          },
         *          {
         *              b: [&lt;items for records with enabled = no go here>]
         *          }
         *      ]
         *  }
         *  </code></pre>
         * @param {function} pOptions.template.filter Filter function( model, record, index, id) return true to
         *     include and return false to skip the given record.
         * @param {string} pOptions.template.uniqueIndexField The name of a record field. If given an item will be added
         *     to the array only for the first record with a unique value of this field.
         * @param {Object|Array|string|function} pOptions.template.item An object, string, array or function that
         *     serves as a template for the elements/items of the output array the resulting value depends on the type:
         *     <ul>
         *         <li>string: A string is the name of a record field and the resulting value is the value of that field or
         *           if it begins and ends with a single quote then the value is the text inside the single quotes or
         *           if it begins with ( and ends with ) the string inside the parens is the
         *           name of a record field and the resulting value is the raw value of that field not the display value
         *           or <code class="prettyprint">showNullAs</code> value.</li>
         *         <li>function: The resulting value is the return value of the function
         *           f(pContext, self, record, index, id)</li>
         *         <li>object: the resulting value is a new object where the properties of the new object
         *           are the same as the properties of this template object and the value of
         *           the properties support the same options as item.</li>
         *         <li>array: The resulting value is a new array where the value items in the new array
         *           come from the template items in this array. The template items support the same
         *           options as item.</li>
         *     </ul>
         * @param {string} pOptions.template.sort A function suitable as the argument to
         *     <code class="prettyprint">Array.prototype.sort</code> that will sort the output array after all
         *     records are processed.
         * @param {function} pOptions.filter Filter function( model, record, index, id) return true to include and
         *     return false to skip the given record.
         * @param {string} pOptions.showNullAs A string to substitute for null field values.
         * @param {boolean} pOptions.includeAggregates If true aggregate records are included otherwise they are
         *     skipped this is done before the <code class="prettyprint">filter</code> function is called.
         * @param {number} pOptions.offset Offset index of first record to process defaults to 0.
         * @param {number} pOptions.count Count of records starting at <code class="prettyprint">offset</code>
         *    to process. Defaults to all the data currently in the model.
         * @param {Object} [pContext] This is the output object to return with data arrays filled in based on the
         *    template rules. If pContext is not given an empty object is used as a starting point. All functions
         *    are called in the context of this object. Note: if the template rule(s) don't
         *    have a path then pContext can be an array.
         * @return {Object} The output data structure. Same object as <code class="prettyprint">pContext</code> if it was given.
         *
         * @example <caption>The following example generates groups and series data for a jet Bar chart from a model
         * created from:<br>
         *     select job, deptno, avg(sal) as avg_sal from emp group by job, deptno</caption>
         *
         * var data = mymodel.transform( {
         *              template: [ {
         *                      path: "groups",
         *                      uniqueIndexField: "DEPTNO",
         *                      item: { name: "DEPTNO" }
         *                  }, {
         *                      path: "series",
         *                      uniqueIndexField: "JOB",
         *                      item: { name: "JOB" }
         *                  }, {
         *                      path: "series/[JOB]/items",
         *                      item: { label: "'AVG_SAL'",
         *                              value: "AVG_SAL",
         *                              name: "DEPTNO"
         *                          }
         *                  } ]
         *              });
         */
        transform: function( pOptions, pContext ) {
            var i, t, a, offset, count,
                indexedPathStepRE = /^\[\W*([^ \t/]+)\W*]$/,
                template = pOptions.template,
                showNullAs = pOptions.showNullAs,
                tLen = template.length,
                arrays = [], // info about output arrays; there is one of these for each element of template
                indexes = {}, // indexName -> { array: [], values: {} -> index }
                self = this;

            function getIndex( indexes, name ) {
                var index;
                index = indexes[name];
                if ( !index ) {
                    index = { values: {}, paths: [] };
                    indexes[name] = index;
                }
                return index;
            }

            function processPath( pathSrc, templateIndex, indexName, objContext, arrays, indexes ) {
                var i, m, p, array, path, obj, index, lastObj, lastProp;

                if ( pathSrc ) {
                    path = pathSrc.split("/");
                    obj = objContext;
                    lastObj = null;
                    lastProp = null;
                    p = null;
                    for ( i = 0; i < path.length; i++ ) {
                        p = path[i];
                        m = indexedPathStepRE.exec( p );
                        if ( m ) {
                            index = getIndex( indexes, m[1] );
                            index.paths[templateIndex] = path.slice( i + 1 ).join( "/" );
                            break;
                        } else {
                            lastObj = obj;
                            lastProp = p;
                            if ( !hasOwnProperty( obj, p ) ) {
                                obj[p] = {}; // assume for now it is an object
                            }
                            obj = obj[p];
                        }
                    }
                    if ( lastObj ) {
                        if ( isArray( lastObj[lastProp] ) ) {
                            array = lastObj[lastProp];
                            array.length = 0; // any array that will be populated as part of the transform must first be truncated
                        } else {
                            array = [];
                        }
                        lastObj[lastProp] = array;
                    } else {
                        array = objContext;
                    }
                    arrays[ templateIndex ] = array;
                } else {
                    // objContext must be an array
                    if ( isArray( objContext ) ) {
                        arrays[ templateIndex ] = objContext;
                    } else {
                        throw new Error( "Context must be an array when there is no path" );
                    }
                }
                if ( indexName ) {
                    index = getIndex( indexes, indexName );
                }
            }

            // implicit input: pContext, template; implicit output arrays, indexes
            function buildArrays( ) {
                var i, t;

                for( i = 0; i < template.length; i++ ) {
                    t = template[i];
                    processPath( t.path, i, t.uniqueIndexField, pContext, arrays, indexes );
                }
            }

            function getObject( srcObj, dstObj, record, index, id ) {
                var propName, prop, value;

                for ( propName in srcObj ) {
                    if ( hasOwnProperty( srcObj, propName ) ) {
                        prop = srcObj[propName];
                        value = getValue( prop, record, index, id );
                        if ( value !== undefined ) {
                            dstObj[propName] = value;
                        }

                    }
                }
                return dstObj;
            }

            function getArray( srcArr, dstArr, record, index, id ) {
                var i, prop, value;

                for ( i = 0; i < srcArr.length; i++ ) {
                    prop = srcArr[i];
                    value = getValue( prop, record, index, id );
                    if ( value !== undefined ) {
                        dstArr[i] = value;
                    }
                }
                return dstArr;
            }

            function getValue( prop, record, index, id ) {
                var len, value, firstCh, lastCh,
                    raw = false;

                // todo consider prop syntax that allows access to properties of an object value. Work around is to use a function
                if ( typeof prop === "string" ) {
                    len = prop.length;
                    firstCh = prop.charAt( 0 );
                    lastCh = prop.charAt( len - 1 );

                    if ( firstCh === "'" && lastCh === "'" ) { // is it a constant?
                        return prop.substring( 1, len - 1 );
                    } else if ( firstCh === "(" && lastCh === ")" ) { // is it a raw property value
                        prop = prop.substring( 1, len - 1 );
                        raw = true;
                    } // else it comes from a data model named record field
                    value = self.getValue( record, prop );
                    // handle special case where field has a display value. Assume it is the display value of interest.
                    if ( value !== null && typeof value === "object" && hasOwnProperty( value,"d" ) ) {
                        if ( raw ) {
                            value = value.v;
                        } else {
                            value = value.d;
                        }
                    }
                    if ( !raw && showNullAs && ( value === null || value === "" ) ) {
                        value = showNullAs;
                    }
                    return value;
                } else if ( isFunction( prop ) ) {
                    return prop.call( pContext, self, record, index, id );
                } else if ( prop === null ) {
                    return prop;
                } else if ( isArray( prop ) ) {
                    return getArray( prop, [], record, index, id );
                } else if ( typeof prop === "object" ) {
                    return getObject( prop, {}, record, index, id );
                }
                // return undefined
            }

            function getKeys( path, record, index, id ) {
                var i, p, m,
                    keys = [];

                if ( path ) {
                    path = path.split("/");
                    for ( i = 0; i < path.length; i++ ) {
                        p = path[i];
                        m = indexedPathStepRE.exec( p );
                        if ( m ) {
                            keys.push( {
                                key: m[1],
                                value: getValue( m[1], record, index, id )
                            } );
                        }
                    }
                }
                return keys;
            }

            function processRecord( record, index, id ) {
                var i, k, t, array, value, outputIndex, outputIndexValue, keys, indexedValue, obj, curIndexes;

                // skip records that are not in the range of interest given by offset and count
                if ( index < offset || ( count > 0 && index >= offset + count ) ) {
                    return;
                }

                // skip aggregate records unless option includeAggregates is true
                if ( !pOptions.includeAggregates && self._metaKey && record[self._metaKey].agg ) {
                    return;
                }

                // skip records that don't pass the global filter if there is one
                if ( pOptions.filter && !pOptions.filter.call( pContext, self, record, index, id ) ) {
                    return;
                }

                for( i = 0; i < tLen; i++ ) {
                    outputIndex = null;
                    t = template[i];
                    array = arrays[i];
                    // skip templates that don't pass the template specific filter
                    if ( !t.filter || t.filter.call( pContext, self, record, index, id ) ) {
                        if ( t.uniqueIndexField ) {
                            outputIndex = indexes[t.uniqueIndexField];
                            outputIndexValue = getValue( t.uniqueIndexField, record, index, id );
                            if ( outputIndex.values[outputIndexValue] !== undefined ) {
                                // there has already been an element added for this value so skip this record
                                continue;
                            }
                        }
                        value = getValue( t.item, record, index, id );
                        if ( value !== undefined ) {
                            if ( outputIndex ) {
                                // remember the index where this value is stored
                                outputIndex.values[outputIndexValue] = { index: array.length, arrays: [], indexes: {} };
                            } else {
                                // see if there are any indexed properties in the path
                                keys = getKeys( t.path, record, index, id );
                                curIndexes = indexes;
                                for ( k = 0; k < keys.length; k++ ) {
                                    outputIndex = getIndex(curIndexes, keys[k].key);
                                    indexedValue = outputIndex.values[keys[k].value];
                                    if ( indexedValue === undefined ) {
                                        indexedValue = {
                                            index: array.length,
                                            arrays: [],
                                            indexes: {}
                                        };
                                        // add new object (or array) to array
                                        obj = outputIndex.paths[i] === "" ? [] : {};
                                        array.push( obj );
                                        outputIndex.values[keys[k].value] = indexedValue;
                                    }
                                    obj = array[indexedValue.index];
                                    if ( !indexedValue.arrays[i] ) {
                                        processPath( outputIndex.paths[i], i, null, obj, indexedValue.arrays, indexedValue.indexes );
                                    }
                                    array = indexedValue.arrays[i];
                                    curIndexes = indexedValue.indexes;
                                }

                            }
                            array.push( value );
                        }
                    }
                }
                // todo call to get more from server if needed. Consider using fetchAll first
            }

            if ( pContext === null || typeof pContext !== "object" ) {
                pContext = {};
            }

            buildArrays();

            offset = 0;
            if ( pOptions.offset >= 0 ) {
                offset = pOptions.offset;
            }
            count = pOptions.fetchData ? this._options.pageSize : null;
            if ( pOptions.count > 0 ) {
                count = pOptions.count;
            }
            if ( pOptions.fetchData ) {
                this.forEachInPage( offset, count, processRecord );
            } else {
                this.forEach( processRecord );
            }

            for( i = 0; i < tLen; i++ ) {
                t = template[i];
                a = arrays[i];
                if ( t.sort ) {
                    a.array.sort( t.sort );
                }
            }

            return pContext;
        },

        /**
         * <p>Iterate over a range (page) of the model collection. This is only valid for table shape models.
         * Calls <code class="prettyprint">pCallback</code> for <code class="prettyprint">pCount</code>
         * records in the collection starting at <code class="prettyprint">pOffset</code>.
         * If the model doesn't yet contain the requested records they will be fetched from the server
         * by calling {@link model#fetch}.</p>
         *
         * <p>The callback receives the record, the zero based index of the record, and the identity (recordId)
         * of the record. If the collection has fewer records than requested or if there is an error
         * fetching data from the server then <code class="prettyprint">pCallback</code> is called with a null record.
         * If there is an ajax error it is passed to the callback in the error parameter.
         * When more data needs to be fetched the last call before the fetch, has the error parameter
         * set to false. This gives the view layer a way to respond to the pause in rendering due to the
         * asynchronous ajax request.
         * </p>
         *
         * @param {number} pOffset Zero based index to begin iterating.
         * @param {number} pCount The number of records to call <code class="prettyprint">pCallback</code> for.
         * @param {model.IteratorCallback} pCallback Function called for each record in the model collection.
         *     The function is given the current record, index, and id.
         * @param {*} [pThisArg] Value to use as <code class="prettyprint">this</code> when calling
         *     <code class="prettyprint">pCallback</code>.
         * @example <caption>This example renders a <code class="prettyprint">pageSize</code> page of records
         *   starting at offset <code class="prettyprint">currentPageOffset</code>.</caption>
         * var count = 0,
         *     pageOffset = currentPageOffset;
         * model.forEachInPage( pageOffset, pageSize, function( record, index, id ) {
         *     if ( record ) {
         *         // render the record
         *         count += 1;
         *     }
         *     if ( count === pageSize || !record ) {
         *         // done rendering this page of records
         *     }
         * } );
         */
        forEachInPage: function( pOffset, pCount, pCallback, pThisArg ) {
            const self = this,
                o = this._options,
                a = this._data;
            let end, index,
                dataOffset = pOffset; // pOffset is in logical collection, dataOffset is in model collection (_data)

            function getMore( offset ) {
                const count = pCount - ( offset - pOffset );
                let next, p;

                debug.trace( "Model: " + self.modelId() + ". forEachInPage fetching more data starting at: ", offset );
                self._waitingPages.push( {
                    offset: offset,
                    callback: pCallback,
                    thisArg: pThisArg,
                    next: function() {
                        self.forEachInPage( offset, count, pCallback, pThisArg );
                    }
                } );
                if ( !self._requestsInProgress.fetch ) {
                    p = self.fetch( offset, function( err ) {
                        if ( !err ) {
                            setTimeout(function() {
                                // do this after the requests in progress flag is cleared
                                if ( self._waitingPages.length > 0 ) {
                                    next = self._waitingPages.shift();
                                    next.next();
                                }
                            }, 1);
                        }
                    } );
                    if ( !p ) {
                        self._waitingPages.pop();
                        // there is no more data to get. null record means no more
                        callForEachCallback( pThisArg, pCallback, null, -1, null );
                    }
                }
            }

            if ( o.shape !== SHAPE_TABLE) {
                throw invalidShapeError( "forEachInPage" );
            }

            // if caller asks for more than a page size of records at once then we need a bigger page size
            if ( pCount > o.pageSize ) {
                // but round up to the next multiple of 10
                o.pageSize = Math.floor( ( pCount + 9 ) / 10 ) * 10;
            }

            if ( o.paginationType === PT_ONE ) {
                // in this case the model always only holds one page of data
                // so the offset must be adjusted
                dataOffset = pOffset - this._offset;
            }

            // When the refresh event happens with clearDataPending true, view layers should call fetch
            // but if they don't then _clearDataPending flag will still be true so cause new data to be fetched now.
            if ( this._clearDataPending ) {
                getMore( pOffset );
                return;
            }
            // typically can run off the end of the data but in the case where only hold one page can
            // also ask for data before the page that the model holds
            if ( dataOffset < 0 || dataOffset >= a.length ) {
                if ( this._haveAllData ) {
                    // there is no more data to get. null record means no more
                    callForEachCallback( pThisArg, pCallback, null, -1, null );
                    this._drainWaiters();
                } else {
                    // need to fetch more data, then start again
                    getMore( pOffset );
                }
                return;
            }

            end = dataOffset + pCount;
            index = pOffset; // the record index reported to the caller is always in terms of the logical collection
            for ( let i = dataOffset; i < end; i++ ) {
                let rec = a[i],
                    pause = undefined;

                if ( rec === undefined ) {
                    if ( this._haveAllData && i >= a.length ) {
                        // there is no more data to get. null record means no more
                        callForEachCallback( pThisArg, pCallback, null, -1, null );
                        this._drainWaiters();
                    } else {
                        // fetch more data and continue where left off; adjust for page boundary
                        getMore( i + this._offset );
                    }
                    return;
                }
                if ( rec ) {
                    // look ahead to see if more data needs to be fetched after this record. If so
                    // indicate this to the caller via error argument being false
                    if ( a[i + 1] === undefined && !( this._haveAllData && ( i + 1 ) >= a.length ) ) {
                        pause = false;
                    }
                    callForEachCallback( pThisArg, pCallback, rec, index, this._getIdentity( rec, i ), pause );
                    index += 1;
                }
            }
            this._drainWaiters();
        },

        /**
         * <p>Return the index of the record within the collection. The collection may include aggregate records.
         * Useful because {@link model#forEachInPage} method takes a starting index/offset.</p>
         *
         * <p>Only applies to table and tree shape models. Throws an error if the model shape is record.
         * For tree shape models an identity field must be defined and
         * this returns the index of the node among its siblings.</p>
         *
         * @param {model.Record} pRecord The record to return the index of.
         * @return {number} The record index or -1 if not in collection or the root node of a tree shape model.
         */
        indexOf: function( pRecord ) {
            const shape = this._options.shape;

            if ( shape === SHAPE_RECORD ) {
                throw invalidShapeError( "indexOf" );
            }
            if ( pRecord && this._identityKeys !== undefined ) {
                let iNode = this.getRecordMetadata( this._getIdentity( pRecord ) );

                if ( shape === SHAPE_TREE ) {
                    if ( iNode && iNode.parent ) {
                        return iNode.parent[this._childrenKey].indexOf( pRecord );
                    } // else
                    return -1;
                } // else
                if ( iNode ) {
                    return iNode.index;
                }
            }
            return this._data.indexOf( pRecord );
        },

        /**
         * <p>Return the record at the given index within the model collection. Only applies to table shape models.</p>
         *
         * @param {number} index The index of the record to return.
         * @return {model.Record} The record or null if there is no record at the given index.
         * @example <caption>This example returns the fifth record in the collection assuming it exists.</caption>
         * var record = model.recordAt(5);
         */
        recordAt: function( index ) {
            if ( this._options.shape !== SHAPE_TABLE ) {
                throw invalidShapeError( "recordAt" );
            }
            return this._data[index] || null;
        },

        /**
         * <p>Given a record return the unique identifier (id) for the record. The id is used in calls to
         * {@link model#getRecordMetadata} and {@link model#getRecord}. If the model has multiple
         * identity fields this returns a string representation of the combined fields.</p>
         *
         * @param {model.Record} pRecord The record to get the id from.
         * @return {string} The record id or null if no identityField is defined.
         * @example <caption>This example gets the identity of record <code class="prettyprint">someRecord</code>
         *     and uses it to get the record metadata.</caption>
         * var id = model.getRecordId( someRecord ),
         *     meta = model.getRecordMetadata( id );
         * // use meta for something
         */
        getRecordId: function( pRecord ) {
            return this._getIdentity( pRecord );
        },

        /**
         * <p>Return an opaque id that represents the control break that the record belongs to.</p>
         *
         * @param {model.Record} pRecord The record to get the control break id from.
         * @returns {?string} The control break id that the record belongs to or null if the model doesn't have
         *   any control break fields defined.
         * @example <caption>The following code checks if 2 records are in the same control break.</caption>
         * if ( model.getControlBreakId( rec1 ) === model.getControlBreakId( rec2 ) ) {
         *     console.log( "records are in the same control break." );
         * } else {
         *     console.log( "records are not in the same control break." );
         * }
         */
        getControlBreakId: function( pRecord ) {
            let value = null;

            if ( this._controlBreakKeys?.length > 0 ) {
                value = "";
                for ( let i = 0; i < this._controlBreakKeys.length; i++ ) {
                    let part = pRecord[this._controlBreakKeys[i]];

                    if ( part?.v ) {
                        part = part.v;
                    }
                    if ( value.length > 0 ) {
                        value += "|";
                    }
                    // A reasonable control break column value (part) should be a string.
                    // The special case of LOV value is covered above. Other things such as objects,
                    // null, undefined etc. are turned into strings that may not be unique. undefined is very
                    // unlikely for a column value. null could work if it doesn't conflict with a string value.
                    // This is all very unlikely given that the server must sort these values.
                    value += part;
                }
            }
            return value;
        },

        /**
         * <p>Return true if any control break columns are configured.
         * See <code class="prettyprint">controlBreakIndex</code> property of {@link model.fieldMeta}.
         * </p>
         *
         * @returns {boolean}
         */
        hasControlBreaks: function() {
            return Boolean( this._controlBreakKeys );
        },

        /**
         * Returns an array of control break objects that represent the control break ranges known to the model.
         * If pControlBreakID given returns just that specific control break object.
         * todo doc
         * @ignore
         * @param pControlBreakId
         * @returns {*[]|null}
         */
        getControlBreaks: function( pControlBreakId ) {
            if ( !this._controlBreakKeys ) {
                return null;
            } // else

            const makeBreak = ( id, cbInfo ) => {
                return {
                    id: id,
                    firstId: cbInfo.firstId,
                    lastId: cbInfo.lastId,
                    firstIndex: cbInfo.firstId ? this.getRecordMetadata( cbInfo.firstId )?.index : null,
                    lastIndex: cbInfo.lastId ? this.getRecordMetadata( cbInfo.lastId )?.index : null,
                };
            };

            if ( pControlBreakId ) {
                const cbInfo = this._controlBreaksMap.get( pControlBreakId );

                return cbInfo ? makeBreak( pControlBreakId, cbInfo ) : null;
            } // else

            let breaks = [];

            for ( const [id, cbInfo] of this._controlBreaksMap ) {
                breaks.push( makeBreak( id, cbInfo ) );
            }
            breaks.sort( ( a, b) => {
                return a.firstIndex - b.firstIndex;
            } );
            return breaks;
        },

        /**
         * returns the aggregate record in the given control break or grand total if no control break given.
         * todo doc
         * @ignore
         * @param pAggregateName
         * @param {string} [pControlBreakId]
         * @return {model.Record}
         */
        getAggregateRecord: function( pAggregateName, pControlBreakId ) {
            let index, meta, id, foundAggregates,
                rec = null;

            if ( pControlBreakId != null ) {
                id = this._controlBreaksMap.get( pControlBreakId )?.lastId;
                if ( id ) {
                    index = this.indexOf( this.getRecord( id ) );
                }
                if ( index >= 0 ) {
                    foundAggregates = false;
                    // todo this is based on current questionable behavior where agg records are after the controlBreakEnd
                    for ( ; index < this._data.length; index++ ) {
                        rec = this._data[index];
                        meta = rec[this._metaKey];
                        if ( meta && meta.agg ) {
                            foundAggregates = true;
                            if ( meta.agg === pAggregateName ) {
                                // found the aggregate record of interest
                                break;
                            }
                        } else if ( foundAggregates ) {
                            rec = null;
                            break;
                        }
                        // new records could have been added after the initial end of the control break
                        // so keep looking for agg records, foundAggregates keeps from going on to the next break
                    }
                }
            } else {
                // aggregate records are at the end. search backwards
                for ( index = this._data.length - 1; index >= 0; index-- ) {
                    rec = this._data[index];
                    meta = rec[this._metaKey];
                    if ( meta && meta.agg && meta.grandTotal ) {
                        if ( meta.agg === pAggregateName ) {
                            // found the aggregate record of interest
                            break;
                        }
                    } else {
                        rec = null;
                        break;
                    }
                }
            }
            return rec;
        },

        /**
         * Return true if the given field name is an identity field and false otherwise.
         *
         * @param {string} pFieldName Name of record field.
         * @return {boolean}
         */
        isIdentityField: function( pFieldName ) {
            if ( this._identityKeys !== undefined ) {
                return this._identityKeys.includes( this.getFieldKey( pFieldName ) );
            }
            return false;
        },

        /**
         * @typedef {object} model.RecordMetadata
         * @desc
         * Metadata properties that the model creates and uses. See {@link model#getRecordMetadata}.
         *
         * @property {boolean} deleted true if the record has been deleted otherwise false or undefined.
         * @property {boolean} inserted true if the record is newly created and inserted/added to the collection otherwise false or undefined.
         * @property {boolean} autoInserted true if the record was auto inserted (these records are not saved if not also updated)
         * @property {boolean} updated true if the record has had any fields changed.
         * @property {model.Record} original When updated is true this is the original record before any changes.
         * @property {model.Record} record Reference to the record that this metadata is about.
         * @property {model.Record} parent The parent record of this record. Only applies to tree shape models.
         * @property {boolean} error true if the record as a whole has an error.
         * @property {boolean} warning true if the record as a whole has a warning.
         * @property {string} message Only present when <code class="prettyprint">error</code>
         *     or <code class="prettyprint">warning</code> are true. Describes the error or warning condition.
         * @property {boolean} sel true if the record is selected and false otherwise. This property should not
         *     be changed except by view layers using the {@link model#setSelectionState} method.
         * @property {string} highlight A string that view layers can use to provide extra styling for the record.
         * @property {boolean} disabled true if the record is disabled. The model makes the disabled state available
         *     to the view layer. If selection state is kept in the model with {@link model#setSelectionState}
         *     disabled records will not be selected.
         *     Not all view layers will make use of this property.
         *     Typically, a view layer will not let disabled records be selected and may show them with
         *     different styles. Disabled state doesn't affect editing. However, a disabled record may also
         *     have <code class="prettyprint">allowedOperations</code> set to not allow editing or deleting.
         *     See {@link model#isDisabled} and {@link model#setDisabledState}.
         * @property {boolean} hidden true if the record should be hidden by view layers. The model makes the hidden
         *     state available to the view layer; it does not act on the hidden state at all. Not all view layers
         *     will make use of this property. Typically, a view layer will use CSS or some other means to make
         *     hidden records invisible. See {@link model#setHiddenState}.
         * @property {object} allowedOperations
         * @property {boolean} allowedOperations.delete true if the record can be deleted.
         * @property {boolean} allowedOperations.update true if the record can be updated.
         * @property {boolean} canEdit Derived from <code class="prettyprint">allowedOperations.update</code>
         * @property {boolean} canDelete Derived from <code class="prettyprint">allowedOperations.delete</code>
         * @property {boolean} endControlBreak Used by views to implement control break UI. The server sets this to
         *   true in the last record of each group of control break records.
         * @property {*} agg For aggregate records this is the name of the aggregate function.
         * @property {boolean} grandTotal For aggregate records this is true for the overall value (grand total) records.
         * @property {Object.<string, model.RecordFieldMetadata>} fields An object that maps from a field name to
         *     metadata about the field.
         */
        /*
         * TODO document more metadata
         * @property {string} recordId internal use, only applies briefly after saving an inserted record this is the previous id by which the record was known
         * @property {boolean} canDrag
         * @property {string} protected
         * @property {*} rowVersion opaque to model
         * @property {*} salt opaque to model
         */

        /**
         * @typedef {object} model.RecordFieldMetadata
         * @desc
         * Metadata related to a specific record field. You access the field metadata from the record metadata.
         * See {@link model#getRecordMetadata}
         *
         * @property {boolean} changed true if the field has changed.
         * @property {boolean} stale true if the value of this field depends on other fields and those fields have changed
         *     and this field has not been recalculated.
         * @property {boolean} error true if the field has an error.
         * @property {boolean} warning true if the field has a warning.
         * @property {string} message Only present when <code class="prettyprint">error</code>
         *     or <code class="prettyprint">warning</code> are true. Describes the error or warning condition.
         * @property {boolean} disabled true if the field is disabled. Disabled fields are written to the server as empty string.
         * @property {string} highlight A string that view layers can use to provide extra styling for the field.
         * @property {string} ck A checksum. If present and not null indicates the record field is readonly.
         * @property {string} url Use for cells that are links. This is the link target. The cell value is the link label.
         */
        // todo consider state updated distinct from changed. updated is for when a calculated value including agg has been updated but not considered a change because it is query only

        /**
         * <p>Return the metadata object for the record given by the record id. This only applies to models that
         * define an identity field with option <code class="prettyprint">identityField</code>. From the
         * record metadata you access field metadata via the <code class="prettyprint">fields</code> property.
         * Note that a fields property doesn't exist if it has no metadata, so you have to check that it exists
         * before accessing or setting any of its properties, as shown in the second example.</p>
         *
         * <p>Upper layers can store information related to the record here. The metadata should be related to the
         * record itself and not the view of it.</p>
         *
         * <p>If any metadata property values are changed, call {@link model#metadataChanged} to notify any view
         * layer of the change if needed.</p>
         *
         * @param {string|string[]} [pRecordId] Value of the record's identity field or array of values of the record's
         *     identity fields or value returned by {@link model#getRecordId}. This can be omitted when the model
         *     shape is "record".
         * @return {model.RecordMetadata} Metadata object or null if there is no record associated with
         *     <code class="prettyprint">pRecordId</code>.
         * @example <caption>This example checks if the record <code class="prettyprint">someRecord</code>
         *     is updated.</caption>
         * var id = model.getRecordId( someRecord ),
         *     meta = model.getRecordMetadata( id );
         * if ( meta.updated ) {
         *     // do something related to the updated record
         * }
         * @example <caption>This example, using the EMP table, sets the <code class="prettyprint">highlight</code>
         * property of the record or the SAL field based on conditions of the SAL and COMM values.
         * Note that the {@link grid} widget as used by the Interactive Grid region also uses the
         * <code class="prettyprint">highlight</code> property which could conflict with code such as this.
         * If used with Interactive Grid the code could check if there is already a highlight value or could turn
         * off the Interactive Grid highlight feature.
         * This function would be called from a model {@link model.Observer} in response to
         * a "set" notification or possibly in response to a {@link apex.event:apexendrecordedit} event.
         * The page needs to have custom CSS rules for the "warn-comm" and "warn-sal" classes.</caption>
         * function updateRecordHighlights( model, record, id ) {
         *     var meta = model.getRecordMetadata( id ),
         *         // turn number strings into numbers
         *         sal = Number( model.getValue( record, "SAL" ) ) || 0,
         *         comm = Number( model.getValue( record, "COMM" ) ) || 0,
         *         // get SAL field metadata creating it if it doesn't already exist.
         *         salFieldMeta = apex.util.getNestedObject( meta, "fields.SAL" );
         *
         *     if ( sal > 5000 ) {
         *         salFieldMeta.highlight = "warn-sal";
         *     } else {
         *         salFieldMeta.highlight = null;
         *     }
         *     if ( comm > sal / 5 ) {
         *         meta.highlight = "warn-comm";
         *     } else {
         *         meta.highlight = null;
         *     }
         *     model.metadataChanged( id );
         * }
         */
        getRecordMetadata: function( pRecordId ) {
            const o = this._options;
            let iNode, pk;

            if ( !pRecordId && o.shape === SHAPE_RECORD ) {
                if ( o.identityField ) {
                    pk = this.getRecordId( this._data );
                } else {
                    pk = DEFAULT_REC_ID;
                }
            } else {
                pk = makeIdentityKey( pRecordId );
            }
            iNode = this._index.get( pk );
            // todo THINK there was supposed to be something to distinguish metadata that had to go back to the server
            return iNode || null;
        },

        /**
         * <p>Call this method if any properties of the metadata returned by {@link model#getRecordMetadata} are changed
         * external to this module. Most record or field metadata should not be changed externally. However, it may
         * be useful and reasonable to externally change metadata that comes from the records initially such as canEdit
         * or custom metadata properties.
         * The result of calling this method is sending a {@link model#event:metaChange} notification.</p>
         *
         * @param {string} pRecordId Value of the record's identity field or array of values of the record's
         *     identity fields or value returned by {@link model#getRecordId}.
         * @param {string} [pFieldName] Name of record field that has a metadata change if any.
         * @param {string} [pPropertyName] Name of the metadata property that has changed.
         *      If multiple properties changed this can be a comma separated list.
         * @fires model#event:metaChange
         */
        metadataChanged: function( pRecordId, pFieldName = null, pPropertyName = null ) {
            let iNode = this._index.get( makeIdentityKey( pRecordId ) );

            if ( iNode ) {
                notifyChange( this, "metaChange", {
                    record: iNode.record,
                    recordId: pRecordId,
                    field: pFieldName,
                    property: pPropertyName
                } );
            }
        },

        /**
         * Return metadata for given type name.
         * See comments before {@link apex.model.create} for more information on the properties associated with a type.
         *
         * @ignore
         * @param {string} pTypeName The type name.
         * @return {object} metadata object or null if there is no such type
         */
        getTypeMetadata: function( pTypeName ) {
            return this._options.types[pTypeName] || null;
        },

        /**
         * <p>Return metadata object for given field name. The field metadata is supplied when the model is created
         * in option property <code class="prettyprint">fields</code>.</p>
         *
         * @param {string} pFieldName The field name.
         * @return {model.FieldMeta} Metadata object or null if there is no such field.
         */
        getFieldMetadata: function( pFieldName ) {
            return this._options.fields[pFieldName] || null;
        },

        /**
         * <p>Return the index/key to use for the given field name when accessing that field of a record.
         * Use the value returned from this method to access a record field without using {@link model#getValue}.
         * This will work regardless of if the records are stored as objects or arrays.</p>
         *
         * @param {string} pFieldName The field name.
         * @return {(string|number|undefined)} returns undefined if the field doesn't exist or is virtual
         * @example <caption>This example gets the field key for the model field named "COST" and uses it
         * in a loop over array of records <code class="prettyprint">selectedRecords</code>.</caption>
         * var i, cost,
         *     costKey = model.getFieldKey("COST");
         * for ( i = 0; i < selectedRecords.length; i++ ) {
         *     cost = selectedRecords[i][costKey];
         *     // do something with cost
         * }
         */
        getFieldKey: function( pFieldName ) {
            const o = this._options;

            if ( !hasOwnProperty( o.fields, pFieldName ) || o.fields[pFieldName].virtual ) {
                return undefined;
            }
            if ( o.recordIsArray ) {
                return o.fields[pFieldName].index;
            }
            return pFieldName;
        },

        /**
         * <p>Determine if the model has been changed in any way. See also {@link model#getChanges}.</p>
         *
         * <p>Note: Auto inserted records don't count as changes unless they are also updated, but
         * they are returned by {@link model#getChanges}.</p>
         *
         * @return {boolean} true if the model has changed and false otherwise.
         * @example <caption>This example logs a console message if the model has changed.</caption>
         * if ( model.isChanged() ) {
         *     console.log("Model has changes.");
         * }
         */
        isChanged: function() {
            let count = 0;

            if ( this._changes.length === 0 ) {
                return false;
            } // else
            for ( let i = 0; i < this._changes.length; i++ ) {
                let iNode = this._changes[i];

                if ( !(iNode.autoInserted && !iNode.updated) ) {
                    count += 1;
                }
            }
            return count > 0;
        },

        /**
         * <p>Return an array of record metadata for all changed records.
         * Do not make any changes to the data structure returned. See also {@link model#isChanged}.</p>
         *
         * @return {model.RecordMetadata[]} Array of record metadata for changed records.
         * @example <caption>This example logs a console message if the model has changed that includes the number of changes.</caption>
         * if ( model.isChanged() ) {
         *     console.log("Model has " + model.getChanges().length + " changes.");
         * }
         */
        // todo THINK is a copy needed? Is this just what will be sent to the server or is there a different method for that? likely different
        getChanges: function() {
            return this._changes;
        },

        /**
         * This marks the model as not having any changes. All change indications will be removed.
         * If any record deletes are pending they will be removed by this method. This does not revert or undo the
         * changes but rather removes all metadata that is tracking changes. This happens implicitly after the model
         * is saved (See {@link model#save}). Use this method if changes are persisted in some other way or the
         * changes should be discarded before refreshing the model.
         * <p>See also {@link model#revertRecords} and option {@link model#trackChanges}.</p>
         *
         * @fires model#clearChanges
         * @example <caption>This example clears all the changes of an interactive grid with static id "emp"
         * in response to a Cancel or Abort button being pressed by the user.
         * Use in an Execute JavaScript Code dynamic action.
         * If not for the call to <code class="prettyprint">clearChanges</code>
         * before <code class="prettyprint">refresh</code>
         * the interactive grid would prompt the user to save changes.</caption>
         * var ig$ = apex.region( "emp" ).widget(),
         *     view = ig$.interactiveGrid( "getCurrentView" );
         * if ( view.supports.edit ) {
         *     // leave edit mode so that the column items will be reinitialized
         *     ig$.interactiveGrid( "getActions" ).set( "edit", false );
         *     view.model.clearChanges();
         * }
         * apex.region("emp").refresh();
         */
        clearChanges: function() {
            this._clearChanges( "_changes" );
        },

        /**
         * <p>Return true if the model has any errors.</p>
         *
         * @return {Boolean} true if model has errors and false otherwise.
         * @example <caption>This example logs a console message if the model has errors.</caption>
         * if ( model.hasErrors() ) {
         *     console.log("Model has errors.");
         * }
         */
        hasErrors: function() {
            return this._errors.length > 0;
        },

        /**
         * <p>Return an array of record metadata for all records with errors.
         * Do not make any changes to the data structure returned.</p>
         *
         * @return {model.RecordMetadata[]} Array of record metadata for error records.
         */
        getErrors: function() {
            return this._errors;
        },

        /**
         * <p>Set the <code class="prettyprint">hidden</code> property of the {@link model#getRecordMetadata}
         * for the record given by pRecordId. This is a convenience method that looks up the record metadata,
         * sets the hidden property, and calls the {@link model#metadataChanged} method if the value changed.</p>
         *
         * @param {string|string[]} pRecordId The record id to set the hidden state on.
         * @param {boolean|null} pHidden The new hidden state to set.
         */
        setHiddenState: function( pRecordId, pHidden ) {
            let meta = this.getRecordMetadata( pRecordId );

            if ( meta && meta.hidden !== pHidden ) {
                meta.hidden = pHidden;
                this.metadataChanged( pRecordId, null, "hidden" );
            }
        },

        /**
         * <p>Update the visibility of all records currently in the model by calling the
         * <code class="prettyprint">visibilityFilter</code> function and setting
         * the record <code class="prettyprint">hidden</code> metadata property for each record.
         * Useful for client side filtering of views of table or tree shaped models. This method does nothing if
         * the <code class="prettyprint">visibilityFilter</code> or
         * <code class="prettyprint">visibilityFilterContext</code> options are not set.</p>
         *
         * <p>Client side filtering works best for reasonable sized reports and when the model has all the
         * data to filter on. Not all view layer components will make use of the hidden property. For those
         * that do it may only work if the view has rendered all the data.</p>
         *
         * <p>See also {@link model#setHiddenState} and the <code class="prettyprint">visibilityFilter</code>
         * and <code class="prettyprint">visibilityFilterContext</code> options of {@link apex.model.create}.</p>
         *
         * @param {object} [pVisibilityContext] If present, the <code class="prettyprint">visibilityFilterContext</code>
         *   option is set to this value. If omitted the current <code class="prettyprint">visibilityFilterContext</code>
         *   is used.
         *
         * @example <caption>The following example filters a Cards region with static id "people" using
         * Text Field item P1_FILTER as the user types with a 200ms delay.</caption>
         * var filterItem = apex.item("P1_FILTER"),
         *     lastFilterString = null,
         *     filterContext = {
         *         matchString: ""
         *     };
         *
         * function myFilter( model, record, context ) {
         *     var match = false;
         *     // match record against context.matchString and return true if there is a match
         *     return match;
         * };
         *
         * function checkFilter() {
         *     var value = filterItem.getValue();
         *
         *     if ( value !== lastFilterString ) {
         *         // only filter if the value has changed and don't do it too often
         *         debounceFilterCards( value );
         *         lastFilterString = value;
         *     }
         * };
         *
         * function filterCards( filterString ) {
         *     var model = apex.region( "people" ).call( "getModel" );
         *     filterContext.matchString = filterString.toUpperCase(); // toUpperCase typical for case independent compare
         *     model.updateVisibility( filterContext );
         * };
         * var debounceFilterCards = apex.util.debounce( filterCards, 200 );
         *
         * // these options could instead be set in region Initialization JavaScript Function
         * var model = apex.region( "people" ).call( "getModel" );
         *     model.setOption( "visibilityFilter", myFilter );
         *     model.setOption( "visibilityFilterContext", filterContext );
         *
         * filterItem.element.on( "input", function() {
         *     checkFilter();
         * } );
         * checkFilter();
         */
        updateVisibility: function( pVisibilityContext = null ) {
            const o = this._options,
                filter = o.visibilityFilter;

            if ( filter ) {
                if ( pVisibilityContext !== null ) {
                    o.visibilityFilterContext = pVisibilityContext;
                }
                let model = this,
                    context = o.visibilityFilterContext;

                if ( context === null ) {
                    return;
                } // else

                if ( o.shape === SHAPE_TREE ) {
                    let stack = [];

                    model.walkTree( model.root(), {
                        node: function ( node ) {
                            if ( model.hasChildren( node ) === false ) {
                                // check leave node
                                let match = filter( model, node, context );

                                model.setHiddenState( model.getRecordId( node ), !match );
                                if ( match ) {
                                    // if visible then parent should be visible also
                                    stack[stack.length - 1] = match;
                                }
                            }
                        },
                        beginChildren: function () {
                            stack.push( null );
                        },
                        endChildren: function ( node ) {
                            let empty = false,
                                match = stack.pop();

                            // never hide the root
                            if ( stack.length === 0 ) {
                                empty = true;
                                match = true;
                            }
                            if ( match === null ) {
                                match = filter( model, node, context );
                            }
                            model.setHiddenState( model.getRecordId( node ), !match );
                            if ( match && !empty ) {
                                // if visible then parent should be visible also
                                stack[stack.length - 1] = match;
                            }
                        }
                    }, null );
                } else if ( o.shape === SHAPE_TABLE ) {
                    // todo consider an async forEach so this doesn't block when there are many records
                    model.forEach( function( record, index, id ) {
                        let match = filter( model, record, context );

                        model.setHiddenState( id, !match );
                    } );
                }
            }
        },

        /**
         * <p>Set the <code class="prettyprint">disabled</code> property of the {@link model.RecordMetadata}
         * for the record given by pRecordId. This sets the <code class="prettyprint">disabled</code> property,
         * and calls the {@link model#metadataChanged} method if the value changed.</p>
         *
         * @param {string|string[]} pRecordId The record id to set the disabled state on.
         * @param {boolean|null} pDisabled The new disabled state to set.
         */
        setDisabledState: function( pRecordId, pDisabled ) {
            let meta = this.getRecordMetadata( pRecordId );

            if ( meta && meta.disabled !== pDisabled ) {
                meta.disabled = pDisabled;
                // todo think: checking for disabled should use isDisabled which includes type info but if
                //  records are disabled because of type info this accounting of disabled records will not be
                //  accurate. The result is that the select all state may go unnoticed if using type info and
                //  have disabled records. Because type info is not documented this is not important to solve now.
                this._numDisabledRecords += pDisabled ? 1 : -1;
                this.metadataChanged( pRecordId, null, "disabled" );
            }
        },

        /**
         * <p>Select or unselect the given record. Should only be used with table shape models.</p>
         *
         * <p>This method should only be used by view widgets to persist the view selection state in metadata property
         * <code class="prettyprint">sel</code>.
         * Note there is no notification about this metadata change. Listen to the view for selection change events.
         * Also use the view to change the selection.</p>
         *
         * @param {string|string[]} pRecordId The record id to set the selection state metadata.
         * @param {boolean} pSelected The desired record selection state; true to select and false to unselect.
         * @param {string} [pAction] Selection action. One of: "all", "set", "range", "anchor", or "toggle".
         *   Default is "set". For "all" and "anchor", pSelected is not used. For "all" pRecordId is not used.
         */
        setSelectionState: function( pRecordId, pSelected, pAction = "set" ) {
            let pk, iNode, rec, missing;

            const isSelectable = ( rec, iNode ) => {
                return !iNode.agg && !this.isDisabled( rec, iNode );
            };
            const selectRange = ( start, end ) => {
                let missing = false;

                for ( let i = start; i < end; i++ ) {
                    rec = this._data[i];
                    if ( rec ) {
                        pk = this._getIdentity( rec, i );
                        iNode = this._index.get( pk );

                        // must exist and can't be an aggregate or disabled
                        // todo think may or may not select invisible but model may not know if visible
                        //   maybe option to select aggregate
                        if ( iNode && isSelectable( rec, iNode ) ) {
                            iNode.sel = true;
                            this._selection.set( pk, iNode );
                        }
                    } else {
                        missing = true;
                    }
                }

                return missing;
            };

            if ( pAction === "all" ) {
                // mark all the records we currently have as selected
                missing = selectRange( 0, this.getTotalRecords( true ) );
                if ( missing ) {
                    this._selectRange = []; // indicates that some records are missing from the selection
                }
                // set this flag so that new data fetched will also be selected
                this._selectAll = true;
            } else if ( pAction === "anchor" && pRecordId == null ) {
                // clear anchor
                this._selectAnchor = null; // keep in sync with view layer.
            } else {
                pk = makeIdentityKey( pRecordId );
                iNode = this._index.get( pk );

                if ( iNode ) {
                    pSelected = !!pSelected;
                    if ( this._selectAll ) {
                        // assume selectAll will no longer be true. If wrong check below will correct.
                        this._selectAll = false;
                        if ( ["set", "range"].includes( pAction ) ) {
                            // clearSelection may have been called first but just in case
                            this.clearSelection();
                        }
                    }

                    if ( pAction === "range" ) {
                        let temp, end,
                            start = iNode.index;

                        iNode = this._index.get( this._selectAnchor );
                        if ( iNode ) {
                            end = iNode.index;
                            if ( start > end ) {
                                temp = start;
                                start = end;
                                end = temp;
                            }
                            missing = selectRange( start, end + 1 );
                            if ( missing ) {
                                this._selectRange = [start, end];
                            }
                        }
                    } else if ( pAction === "anchor" ) {
                        if ( isSelectable( iNode.record, iNode ) ) {
                            this._selectAnchor = pk; // keep in sync with view layer.
                        }
                    } else {
                        // view layer shouldn't try to select a disabled record but double check. todo maybe agg option
                        if ( isSelectable( iNode.record, iNode ) ) {
                            if ( iNode.sel !== pSelected ) {
                                iNode.sel = pSelected;
                                if ( pSelected ) {
                                    this._selection.set( pk, iNode );
                                } else {
                                    this._selection.delete( pk );
                                }
                            }
                            this._selectAnchor = pk; // keep in sync with view layer.
                        }
                        if ( pAction !== "toggle" ) {
                            this._selectRange = null;
                        }
                    }
                    if ( !this._selectAll ) {
                        // todo shouldn't do this if view doesn't support select all but does it matter? It is up
                        //  to the view to decided
                        // Want the number of possible selectable records so _data.length is not appropriate
                        // _index.size gives the number of records actually in _data.
                        let total = this._index.size - this._numAggregateRecords - this._numDisabledRecords;

                        if ( this.getSelectedCount() === total ) {
                            this._selectAll = true;
                        }
                    }
                }
            }
        },

        /**
         * <p>Unselect all the selected records. Should only be used with table shape models.
         * See also {@link model#setSelectionState}.</p>
         *
         * <p>This method should only be used by view widgets to persist the view selection state in metadata property
         * <code class="prettyprint">sel</code>.
         * Note there is no notification about this metadata change. Listen to the view for selection change events.
         * Also use the view to change the selection.</p>
         */
        clearSelection: function() {
            for ( const iNode of this._selection.values() ) {
                iNode.sel = false;
            }
            this._selection.clear();
            this._selectAll = false;
            this._selectRange = null;
        },

        /**
         * <p>Return the number of currently selected records. This only applies if a view is storing selection state
         * in the model. The selection may be incomplete if the model hasn't fetched all the data yet.
         * The {@link model#getSelectionState} method is used to tell if the selection is incomplete.</p>
         * <p>This is used by views that store view selection state in the model to return the selection count.</p>
         *
         * @return {number} The number of selected records.
         */
        getSelectedCount: function() {
            return this._selection.size;
        },

        /**
         * <p>Return an array of the selected records. This only applies if a view is storing selection state
         * in the model. The selection may be incomplete if the model hasn't fetched all the data yet.
         * The {@link model#getSelectionState} method is used to tell if the selection is incomplete.</p>
         * <p>This is used by views that store view selection state in the model to return the selection.
         * It is generally best to get the selected records from the view layer.</p>
         *
         * @return {model.Record[]} The selected records.
         */
        getSelectedRecords: function() {
            return [...this._selection.values()] // the selection of iNodes as an array
                .sort( (a, b) => { return a.index - b.index; } ) // sorted in collection order
                .map( n => { return n.record; } ); // just want the records
        },

        /**
         * <p>Returns an object with information about the selection state stored in the model.</p>
         * <p>This method should only be used by view widgets that persist the view selection state in the model.
         * @return {object} The returned object has these properties:</p>
         * <ul>
         *     <li>incomplete: true if the intended selection includes records that have not yet been loaded
         *     into the model.</p>
         * </ul>
         */
        // todo document more of the properties
        getSelectionState: function() {
            return {
                selectAll: this._selectAll,
                incomplete: this._selectRange != null,
                rangeAnchor: this._selectAnchor
            };
        },

        // todo xxx what selection options to set?
        //   select aggregates
        //   select hidden
        //   select all
        //   initial selection OK

        /**
         * Determine if the given record can be edited.
         *
         * <p>For a record to be editable:</p>
         * <ul>
         * <li>the model must have the <code class="prettyprint">editable</code> option set to true and</li>
         * <li>the type of the record must allow edit or</li>
         * <li>if the record has no type or doesn't specify if it can be edited the default type must allow edit</li>
         * <li>and if the model specifies an additional <code class="prettyprint">check</code> callback
         *   function it must allow or deny the edit</li>
         * </ul>
         *
         * @param {model.Record} pRecord The record to check if editing is allowed.
         * @return {boolean} true if the record can be edited.
         * @example <caption>This example checks if editing is allowed before setting a value.</caption>
         * if ( myModel.allowEdit( record ) ) {
         *     myModel.setValue( record, "NAME", newName );
         * }
         */
        allowEdit: function( pRecord ) {
            return this.check( "canEdit", pRecord );
        },

        /**
         * Determine if the given record can be deleted.
         *
         * <p>For a record to be deletable:</p>
         * <ul>
         * <li>the shape must not be record</li>
         * <li>if the shape is a tree the record must not be the root record</li>
         * <li>the model must have the <code class="prettyprint">editable</code> option set to true</li>
         * <li>if the shape is a tree all the descendant nodes must also be deletable according to the following</li>
         * <li>the type of the record must allow "delete" or</li>
         * <li>if the record has no type or doesn't specify if it can be deleted the default type must allow "delete"</li>
         * <li>and if the model specifies an additional <code class="prettyprint">check</code> callback
         *   function it must allow or deny the "delete"</li>
         * </ul>
         *
         * @param {model.Record} pRecord The record to check if deleting is allowed.
         * @return {boolean} true if the record can be deleted.
         * @example <caption>This example checks if deleting is allowed before deleting a record.</caption>
         * if ( myModel.allowDelete( record ) ) {
         *     myModel.deleteRecords( [record] );
         * }
         */
        allowDelete: function( pRecord ) {
            const o = this._options;

            // TODO THINK should it be OK to delete the root? Perhaps only if showing the root
            if ( o.shape === SHAPE_RECORD || ( o.shape === SHAPE_TREE && pRecord === this._data )) {
                return false; // can't delete the record or the tree root
            }
            // for tree shape all the children must allow being deleted
            if ( o.shape === SHAPE_TREE ) {
                let descendantsDeletable = true, // start by assuming all descendants can be deleted
                    doCheck = false; // so we skip the first node which is pRecord because it is checked below.

                this.walkTree( pRecord, {
                    node: ( n ) => {
                        if ( doCheck && descendantsDeletable ) {
                            if ( !this.check( "canDelete", n ) ) {
                                descendantsDeletable = false;
                            }
                        }
                        if ( !descendantsDeletable ) {
                            return true; // already know at least one child can't be deleted so prune traversal
                        }
                    },
                    beginChildren: () => {
                        doCheck = true;
                    }
                } );
                if ( !descendantsDeletable ) {
                    return false;
                }
            }
            return this.check( "canDelete", pRecord );
        },

        /**
         * Determine if any record or one or more specific records can be added to the table collection or, for trees,
         * the parent record's children collection.
         *
         * <p>For any record or one or more specific records to be addable:</p>
         * <ul>
         * <li>the shape must not be record and</li>
         * <li>if the shape is a tree the parent record is required and must have a children collection</li>
         * <li>the model must have the <code class="prettyprint">editable</code> option set to true and</li>
         * <li>if the shape is tree the type of the parent record must allow "add" or</li>
         * <li>if the shape is table or the parent record has no type or doesn't specify if it allows "add" the
         * default type must allow "add"</li>
         * <li>and if the model specifies an additional <code class="prettyprint">check</code> callback function
         *   it must allow or deny the "add"</li>
         * <li>then, for tree shape only, if adding is allowed and <code class="prettyprint">pRecordsToAdd</code>
         *   is given then check if the type of each record to add is a valid child type for the parent using
         *   validChildren type property.</li>
         * </ul>
         *
         * @param {model.Record} [pParentRecord] The parent record to add children to if the shape is tree,
         *  null if the shape is table.
         * @param {string=} pAddAction Specifies how/why the records are to be added.
         *  Standard values are "new", "move", or "copy".
         * @param {(model.Record[])=} pRecordsToAdd An array of the records to be added. Only used for tree shape models.
         * @return {boolean} true if add is allowed.
         * @example <caption>This example checks if adding is allowed before inserting a record.</caption>
         * if ( myModel.allowAdd() ) {
         *     myModel.insertNewRecord();
         * }
         */
        allowAdd: function( pParentRecord, pAddAction, pRecordsToAdd ) {
            const o = this._options;
            let validChildren, addOK, t;

            if ( o.shape === SHAPE_RECORD ) {
                return false;
            }

            if ( o.shape === SHAPE_TREE ) {
                if ( !pParentRecord || !pParentRecord[this._childrenKey] ) {
                    return false;
                }
            }
            addOK = this.check( "canAdd", pParentRecord, pAddAction, pRecordsToAdd );

            if ( addOK && pRecordsToAdd && o.shape === SHAPE_TREE ) {
                t = this._getType( pParentRecord );
                if ( t.validChildren !== undefined) {
                    validChildren = t.validChildren;
                } else if ( o.types.default.validChildren !== undefined ) {
                    validChildren = o.types.default.validChildren;
                } else {
                    validChildren = true;
                }
                // addOK is already true look for a reason to not allow add
                if ( validChildren !== true ) {
                    for ( let i = 0; i < pRecordsToAdd.length; i++ ) {
                        if ( !validChildren.includes( pRecordsToAdd[i][this._typeKey] ) ) {
                            addOK = false;
                            break;
                        }
                    }
                }
            }
            return addOK;
        },

        /**
         * Determine if a record can be dragged.
         * Note this is just a check to see if the dragging can start. What is allowed on drop (move, copy etc.)
         * is a separate check.
         *
         * <p>For a record to be draggable:</p>
         * <ul>
         * <li>the shape must not be record and</li>
         * <li>the model must have the <code class="prettyprint">editable</code> option set to true and</li>
         * <li>the type of the record must allow drag or</li>
         * <li>if the record has no type or doesn't specify if it can be dragged the default type must allow drag</li>
         * <li>and if the model specifies an additional <code class="prettyprint">check</code> callback function
         *   it must allow or deny the drag</li>
         * </ul>
         *
         * @param {model.Record} pRecord The record to check if it can be dragged.
         * @return {boolean} true if the record can be dragged.
         */
        allowDrag: function( pRecord ) {
            const o = this._options;

            if ( o.shape === SHAPE_RECORD ) {
                return false;
            }
            return this.check( "canDrag", pRecord );
        },

        /**
         * <p>Determine what drag operations are allowed for a set of records. Not all views support dragging.
         * Dragging is a view operation. The model provides this method simply to allow type based configuration
         * of available drag operations. Note: The model types option is not currently documented and may change
         * in the future.</p>
         *
         * @param {model.Record[]} pRecords array of records to determine drag operations for or null when dragging
         *     an external record into this model.
         * @return {object} object with allowed drag operations. The properties are: "normal", "ctrl", "alt", "shift", "meta".
         *     The standard values are "move", "copy" or "add". Other values are allowed. The normal property is required.
         *     The default is: <code class="prettyprint">{ normal: "move", ctrl: "copy" }</code>
         *     or if <code class="prettyprint">pRecords</code> is null <code class="prettyprint">{ normal: "add" }</code>
         */
        dragOperations: function( pRecords ) {
            const o = this._options;
            let ops, type;

            if ( pRecords ) {
                if ( pRecords.length > 0 && this._typeKey ) {
                    // if all the nodes being dragged are of the same type use that type
                    type = pRecords[0][this._typeKey] || "default";
                    for ( let i = 1; i < pRecords.length; i++ ) {
                        if ( ( pRecords[i][this._typeKey] || "default" ) !== type ) {
                            type = "default"; // else use default type
                            break;
                        }
                    }
                } else {
                    type = "default";
                }
                if ( o.types[type].operations && o.types[type].operations.drag !== undefined ) {
                    ops = o.types[type].operations.drag;
                } else {
                    ops = o.types.default.operations.drag;
                }
            } else {
                ops = o.types.default.operations.externalDrag;
            }
            return ops;
        },

        /**
         * <p>Low level operation permission checking. Better to use {@link model#allowEdit}, {@link model#allowDelete},
         * {@link model#allowAdd}, {@link model#allowDrag}.
         * The purpose is to determine what kinds of edits are allowed.</p>
         *
         * <p>If the model is not editable (editable option is false) then no operations are allowed.
         * Also, no operations are allowed on deleted records or aggregate records. No operations are
         * allowed when the {@link model#event:refresh} notification <code class="prettyprint">clearDataPending</code>
         * property is true until the next fetch completes.</p>
         *
         * <p>Operation checking is based on the type of the record (as determined by the type field) and the type
         * information given to the model in the types option. Type names are strings. The special type name
         * "default" is used to provide a default when records don't have a type or the type of the record doesn't
         * specify a value for the operation. Note: The model types option is not currently documented and may change
         * in the future.</p>
         *
         * <p>Operations are strings. The standard operation permissions are "canAdd", "canDelete", "canEdit",
         * "canDrag". You can define your own as well.</p>
         *
         * <p>First the record itself is checked to see if it allows the operation by checking if the record metadata contains
         * the specified permission.
         * Next the type of the record is checked to see if it allows the operation.
         * If the record has no type or the operations for that type didn't specify a value for the operation then
         * the default type is checked to see if it allows the operation.
         * The value of an operation is true or false or a function that returns true or false. The function is
         * called in the context of this model with arguments <code class="prettyprint">pRecord, pAddAction, pRecordsToAdd</code>.
         * If the model options includes a <code class="prettyprint">check</code> function then it is called with the result so far and all the
         * same arguments as this check function. See {@link model.CheckCallback}.</p>
         *
         * @param {string} pOperation One of the default checks ("canEdit", "canDelete", "canAdd", "canDrag") or a custom
         * operation.
         * @param {model.Record} [pRecord] The record to check if action is allowed on it.
         * @param {(string)=} pAddAction Only used by allowAdd see {@link model#allowAdd} for details.
         * @param {(model.Record[])=} pRecordsToAdd Only used by allowAdd see {@link model#allowAdd} for details.
         * @return {boolean} true if the operation is allowed.
         */
        check: function( pOperation, pRecord, pAddAction, pRecordsToAdd ) {
            const o = this._options,
                t = this._getType( pRecord );
            let meta,
                result = false;

            // if not editable or there is a parent model and the parent record is deleted then no edit operations
            // are allowed, also don't allow edit if clearData was called and the clear is pending
            if ( !o.editable || this._masterRecordIsDeleted || this._clearDataPending ) {
                return false;
            }

            if ( pRecord ) {
                meta = this.getRecordMetadata( this._getIdentity( pRecord ) );
                if ( meta ) {
                    if ( meta.deleted || meta.agg ) {
                        // can't do anything to deleted records (except revert which is not handled with check)
                        // also can't do anything to an aggregate record
                        return false;
                    }
                    // special case to allow things that were added/inserted to be edited and deleted
                    if ( meta.inserted && ( pOperation === "canEdit" || pOperation === "canDelete" ) ) {
                        return true;
                    }
                }
            }

            if ( meta && meta[pOperation] !== undefined ) {
                result = meta[pOperation];
            } else if ( t.operations && t.operations[pOperation] !== undefined ) {
                result = t.operations[pOperation];
            } else if ( o.types.default.operations[pOperation] !== undefined ) {
                result = o.types.default.operations[pOperation];
            }
            if ( isFunction( result ) ) {
                result = result.call( this, pRecord, pAddAction, pRecordsToAdd );
            }
            if ( isFunction( o.check ) ) {
                result = o.check( result, pOperation, pRecord, pAddAction, pRecordsToAdd );
            }
            return result;
        },

        /**
         * <p>Return true if the record is disabled and false otherwise. The record disabled state is determined
         * by the record {@link model.RecordMetadata} <code class="prettyprint">disabled</code> property. If the
         * <code class="prettyprint">disabled</code> property is not defined or is null return a default of false.</p>
         *
         * @param {model.Record} pRecord The record to determine disabled state for.
         * @param {model.RecordMetadata} [pRecordMeta] Optional record metadata for <code class="prettyprint">pRecord</code>.
         *   Pass this in if it is already available from a previous call to {@link model#getRecordMetadata}
         *   otherwise it will be retrieved from the given record.
         * @returns {boolean} true if disabled and false otherwise.
         */
        // todo doc detail about getting default disabled state from type info
        isDisabled: function( pRecord, pRecordMeta ) {
            const o = this._options,
                t = this._getType( pRecord );
            let disabled = false;

            // Note disabled is a strange metadata property hence this method
            //   Disabled state is part of the record metadata but can also come from type info.
            //   If it changes expect a metadata change notification not a value change
            //   todo think being metadata means there is no easy way to get the value from a DB column without a server side change.
            //     maybe something like is done with allowedOperations.
            //     The server doesn't care what you put in the column it comes from. Currently only for editable models.

            if ( !pRecordMeta ) {
                pRecordMeta = this.getRecordMetadata( this.getRecordId( pRecord ) );
            } else if ( pRecordMeta.record !== pRecord ) {
                debug.warn( "Model: incorrect metadata or duplicate record id detected:",
                    this.getRecordId( pRecord ) );
            }
            if ( pRecordMeta.disabled != null ) {
                disabled = pRecordMeta.disabled;
            } else if ( t.isDisabled !== undefined ) {
                disabled = t.isDisabled;
            } else if ( o.types.default.isDisabled !== undefined ) {
                disabled = o.types.default.isDisabled;
            }
            return disabled;
        },

        /**
         * <p>Return the record for a given record id. This only considers records that are currently fetched
         * into the model. The server may have a record with the given record id but if it hasn't yet been
         * fetched into the model, it will not be found with this method.</p>
         * <p>For table or tree shape models that define an <code class="prettyprint">identityField</code>
         * option, call with the value of the record's identity field or if the records have multiple identity fields
         * call with an array of ids or a string representation of the combined identity fields as returned by
         * {@link model#getRecordId}.</p>
         * <p>For table shape models that don't define an <code class="prettyprint">identityField</code> option
         * call with the index of the record. This is the same as {@link model#recordAt}.
         * <p>For record shape models call with no record id to get the one and only model record.</p>
         * <p>For tree shape models that do not define an <code class="prettyprint">identityField</code> this
         * always returns null</p>
         * @param {string|string[]} [pRecordId] The record id.
         * @method getRecord
         * @memberof model
         * @instance
         * @return {model.Record|null} Record or null if no record corresponding to
         *   <code class="prettyprint">pRecordId</code> is found.
         * @example <caption>This example returns the record with identity "001002".</caption>
         * record = model.getRecord( "001002" );
         * @example <caption>This example has a table shape model with two identity fields. It returns the
         * record from a model with identity <code class="prettyprint">["AXB9", "00003"]</code>.</caption>
         * record = model.getRecord( ["AXB9", "00003"] );
         * @example <caption>This example returns the record from a model with shape record.</caption>
         * record = model.getRecord();
         */
        // getRecord: function( pRecordId )

        /**
         * <p>Get the value of a record field given the record itself
         * or omit the record when the model shape is record. See also {@link model#setValue}.</p>
         *
         * @param {model.Record} [pRecord] The record to return the value of the given column.
         *  Omit if model shape is record.
         * @param {string} pFieldName Name of record field to get.
         * @return {*} Value of record field.
         * @example <caption>This example returns the NAME field of the given record.</caption>
         * var name = model.getValue( someRecord, "NAME" );
         * @example <caption>This example returns the NAME field from a record shape model.</caption>
         * var name = model.getValue( "NAME" );
         */
        getValue: function( pRecord, pFieldName ) {
            if ( pFieldName === undefined ) {
                pFieldName = pRecord;
                pRecord = this._data;
            }
            let field = this.getFieldKey( pFieldName );

            return pRecord[field];
        },

        /**
         * <p>Set the value of a record field given the record itself
         * or omit the record when the model shape is record. See also {@link model#getValue}.</p>
         *
         * <p>An error is thrown if the record does not allow editing or the field does not allow being set.</p>
         *
         * @param {model.Record} [pRecord] The record that will have a field set to the given value.
         *  Omit if model shape is record.
         * @param {string} pFieldName Name of record field to set.
         * @param {*} pValue The value to set. Note: Although the model is flexible in the data types it can
         * store in a field the APEX server expects strings. In most cases you should convert the value to a
         * string. See the {@link model} interface description for details including the convention for storing
         * display value pairs.
         * @return {string|null} One of:
         * <ul>
         *     <li>"SET": The value was set.</li>
         *     <li>"DUP": The value was not set because of duplicate identity. This can only happen when setting an
         *     identity field. Note: Even if the new value is unique on the client it may still result in an
         *     error when saving because the client in general does not have all the data that the server does.</li>
         *     <li>"NC": The value was not set because the new value is equal to the old value.</li>
         *     <li>null: The record is not in the model.</li>
         * </ul>
         * @fires model#event:set
         * @example <caption>This example sets the NAME field of the given record.</caption>
         * model.setValue( someRecord, "NAME", newName );
         * @example <caption>This example sets the SALARY field of the given record. Note that the number
         * <code class="prettyprint">sal</code> is converted to a string.</caption>
         * model.setValue( someRecord, "SALARY", "" + sal );
         * @example <caption>This example sets the identity field PART_NO of the given record.
         * Variable <code class="prettyprint">newPartNo</code> is a string. It checks for
         * a duplicate value and gives a message if the new part number is already taken.</caption>
         * var result = model.setValue( someRecord, "PART_NO", newPartNo );
         * if ( result === "DUP" ) {
         *     apex.message.alert( "The part number " + newPartNo + " is already taken." );
         * }
         * @example <caption>This example sets the NAME field of a record shape model.</caption>
         * model.setValue( "NAME", newName );
         */
        // @param {boolean} pInternalNoMove for internal use only - not applicable for record shape models.
        setValue: function(pRecord, pFieldName, pValue, pInternalNoMove ) {
            var i, oldValue, field, iNode, meta, identity, originalIdentity, a, parentRecord, afterRecord, dependents, done,
                fieldDef,
                o = this._options,
                addedOriginal = false;

            if ( pValue === undefined ) {
                pValue = pFieldName;
                pFieldName = pRecord;
                pRecord = this._data;
            }

            field = this.getFieldKey( pFieldName );
            // To avoid this exception the UI should always do its own check to make sure edits are allowed.
            // TODO THINK provide an option to enforce edit checks if false cuts down on calls to check
            if ( !this.allowEdit( pRecord )) {
                throw new Error( "Set value not allowed for record" );
            }

            originalIdentity = this._getIdentity( pRecord );
            iNode = this.getRecordMetadata( originalIdentity );
            if ( !iNode ) {
                // nothing to set if record is not in the model!
                return null;
            }

            // if the field is readonly (unless there is a parent model field) or the cell is readonly. A checksum (ck) means readonly
            fieldDef = o.fields[pFieldName];
            if ( field === undefined || ( fieldDef.readonly && !fieldDef.parentField ) || iNode.fields && iNode.fields[pFieldName] && iNode.fields[pFieldName].ck ) {
                throw new Error( "Set value not allowed for field" );
            }

            if ( this._controlBreakKeys?.includes( field ) ) {
                // Changing the value of a control break field is not a good idea because it essentially "moves"
                // the record out of the control break. It was allowed before so don't want to disallow it now
                // for backward compatibility. The UI should constrain the user from making edits.
                // todo consider if this should not allow edit, cause a move to the new control break, or
                //   edit all records in the control break group.
                debug.warn( "Setting value of a control break field." );
            }

            // only update if new value is different from current value
            // Note: setting the value back to its original value does not "un-change" the record
            oldValue = pRecord[field];
            if ( !equalValue( oldValue, pValue ) ) {

                // todo && o.sortCompare if this._sortFields.includes( pFieldName )
                // if the seq or parent id field is changed then it is really a move operation. moveRecords will call setValue back
                if ( !pInternalNoMove && ( pFieldName === o.sequenceField || pFieldName === o.parentIdentityField ) ) {
                    a = parentRecord = afterRecord = null;
                    if ( pFieldName === o.sequenceField ) { // xxx or one of the sort fields
                        // find where to move this record to
                        if ( o.shape === SHAPE_TREE ) {
                            parentRecord = this.parent();
                            // there should probably be something else that keeps you from setting the parent identity of the root node
                            if ( parentRecord ) {
                                a = parentRecord[this._childrenKey];
                            }
                        } else { // table
                            a = this._data;
                        }
                        if ( a ) {
                            // xxx generalize for sortCompare make a sortCompare out of sequenceKey
                            // a must be sorted asc by sequence key
                            // models with sequence fields tend to be small if this turns out to be false switch to binary search
                            let seqValue = parseFloat( pValue );

                            for ( i = 0; i < a.length; i++ ) {
                                if ( ( parseFloat( a[i][this._sequenceKey] ) > seqValue ) ) {
                                    break;
                                }
                                afterRecord = a[i];
                            }
                            if ( afterRecord === pRecord ) { // avoid noop move; don't move if would move after self
                                afterRecord = null;
                            }
                        }
                    } else if ( pFieldName === o.parentIdentityField ) {
                        parentRecord = this.getRecord( pValue );
                    }
                }

                if ( !iNode.original ) {
                    iNode.original = copyRecord( pRecord );
                    addedOriginal = true;
                }

                pRecord[field] = pValue;
                identity = this._getIdentity( pRecord );
                if ( identity !== originalIdentity ) {
                    if ( this._index.has( identity ) ) {
                        // there is already an existing record with the same identity
                        // undo the setValue
                        pRecord[field] = oldValue;
                        if ( addedOriginal ) {
                            delete iNode.original;
                        }
                        return "DUP";
                    }
                    if ( !iNode.originalId ) {
                        iNode.originalId = originalIdentity;
                    }
                    this._index.delete( originalIdentity );
                    this._index.set( identity, iNode );
                    // if record is selected then update the selection index as well
                    if ( iNode.sel ) {
                        this._selection.delete( originalIdentity );
                        this._selection.set( identity, iNode );
                    }
                }

                if ( !iNode.updated && !iNode.deleted && !iNode.inserted ) {
                    // first time being changed so add to change list
                    this._addChange( iNode );
                }
                if ( o.trackChanges ) {
                    iNode.updated = true;
                }
                if ( !iNode.fields ) {
                    iNode.fields = {};
                }
                meta = iNode.fields[pFieldName];
                if ( !meta ) {
                    meta = {};
                    iNode.fields[pFieldName] = meta;
                }
                if ( o.trackChanges ) {
                    meta.changed = true;
                }

                // assume any change fixes any row level validation problem
                if ( iNode.error || iNode.warning ) {
                    this.setValidity( "valid", identity );
                }

                notifyChange( this, N_SET, {
                    oldValue: oldValue,
                    oldIdentity: identity !== originalIdentity ? originalIdentity : null,
                    recordId: identity,
                    record: pRecord,
                    field: pFieldName
                } );

                this._checkAggregates( pFieldName );

                // see if other fields need to be recalculated
                dependents = this._dependentFields[pFieldName];
                if ( dependents ) {
                    if ( fieldDef.calcValue ) {
                        // just in case there is a circular chain of dependencies that includes this field
                        // let it be known that it has already been set so doesn't need to be recalculated
                        done = {};
                        done[pFieldName] = 1;
                    }
                    doCalculations( this, iNode, dependents, true, done );
                }

                if ( parentRecord || afterRecord ) {
                    this.moveRecords( [pRecord], parentRecord, afterRecord );
                }
                return "SET";
            }
            return "NC";
        },

        /**
         * <p>Get the value of a record field given the record id.
         * This is only useful when the model shape is table or tree.
         * If there are many field values to get or set use {@link model#getRecord} followed by {@link model#getValue}
         * or {@link model#setValue}. See also {@link model#setRecordValue}.</p>
         *
         * @param {string|string[]} pRecordId Value of the record's identity field or array of values of the record's
         *     identity fields or value returned by {@link model#getRecordId}.
         * @param {string} pFieldName Name of record field to get.
         * @return {*} Value of record field.
         * @example <caption>This example gets the NAME field of the record with identity "00013".</caption>
         * var name = model.getRecordValue( "00013", "NAME" );
         */
        getRecordValue: function( pRecordId, pFieldName ) {
            return this.getValue( this.getRecord( pRecordId ), pFieldName);
        },

        /**
         * <p>Set the value of a record field given the record id.
         * This is only useful when the model shape is table or tree.
         * If there are many field values to get or set use {@link model#getRecord} followed by {@link model#getValue}
         * or {@link model#setValue}. See also {@link model#getRecordValue}.</p>
         *
         * @param {string|string[]} pRecordId Value of the record's identity field or array of values of the record's
         *     identity fields or value returned by {@link model#getRecordId}.
         * @param {string} pFieldName Name of record field to set.
         * @param pValue {*} Value to set.
         * @example <caption>This example sets the NAME field of the record with identity "00013".</caption>
         * model.setRecordValue( "00013", "NAME", newName );
         */
        setRecordValue: function( pRecordId, pFieldName, pValue ) {
            this.setValue( this.getRecord( pRecordId ), pFieldName, pValue);
        },

        /**
         * <p>Sets the validity and associated validation message of a record or record field.</p>
         *
         * @param {string} pValidity one of "error", "warning", "valid".
         * @param {string} pRecordId Value of the record's identity field or array of values of the record's
         *     identity fields or value returned by {@link model#getRecordId}.
         * @param {string} [pFieldName] Name of field that the validity state applies to or null if it applies to the whole record.
         * @param {string} [pMessage] Error or warning message text or omit if valid
         * @example <caption>This examples calls a function, <code class="prettyprint">checkRecord</code>, that returns
         * an error message if the record is not valid and null if it is valid. It then sets the validity of the record.
         * </caption>
         * var invalidReasonMessage = checkRecord( recordId );
         * if ( invalidReasonMessage ) {
         *     model.setValidity( "error", recordId, null, invalidReasonMessage );
         * } else {
         *     this.model.setValidity( "valid", recordId );
         * }
         */
        setValidity: function( pValidity, pRecordId, pFieldName, pMessage ) {
            let prop, meta, hasError, index, curValidity, curMessage, changedProps,
                iNode = this._index.get( makeIdentityKey( pRecordId ) );

            if ( iNode ) {
                if ( pFieldName ) {
                    if ( !iNode.fields ) {
                        iNode.fields = {};
                    }
                    meta = iNode.fields[pFieldName];
                    if ( !meta ) {
                        meta = {};
                        iNode.fields[pFieldName]  = meta;
                    }
                } else {
                    meta = iNode;
                }
                curValidity = "valid";
                curMessage = meta.message || pMessage; // if there is no message make current same as pMessage for compare below
                if ( meta.warning ) {
                    curValidity = "warning";
                }
                if ( meta.error ) {
                    curValidity = "error";
                }
                // only update if there is a change
                if ( pValidity !== curValidity || curMessage !== pMessage ) {
                    changedProps = "message";
                    switch ( pValidity ) {
                        case "error":
                            prop = "error";
                            delete meta.warning;
                            break;
                        case "warning":
                            prop = "warning";
                            delete meta.error;
                            break;
                        case "valid":
                            delete meta.error;
                            delete meta.warning;
                            delete meta.message;
                            break;
                        default:
                            throw new Error( "Invalid value for pValidity parameter: " + pValidity );
                    }
                    if ( pValidity !== curValidity ) {
                        if ( curValidity !== "valid" ) {
                            changedProps += "," + curValidity;
                        }
                        if ( prop ) {
                            changedProps += "," + prop;
                        }
                    }
                    if ( prop ) {
                        meta[prop] = true;
                        meta.message = pMessage;
                    }
                    // if record or any fields have an error add to _errors list otherwise remove from list
                    hasError = iNode.error;
                    if ( !hasError && iNode.fields ) {
                        for ( let f in iNode.fields ) {
                            if ( hasOwnProperty( iNode.fields, f ) ) {
                                if ( iNode.fields[f].error ) {
                                    hasError = true;
                                    break;
                                }
                            }
                        }
                    }
                    if ( hasError ) {
                        index = this._errors.indexOf( iNode );
                        // if already present remove from where it is
                        if ( index >= 0 ) {
                            this._errors.splice( index, 1 );
                        }
                        this._errors.push( iNode );
                    } else {
                        this._removeError( iNode );
                    }
                    this.metadataChanged( pRecordId, pFieldName, changedProps );
                }
            }
        },

        /**
         * <p>Delete one or more records from a table or tree.
         * </p>
         * <p>If the <code class="prettyprint">onlyMarkForDelete</code>
         * option is true the records are just marked for delete.
         * Records marked for delete will be included in data returned by {@link model#forEach}, {@link model#forEachInPage},
         * {@link model#walkTree}, etc. and can be found by {@link model#getRecord}. They will be deleted once the
         * {@link model#clearChanges} method is called explicitly or implicitly after data has been saved successfully.
         * </p>
         * <p>If the <code class="prettyprint">onlyMarkForDelete</code> option is false
         * the records are deleted right away and are no longer part of the model. In either case the deleted records
         * are on the change list so the deletion can be persisted.</p>
         *
         * <p>If <code class="prettyprint">pRecords</code> contains records that cannot be found in the collection
         * or finds records that can't be deleted they are ignored and a debug warning is given.</p>
         *
         * @param {model.Record[]} pRecords An array of records to delete.
         * @returns {number} The number of records deleted or marked for delete.
         * @fires model#event:delete
         * @example <caption>This example checks if deleting is allowed before deleting a record.</caption>
         * if ( myModel.allowDelete( record ) ) {
         *     myModel.deleteRecords( [record] );
         * }
         */
        deleteRecords: function( pRecords ) {
            const o = this._options,
                toDelete = [],
                deleted = [],
                deletedIds = [];
            let resequenceStartIndex = -1;

            if ( o.shape === SHAPE_RECORD ) {
                throw invalidShapeError( "deleteRecords" );
            }

            // pre validate the records and for tree nodes add descendants.
            for ( let i = 0; i < pRecords.length; i++ ) {
                let rec = pRecords[i],
                    recordId = this._getIdentity( rec ),
                    iNode = this.getRecordMetadata( recordId );

                if ( !iNode ) {
                    debug.warn( "Record to delete not found: " + recordId );
                    continue;
                }

                if ( !this.allowDelete( rec ) ) {
                    debug.warn( "Delete not allowed for record: " + recordId );
                    continue;
                }
                if ( o.shape === SHAPE_TREE ) {
                    // todo make sure there are no duplicates
                    this.walkTree( rec, {
                        postNode: ( n ) => {
                            toDelete.push( n );
                        }
                    } );
                } else {
                    toDelete.push( rec );
                }
            }

            for ( let i = 0; i < toDelete.length; i++ ) {
                const rec = toDelete[i],
                    recordId = this._getIdentity( rec ),
                    iNode = this.getRecordMetadata( recordId );

                if ( o.shape === SHAPE_TABLE ) {
                    this._numDeletedRecords += 1;
                }
                if ( !o.onlyMarkForDelete || iNode.inserted ) {
                    if ( o.shape === SHAPE_TABLE && iNode.inserted ) {
                        this._numDeletedRecords -= 1;
                        this._numInsertedRecords -= 1;
                    }
                    // remove from collection
                    this._removeRecord( recordId, iNode );
                    // resequence makes no sense for tree shape
                    if ( o.shape === SHAPE_TABLE &&
                        ( resequenceStartIndex === -1 || iNode.index < resequenceStartIndex ) ) {
                        resequenceStartIndex = iNode.index;
                    }
                }
                if ( iNode.inserted ) {
                    // Deleting something that was inserted is as if it was never inserted.
                    // Remove from change list and later from the collection
                    delete iNode.inserted;
                    delete iNode.autoInserted;
                    delete iNode.updated;
                    this._removeError( iNode );
                    this._removeChange( iNode );
                } else {
                    // clear errors on delete
                    clearRecordChanges( iNode, true ); // only clear errors not changes
                    this._removeError( iNode );
                    if ( o.trackChanges ) {
                        iNode.deleted = true; // mark as deleted
                    }
                    this._addChange(iNode); // record delete change
                }
                deleted.push( rec );
                deletedIds.push( recordId );
            }

            if ( resequenceStartIndex >= 0 ) {
                this._resequenceServerOffset( resequenceStartIndex );
            }
            if ( deleted.length > 0 ) {
                notifyChange( this, N_DELETE, {
                    records: deleted,
                    recordIds: deletedIds
                } );
                this._checkAggregates(); // check all
            }
            return deleted.length;
        },

        /**
         * <p>Return true if the record exists in the model and has a change that can be reverted
         * (is updated or is deleted). See also {@link model#revertRecords}.</p>
         *
         * @param {model.Record} pRecord The record to check if it can be reverted.
         * @return {boolean} true if the record has a change that can be reverted.
         * @example <caption>This example checks if a record can be reverted before reverting it.</caption>
         * if ( myModel.canRevertRecord( record ) ) {
         *     myModel.revertRecords( [record] );
         * }
         */
        canRevertRecord: function( pRecord ) {
            const iNode = this.getRecordMetadata( this._getIdentity( pRecord ) );

            return !!( iNode && ( iNode.original || iNode.deleted ) );
        },

        /**
         * <p>Revert one or more records to the way they were when first added to the model or last saved.
         * This undoes any changes made to the records. See also {@link model#canRevertRecord}.</p>
         *
         * @param {model.Record[]} pRecords The records to revert.
         * @returns {number} The number of records reverted. This can be less than the number of records in
         *   <code class="prettyprint">pRecords</code> if some of the records had no changes to revert.
         * @fires model#event:revert
         * @example <caption>This example checks if a record can be reverted before reverting it.</caption>
         * if ( myModel.canRevertRecord( record ) ) {
         *     myModel.revertRecords( [record] );
         * }
         */
        revertRecords: function( pRecords ) {
            const o = this._options;
            let newIds = {},  // map from old (changed) ids to new (reverted) ids
                reverted = [],
                revertedIds = [];

            for ( let i = 0; i < pRecords.length; i++ ) {
                let a, index,
                    rec = pRecords[i],
                    recordId = this._getIdentity( rec ),
                    iNode = this.getRecordMetadata( recordId );

                if ( !iNode ) {
                    debug.warn( "Record to revert not found: " + recordId );
                    continue;
                }

                if ( !iNode.original && !iNode.deleted ) {
                    debug.warn( "Nothing to revert for record " + recordId );
                    continue;
                }

                if ( o.shape === SHAPE_TABLE ) {
                    a = this._data;
                    index = iNode.index;
                } else if ( o.shape === SHAPE_TREE ) {
                    a = this.parent( iNode.record )[this._childrenKey];
                    index = a.indexOf( iNode.record );
                }

                if ( iNode.deleted ) {
                    if ( o.shape === SHAPE_TABLE ) {
                        this._numDeletedRecords -= 1;
                    }
                    delete iNode.deleted;
                } else {
                    // if the identity/primary key has been edited reinsert in index under original id
                    if ( iNode.originalId ) {
                        this._index.set( iNode.originalId, iNode );
                        this._index.delete( recordId );
                        // if record is selected then update the selection index as well
                        if ( iNode.sel ) {
                            this._selection.set( iNode.originalId, iNode );
                            this._selection.delete( recordId );
                        }
                        newIds[recordId] = iNode.originalId;
                        delete iNode.originalId;
                    }
                    if ( iNode.original ) {
                        iNode.record = iNode.original;
                        delete iNode.original;
                    }
                    delete iNode.updated;
                }
                // even deleted records can have errors that need clearing (bug 35046331)
                clearRecordChanges( iNode );
                this._removeError( iNode );
                this._removeChange( iNode ); // this checks to make sure there are no remaining changes

                // update in collection if needed
                rec = iNode.record;
                if ( o.shape !== SHAPE_RECORD && a[index] !== rec ) {
                    a[index] = rec;
                }
                reverted.push( rec );
                revertedIds.push( recordId );
            }

            if ( reverted.length > 0 ) {
                notifyChange( this, N_REVERT, {
                    records: reverted,
                    recordIds: revertedIds,
                    newIds: newIds
                } );
                this._checkAggregates(); // check all
            }
            return reverted.length;
        },

        // todo currently no way to add a record as the first one in a control break
        /**
         * <p>Inserts a new record into the collection. Only applies to tree and table shape models.
         * For tree shape models the record is inserted under the given parent node. The model must
         * allow adding new records. See {@link model#allowAdd}.</p>
         *
         * @param {model.Record} [pParentRecord] Parent tree node. Only for tree shape models, must be null otherwise.
         * @param {model.Record} [pAfterRecord] Record after which to insert the new record. If not given
         *   the new record is inserted at the beginning.
         * @param {model.Record} [pNewRecord] The new record to insert. If not given a new record is created using
         *   defaults. The identity, meta, children, and parent fields if any will be initialized.
         *   Control break fields will get the control break values from the control break the record is being
         *   inserted into.
         * @return {string} The temporary primary key of inserted record.
         * @fires model#event:insert
         */
        insertNewRecord: function( pParentRecord, pAfterRecord, pNewRecord ) {
            const o = this._options;
            let iNode, index, pk, newRecord, a, parent,
                newControlBreak = false,
                newControlBreakEnd = false,
                afterId = null;

            if ( o.shape === SHAPE_RECORD ) {
                throw invalidShapeError( "insertNewRecord" );
            }

            // assume if there is a new record it has control break field values filled in.
            newRecord = this._initRecord( pNewRecord, null, pParentRecord );

            if ( !this.allowAdd( pParentRecord, "new", [newRecord] ) ) {
                throw new Error( "Insert not allowed for new record" );
            }

            // insert in collection
            if ( o.shape === SHAPE_TREE ) {
                if ( pParentRecord ) {
                    parent = pParentRecord;
                } else {
                    parent = this._data;
                }
                a = parent[this._childrenKey];
            } else { // table
                a = this._data;
            }
            index = 0;
            pk = this._getIdentity( newRecord );
            if ( pAfterRecord ) {
                let iNodePrev;

                afterId = this._getIdentity( pAfterRecord );
                iNodePrev = this.getRecordMetadata( afterId );
                if ( iNodePrev ) {
                    if ( o.shape === SHAPE_TABLE ) {
                        index = iNodePrev.index + 1;
                    } else {
                        index = a.indexOf( iNodePrev.record ) + 1;
                    }
                    // check if the record to insert after was the last record in the control break
                    if ( this._controlBreakKeys && iNodePrev.endControlBreak ) {
                        const controlBreakId = this.getControlBreakId( pAfterRecord );
                        let cbInfo = this._controlBreaksMap.get( controlBreakId );

                        newControlBreakEnd = true;
                        if ( pNewRecord && controlBreakId !== this.getControlBreakId( newRecord ) ) {
                            // there is a new record and it has control break values that cause a new control break
                            // to be added
                            newControlBreak = true;
                        } else {
                            // now this new record is the last in the control break so remove endControlBreak
                            // from after record.
                            cbInfo.lastId = pk;
                            delete iNodePrev.endControlBreak;
                            if ( this._metaKey ) {
                                delete pAfterRecord[this._metaKey].endControlBreak;
                            }
                        }
                    }
                }
            } else if ( this._controlBreakKeys && pNewRecord ) {
                // check if creating a new controlBreak at the start
                if ( this.getControlBreakId( this.recordAt(0) ) !== this.getControlBreakId( newRecord ) ) {
                    newControlBreak = true;
                    newControlBreakEnd = true;
                }
            }
            //xxx sortCompare for insert if sortCompare and sort fields have values ignore after record and figure out the index from sortCompare
            if ( this._sequenceKey ) {
                let currentSequence = parseFloat( newRecord[this._sequenceKey] ) || null,
                    // assign a sequence for this new record
                    [beginSeq, endSeq] = getSequenceBounds( a, index, this._sequenceKey );

                newRecord[this._sequenceKey] = "" + getSequence( o.sequenceStep, beginSeq, endSeq, 1, 1, currentSequence );
            }

            if ( !pNewRecord && this._controlBreakKeys ) {
                const breakSrcRecord = pAfterRecord ? pAfterRecord : this.recordAt( 0 );

                if ( breakSrcRecord ) {
                    // The new record must have control break column values consistent with the break it is
                    // being inserted into.
                    const controlBreakId = this.getControlBreakId( breakSrcRecord );
                    let cbInfo = this._controlBreaksMap.get( controlBreakId );

                    for ( let i = 0; i < this._controlBreakKeys.length; i++ ) {
                        newRecord[this._controlBreakKeys[i]] = cbInfo.values[i];
                    }
                }  else {
                    // The model must be empty so break columns will get default values
                    newControlBreak = true;
                    newControlBreakEnd = true;
                }
            }
            a.splice( index, 0, newRecord );
            iNode = { record: newRecord };
            if ( o.shape === SHAPE_TABLE ) {
                this._reindex( index + 1 );
                iNode.index = index;
            }

            // The newly inserted record is the new end of the control break
            if ( newControlBreakEnd ) {
                if ( this._metaKey ) {
                    newRecord[this._metaKey].endControlBreak = true;
                }
                iNode.endControlBreak = true;
            }
            // When the newly inserted record creates its own new control break group
            // add it to the controlBreaksMap.
            if ( newControlBreak ) {
                let controlBreakId = this.getControlBreakId( newRecord ),
                    cbInfo = {
                        values: this._controlBreakKeys.map( k => newRecord[k] ),
                        firstId: pk,
                        lastId: pk
                    };

                this._controlBreaksMap.set( controlBreakId, cbInfo );
            }
            // insert in index
            if ( o.trackChanges ) {
                iNode.inserted = true;
            }
            this._index.set( pk, iNode );
            this._addChange( iNode );
            if ( o.shape === SHAPE_TREE ) {
                iNode.parent = parent;
            } else {
                this._numInsertedRecords += 1;
            }

            calcRecordValues( this, iNode );

            notifyChange( this, "insert", {
                record: newRecord,
                recordId: pk,
                insertAfterId: afterId
            } );

            return pk;
        },

        /* TODO add this info once sequence is documented
         * <p>If there is a <code class="prettyprint">sequenceField</code> the records are assumed
         * to already be sorted by the sequence. The moved
         * records will be given new sequence numbers that maintain the order.</p>
         *
         * <p>Note: Unless the parent record changes or there is a sequence field there is no change and nothing to revert.</p>
         */
        /**
         * <p>Moves the given records to a new position in the collection (table or parentRecord's children) or, for
         * tree shape only, to a new parent node.</p>
         *
         * <p>For tree shape models if there is a <code class="prettyprint">parentIdentityField</code>
         * the moved records will have the parent identity field
         * set to the identity of the new parent record.</p>
         *
         * @param {model.Record[]} pRecords Array of records to move.
         * @param {model.Record} [pParentRecord] Only used when the shape is tree.
         *     This is the parent node to insert the moved records into. If null then insert to root.
         * @param {model.Record} [pAfterRecord] The moved records are added after this record or if null at the beginning.
         * @return {string[]} Array of record identities of moved records.
         * @fires model#event:move
         */
        moveRecords: function( pRecords, pParentRecord, pAfterRecord ) {
            let iNode, index, a, prev, prevIndex, record, recordId, beginSeq, endSeq, minIndex, maxIndex,
                o = this._options,
                recordIds = [],
                records = [],
                afterId = null;

            if ( o.shape === SHAPE_RECORD ) {
                throw invalidShapeError( "moveRecords" );
            }

            /* todo check if move is allowed
            table/tree: if there is a sequence field then check allowEdit
            tree: if moving from one parent to another it may make sense to check if delete is allowed.
            OTOH perhaps there should be a distinct allowMove
             for ( i = 0; i < nodes.length; i++ ) {
                 if ( !nodeAdapter.allowDelete( nodes[i] ) ) {
                     allAllowDelete = false;
                     break;
                 }
             }
             tree: if changing to a new parent check if allow add for the nodes
             if ( allAllowDelete && nodeAdapter.allowAdd( parentNode, "move", nodes ) ) {
                 focus = this.element.find( "." + C_FOCUSED ).length > 0; // if have focus then focus selection after move
                 this._moveOrCopy( {}, toParentNodeContent$, index, nodeContent$, false, focus );
             }
             */

            // where to start inserting the moved records
            if ( o.shape === SHAPE_TREE ) {
                if ( !pParentRecord ) {
                    pParentRecord = this._data;
                }
                a = pParentRecord[this._childrenKey];
            } else { // table
                a = this._data;
            }
            index = 0;
            if ( pAfterRecord ) {
                afterId = this._getIdentity( pAfterRecord );
                iNode = this.getRecordMetadata( afterId );
                if ( iNode ) {
                    index = a.indexOf( iNode.record ) + 1; // todo for table use iNode index
                }
                if ( !iNode || index < 0 ) {
                    debug.warn( "AfterRecord not found, move to beginning." );
                    index = 0;
                }
            }

            // xxx sortCompare for move? only applies for trees, ignore afterRecord find index
            if ( this._sequenceKey ) {
                // figure out the range for sequence numbers
                [beginSeq, endSeq] = getSequenceBounds( a, index, this._sequenceKey );
            }

            maxIndex = 0;
            minIndex = this._data.length;
            for ( let i = 0; i < pRecords.length; i++ ) {
                record = pRecords[i];
                recordId = this._getIdentity( record );
                iNode = this.getRecordMetadata( recordId );
                if ( !iNode ) {
                    debug.warn( "Record to move not found: " + recordId );
                    continue;
                }

                // remove from current location
                if ( o.shape === SHAPE_TREE ) {
                    prev = this.parent(record);
                    if ( !prev ) {
                        debug.warn( "Move not allowed for root" );
                        continue;
                    }
                    prev = prev[this._childrenKey];
                } else {
                    prev = a;
                }
                prevIndex = prev.indexOf(record); // todo for table use iNode index
                if ( o.shape !== SHAPE_TREE ) {
                    if ( prevIndex > maxIndex ) {
                        maxIndex = prevIndex;
                    }
                    if ( prevIndex < minIndex ) {
                        minIndex = prevIndex;
                    }
                }
                prev.splice( prevIndex, 1); // delete from table/previous parent node
                if ( a === prev && prevIndex < index ) {
                    // when reordering in the same node (or for table shape) take into consideration the node just deleted
                    index -= 1;
                }

                records.push( record );
                recordIds.push( recordId );

                // insert in collection
                a.splice( index, 0, record );
                if ( o.shape !== SHAPE_TREE ) {
                    if ( index > maxIndex ) {
                        maxIndex = index;
                    }
                    if ( index < minIndex ) {
                        minIndex = index;
                    }
                }
                index += 1;

                if ( this._sequenceKey ) {
                    let currentSequence = parseFloat( record[this._sequenceKey] ) || null;

                    // assign a sequence for this record
                    this.setValue( record, o.sequenceField, "" + getSequence( o.sequenceStep, beginSeq, endSeq, pRecords.length, i + 1, currentSequence ), true );
                }

                if ( o.shape === SHAPE_TREE ) {
                    iNode.parent = pParentRecord;
                    if ( this._parentIdKey ) {
                        this.setValue( record, o.parentIdentityField, this._getIdentity( pParentRecord ), true );
                    }
                }
                // no change to pk because nothing created and no identity changed just the position of the record has changed
                // but consider that the serverOffset no longer reflects the order in the array
            }
            if ( o.shape !== SHAPE_TREE ) {
                this._reindex( minIndex, maxIndex + 1 );
                this._resequenceServerOffset( minIndex );
            }
            notifyChange( this, "move", {
                records: records,
                recordIds: recordIds,
                insertAfterId: afterId
            } );
            // todo consider if aggregates need to be recalculated. They might if records moved from one control break to another

            return recordIds;
        },

        /**
         * <p>Copies the given records and inserts the copies into the collection (table or parent node's children) or,
         * for tree shape only, to a new parent node.</p>
         *
         * @param {model.Record[]} pRecords Array of records to copy.
         * @param {model.Record} [pParentRecord] Only used when the shape is tree. This is the parent node to insert the
         *   copies into. If null then insert to root.
         * @param {model.Record} [pAfterRecord] The copied records are added after this record or if null at the beginning.
         * @return {string[]} Array of temp primary keys of inserted records.
         * @fires model#event:copy
         * @example <caption>This examples copies the selected records to just after the last selected record.</caption>
         * var keys = model.copyRecords( selectedRecords, null, selectedRecords[ selectedRecords.length - 1 ] );
         */
        copyRecords: function( pRecords, pParentRecord, pAfterRecord ) {
            const self = this,
                o = this._options;
            let iNode, index, record, newRecord, recordId, a, pk, visitor, beginSeq, endSeq,
                recordIds = [],
                records = [],
                afterId = null;

            if ( o.shape === SHAPE_RECORD ) {
                throw invalidShapeError( "copyRecords" );
            }

            /* todo check if copy allowed
              tree: the parent should allow add for the given nodes
              if ( nodeAdapter.allowAdd( parentNode, "copy", nodes ) ) {
                 focus = this.element.find( "." + C_FOCUSED ).length > 0; // if have focus then focus selection after copy
                 this._moveOrCopy( {}, toParentNodeContent$, index, nodeContent$, true, focus );
             }
             table or tree if sequence field then check if can edit NO because can always edit what is inserted
             */
            // where to start inserting the copies
            if ( o.shape === SHAPE_TREE ) {
                visitor = {
                    node: function( n, p ) {
                        if ( p ) {
                            const pk = self._getIdentity( n ),
                                iNode = { record: n, inserted: true, parent: p };

                            self._index.set( pk, iNode );
                            self._addChange( iNode );
                        }
                    }
                };
                if ( !pParentRecord ) {
                    pParentRecord = this._data;
                }
                a = pParentRecord[this._childrenKey];
            } else { // table
                a = this._data;
            }
            index = 0;
            if ( pAfterRecord ) {
                afterId = this._getIdentity( pAfterRecord );
                iNode = this.getRecordMetadata( afterId );
                if ( iNode ) {
                    index = a.indexOf( iNode.record ) + 1; // todo for table use iNode index
                }
                if ( !iNode || index < 0 ) {
                    debug.warn( "AfterRecord not found, copy to beginning." );
                    index = 0;
                }
            }

            // xxx sortCompare for copy?
            if ( this._sequenceKey ) {
                // figure out the range for sequence numbers
                [beginSeq, endSeq] = getSequenceBounds( a, index, this._sequenceKey );
            }

            for ( let i = 0; i < pRecords.length; i++ ) {
                record = pRecords[i];
                recordId = this._getIdentity( record );
                iNode = this.getRecordMetadata( recordId );
                if ( !iNode ) {
                    debug.warn( "Record to copy not found: " + recordId );
                    continue;
                }

                newRecord = this._initRecord( null, pRecords[i], pParentRecord );
                // insert in collection
                a.splice( index, 0, newRecord );

                if ( this._sequenceKey ) {
                    // assign a sequence for this new record
                    newRecord[this._sequenceKey] = "" + getSequence( o.sequenceStep, beginSeq, endSeq, pRecords.length, i + 1 );
                }

                // insert in index
                pk = this._getIdentity( newRecord );
                records.push( newRecord );
                recordIds.push( pk );
                iNode = { record: newRecord, inserted: true, index: index };
                this._index.set ( pk, iNode );
                this._addChange( iNode );
                if ( o.shape === SHAPE_TREE ) {
                    iNode.parent = pParentRecord;
                    // when copying a tree node that has children all its children were also copied and also need to be inserted in the index
                    this.walkTree( newRecord, visitor, null );
                } else {
                    this._numInsertedRecords += 1; // doesn't apply for trees
                }
                index += 1;
            }
            this._reindex( index );

            notifyChange( this, "copy", {
                records: records,
                recordIds: recordIds,
                insertAfterId: afterId
            } );
            this._checkAggregates(); // check all

            return recordIds;
        },

        //
        // Tree shape specific methods
        //
        // For these methods the term node is used in place of record.
        //

        /**
         * <p>Return the root node of the tree. An error is thrown if the model shape is not tree.</p>
         *
         * @return {model.Node} Root node or null if there is no root.
         * @example <caption>This example gets the tree shape model root node.</caption>
         * var rootNode = model.root();
         */
        root: function() {
            if ( this._options.shape !== SHAPE_TREE ) {
                throw invalidShapeError( "root" );
            }
            return this._data;
        },

        /**
         * <p>Return the child at pIndex of node pNode.</p>
         *
         * <p>This method must only be used on tree shape models.</p>
         *
         * @param {model.Node} pNode The node who's ith child is to be returned.
         * @param {number} pIndex The index of the child node.
         * @return {model.Node} The ith child node.
         * @example <caption>This example loops over the children of a parent node.</caption>
         * var i, node;
         * for ( i = 0; i < model.childCount( parentNode ); i++ ) {
         *     node = model.child( parentNode, i );
         *     // do something with node
         * }
         */
        child: function( pNode, pIndex ) {
            const c = pNode[this._childrenKey];

            if ( c ) {
                return c[pIndex];
            }
            // undefined
        },

        /**
         * <p>Return the parent node of the given node. Only supported for tree shape models that have an
         * <code class="prettyprint">identityField</code> option defined.</p>
         *
         * <p>This method must only be used on tree shape models.</p>
         *
         * @param {model.Node} pNode The node to get the parent of.
         * @return {model.Node} Parent node or null for the root node and undefined otherwise
         */
        parent: function( pNode ) {
            if ( this._identityKeys ) {
                let id = this._getIdentity( pNode ),
                    iNode = this.getRecordMetadata( id );

                if ( iNode && hasOwnProperty( iNode, "parent" ) ) {
                    return iNode.parent ? iNode.parent : null;
                }
            }
            // undefined
        },

        /**
         * <p>Returns the number of children that node <code class="prettyprint">pNode</code> has, or null if the answer is not yet known.
         * A node that has its children lazy loaded may not know how many children it has until they are loaded.</p>
         *
         * <p>This method must only be used on tree shape models.</p>
         *
         * @param {model.Node} pNode The node whose children are to be counted.
         * @return {number|null} Number of children, 0 if none, or null if not known.
         * @example <caption>This example loops over the children of a parent node.</caption>
         * var i, node;
         * for ( i = 0; i < model.childCount( parentNode ); i++ ) {
         *     node = model.child( parentNode, i );
         *     // do something with node
         * }
         */
        childCount: function( pNode ) {
            const c = pNode[this._childrenKey];

            if ( c === null) {
                return null;
            } // else
            return c ? c.length : 0;
        },

        /**
         * <p>Returns true if the node <code class="prettyprint">pNode</code> has children, false if it does not,
         * and null if not yet known.
         * A node that has its children lazy loaded may not know if it has any children until they are loaded.
         *
         * @param {model.Node} pNode The node to check if it has any children.
         * @return {boolean} true if the node has children, false if it does not, and null if not known.
         * @example <caption>This example logs a message to the console if the node is a leaf (has no children).</caption>
         * if ( model.hasChildren( node ) === true ) {
         *     console.log("node is a leaf");
         * }
         */
        hasChildren: function( pNode ) {
            const c = pNode[this._childrenKey];

            if ( c === null) {
                return null;
            } // else
            return c ? c.length > 0 : false;
        },

        /**
         * <p>Fetch child nodes for node <code class="prettyprint">pNode</code>.
         * This method is only used for trees that lazy load data from the sever as needed.
         * If <code class="prettyprint">pNode</code> is not given or null the whole tree is loaded from the server.</p>
         *
         * <p>This is an asynchronous operation. When it completes the <code class="prettyprint">pCallback</code>
         * function is called with a status argument. Where status is:
         * <ul>
         *     <li>&gt; 0 (or true) if 1 or more children were fetched.</li>
         *     <li>0 if the node has 0 children.</li>
         *     <li>Error if there was an error fetching the children.</li>
         * </ul>
         *
         * <p>Can use either the callback argument or the returned promise to determine when the request is complete.</p>
         *
         * @param {model.Node} [pNode] The node record to fetch children for. If null or omitted fetch the root node.
         * @param {function} [pCallback] callback function that is called after nodes have been fetched or there is an error.
         * @return {promise} A promise that receives count of children fetched when resolved and an Error argument when rejected.
         * @fires model#event:addData
         */
        fetchChildNodes: function( pNode, pCallback ) {
            let p, promiseRet, requestData, requestOptions, thisRegion,
                o = this._options,
                deferred = makeDeferred();

            thisRegion = extend( {}, o.regionData, {
                id: o.regionId,
                ajaxIdentifier: o.ajaxIdentifier,
                fetchData: extend( {}, o.fetchData, {
                    version: o.version,
                    parentId: pNode ? this._getPrimaryKey( pNode ) : null
                } )
            } );

            requestData = {
                regions: [ thisRegion ]
            };
            if ( o.pageItemsToSubmit ) {
                requestData.pageItems = o.pageItemsToSubmit;
            }
            this._addParentItems( requestData.regions[0] );

            requestOptions = makeRequestOptions( o, this );
            if ( pNode ) {
                // don't want loading indicator on the whole region when fetching children
                // assume the view will handle progress indication
                delete requestOptions.loadingIndicator;
            }

            p = this._callServer( requestData, requestOptions );
            p.done( responseData => {
                if ( this._destroyed ) {
                    return;
                }

                let length,
                    // only expect to get response data for this model/region so it is in first and only region
                    regionData = responseData.regions[0].fetchedData;

                if ( pNode ) {
                    let children = regionData[this._childrenKey];
                    this._addData( pNode, null, children );
                    length = children.length;
                } else {
                    this._addData( null, null, regionData.root ); // could use setData but don't want extra refresh event
                    length = 1;
                }
                // todo some kind of notification? like refreshFromParentNode
                deferred.resolve( length );
            }).fail( function( jqXHR, textStatus, errorThrown ) {
                deferred.reject( makeAjaxError( "Error fetching child nodes.", jqXHR, textStatus, errorThrown ) );
            });

            promiseRet = deferred.promise();
            if ( pCallback ) {
                promiseRet.always( pCallback );
            }
            return promiseRet;
        },

        // todo clearChildren method - the intention is that you can fetch new data for a sub tree
        // todo issue is unsaved changes in branch
        clearChildNodes: function( pNode ) {
//            var c = pNode[this._childrenKey];
//            if ( c !== null) {
                // todo tree walk sub tree and clear any changes
//            }
            pNode[this._childrenKey] = null; // this means unknown so the server will be contacted
            // todo trigger some notification perhaps refresh with the parent node given
        },

        /**
         * <p>Traverse the tree shape model. This is a depth first search of the tree.
         * Methods of the <code class="prettyprint">pVisitor</code> object are called as follows:</p>
         * <ul>
         *     <li>First the visitor <code class="prettyprint">node</code> method is called for the
         *       <code class="prettyprint">pNode</code> passed to <code class="prettyprint">walkTree</code>.
         *       This allows pre-order search.</li>
         *     <li>If the node has children the next 3 steps are done.</li>
         *     <li>The visitor <code class="prettyprint">beginChildren</code> method is called.</li>
         *     <li>For each child node <code class="prettyprint">walkTree</code> is called performing these steps
         *       recursively. This node becomes <code class="prettyprint">pParentNode</code> and the child node
         *       becomes <code class="prettyprint">pNode</code>.</li>
         *     <li>The visitor <code class="prettyprint">endChildren</code> method is called.</li>
         *     <li>Last the visitor <code class="prettyprint">postNode</code> method is called for the
         *       <code class="prettyprint">pNode</code> passed to <code class="prettyprint">walkTree</code>.
         *       This allows post-order search.</li>
         * </ul>
         *
         * @param {model.Node} pNode The node to start with. This node is visited and then all of its children are.
         * @param {object} pVisitor
         * @param {function} [pVisitor.node] Function with signature function(node, parent). If the function returns
         *   true the node's children will not be visited. This is a way to exclude or prune sub branches of the tree
         *   during the traversal.
         * @param {function} [pVisitor.beginChildren] Function with signature function(node).
         * @param {function} [pVisitor.endChildren] Function with signature function(node).
         * @param {function} [pVisitor.postNode] Function with signature function(node, parent).
         * @param {model.Node=} pParentNode The parent node of <code class="prettyprint">pNode</code> or null if
         * <code class="prettyprint">pNode</code> is the root. If this argument is omitted or undefined and
         * the model has the <code class="prettyprint">identityField</code> option defined the parent node
         * will be determined automatically. If this argument is omitted or undefined and
         * the model does not have the <code class="prettyprint">identityField</code> option defined then
         * the parent parameter in the first call to the visitor <code class="prettyprint">node</code> method is null.
         *
         * @example <caption>This example walks the tree shape model starting at the root logging information
         * about the tree as it goes. Indentation shows the structure of the tree.
         * The nodes in this model have a NAME field.</caption>
         * var indent = "";
         * model.walkTree( model.root(), {
         *     node: function( node, parent ) {
         *         console.log( indent + "Node: " + model.getValue( node, "NAME" ) );
         *     },
         *     beginChildren: function( node ) {
         *         indent += "    ";
         *     },
         *     endChildren: function( node ) {
         *         indent = indent.substring(4);
         *     }
         * }, null );
         * @example <caption>This example walks the tree shape model starting at the root and processes
         *   the nodes in post-order. This means that the node's children are processed before the node.
         *   Depth or level information is not needed so the <code class="prettyprint">beginChildren</code> and
         *   <code class="prettyprint">endChildren</code> methods are omitted.</caption>
         * model.walkTree( model.root(), {
         *     postNode: function( node, parent ) {
         *         // do something to process the node
         *     },
         * }, null );
         */
        walkTree: function( pNode, pVisitor, pParentNode ) {
            let id, iNode, c, prune;

            if ( !pNode ) {
                return;
            }
            if ( pParentNode === undefined ) {
                pParentNode = null;
                id = this._getIdentity( pNode );
                if ( id ) {
                    iNode = this.getRecordMetadata( id );
                    if ( iNode ) {
                        pParentNode = iNode.parent;
                    }
                }
            }
            if ( pVisitor.node ) {
                prune = pVisitor.node( pNode, pParentNode );
                if ( prune ) {
                    return;
                }
            }
            c = pNode[this._childrenKey];
            if ( c && c.length > 0 ) {
                if ( pVisitor.beginChildren ) {
                    pVisitor.beginChildren( pNode );
                }
                for ( let i = 0; i < c.length; i++ ) {
                    this.walkTree( c[i], pVisitor, pNode );
                }
                if ( pVisitor.endChildren ) {
                    pVisitor.endChildren( pNode );
                }
            }
            if ( pVisitor.postNode ) {
                pVisitor.postNode( pNode, pParentNode );
            }
        },

        //
        // Notification subscription methods
        //

        /**
         * @typedef {object} model.Observer
         * @desc
         * <p>Information about an observer for subscribing to this model. See {@link model#subscribe} and
         * {@link model#unSubscribe}.</p>
         *
         * @property {string=} viewId A unique key that can be used to unsubscribe.
         *     A DOM element id makes a good unique key.
         * @property {function} onChange A function to receive change notifications. The signature is
         *     <code class="prettyprint">function(changeType, change)</code><br>
         *     <code class="prettyprint">changeType</code> is a string describing the change such as "delete"<br>
         *     <code class="prettyprint">change</code> is an object with details about the change.<br>
         *     See each notification for details.
         * @property {jQuery=} progressView jQuery object to center a progress spinner over while performing an
         *     asynchronous network operation such as {@link model#fetch} or {@link model#save}.
         * @property {object=} progressOptions Options object for {@link apex.util.showSpinner}.
         */

        /**
         * <p>Subscribe to model change notifications by adding an observer.</p>
         *
         * @param {model.Observer} pObserver An observer object that includes a callback function to receive notifications.
         * @return {string} A viewId to use with {@link model#unSubscribe}. This is the same as the
         *   <code class="prettyprint">viewId</code> property if there is one. One is generated if not given in
         *   <code class="prettyprint">pObserver</code>
         * @example <caption>This simple example subscribes to a model to handle notifications.</caption>
         * var viewId = model.subscribe( {
         *     onChange: function( changeType, change ) {
         *         // respond to model changes
         *     }
         * } );
         * @example <caption>This example is typical of what a widget that displays model data would do to subscribe.</caption>
         * var viewId = model.subscribe( {
         *     viewId: this.element[0].id
         *     onChange: function(changeType, change) {
         *         // respond to model changes
         *     },
         *     progressView: this.element
         * } );
         */
        subscribe: function( pObserver ) {
            let viewId = pObserver.viewId;

            if ( !viewId ) {
                viewId = "v::" + gNextViewId;
                gNextViewId += 1;
                pObserver.viewId = viewId;
            }
            this._listeners.push( pObserver );
            return viewId;
        },

        /**
         * <p>Unsubscribe to model change notifications.</p>
         *
         * @param {string} pViewId The view id returned from {@link model#subscribe}.
         * @example <caption>This example unsubscribes from this model using the <code class="prettyprint">viewId</code>
         * returned when subscribing.</caption>
         * model.unSubscribe(viewId);
         */
        unSubscribe: function( pViewId ) {
            for ( let i = 0; i < this._listeners.length; i++ ) {
                if ( this._listeners[i].viewId === pViewId ) {
                    this._listeners.splice( i, 1 );
                }
            }
        },

        /* notifications*/

        /**
         * Sent when the model has been given new data or there is a change in data
         * on the server that the model should now go get. In either case the previous data in the
         * model is gone/changed, unless the <code class="prettyprint">clearDataPending</code> property is true,
         * so any views showing the model data should re-render their views. If the
         * <code class="prettyprint">clearDataPending</code> property is true the data is waiting to be
         * cleared by the next fetch but is still in the model. See {@link model#clearData}.
         *
         * @event model#refresh
         * @property {string} changeType "refresh"
         * @property {object} change
         * @property {boolean} change.clearDataPending When true the data is not cleared until after
         * the next fetch request completes.
         */

        /**
         * Sent when specific records in the model have changed. This happens when the model is saved if
         * the server returns updated records or when {@link model#fetchRecords} is called. Both the record field values
         * and metadata may have changed. The view layer should render the new record including taking into
         * consideration any metadata and replace the existing view of the record.
         *
         * @event model#refreshRecords
         * @property {string} changeType "refreshRecords"
         * @property {object} change
         * @property {array} change.records Records that have been updated. Note for inserted items this includes the new id
         * @property {array} change.recordIds Record ids that have been changed. Note for inserted items the previous (old) id
         *    is given. The ith item in this array corresponds to the ith item in the records array.
         * @property {object} change.newIds For inserted records this is a map from the previous (old) id to the new id.
         */

        /**
         * Sent when the model has been saved (or {@link model#clearChanges} called) after all metadata related to changes
         * has been cleared.
         *
         * @event model#clearChanges
         * @property {string} changeType "clearChanges"
         * @property {object} change
         * @property {array} change.deletedIds Record ids for deleted records.
         * @property {array} change.changedIds Record ids for records that had been updated or inserted.
         */

        /**
         * Sent when data has been added to the model from the server.
         *
         * @event model#addData
         * @property {string} changeType "addData"
         * @property {object} change
         * @property {model.Node} change.parentNode Only for tree shape models. This is the parent node the data was added to or null if root.
         * @property {number} change.offset Index into the client model data. 0 for tree or record shape models
         * @property {number} change.count Number of records added to the model. For a tree shape model this is the number of nodes added
         *   to the parent or 1 if root. For table shape models the count could be less than the number
         *   of records returned by the server if some records were merged (replaced) existing record with same identity.
         * @property {array} change.replacedIds Only for table shape models. Array of record ids that were replaced.
         *   This happens when a record returned by the server is already in the model. In this case the existing
         *   record is replaced and the record id is added to this list.
         */

        /**
         * Sent when a field value of a record is changed.
         *
         * @event model#set
         * @property {string} changeType "set"
         * @property {object} change
         * @property {*} change.oldValue The previous value of the field.
         * @property {string} change.oldIdentity If the identity changed this is the previous identity value.
         * @property {string} change.recordId The id of the record that changed.
         * @property {model.Record} change.record The record that changed.
         * @property {string} change.field The name of the field that changed.
         */

        /**
         * Sent when one or more records are deleted.
         *
         * @event model#delete
         * @property {string} changeType "delete"
         * @property {object} change
         * @property {array} change.records The records that were deleted.
         * @property {array} change.recordIds The ids of the records that were deleted.
         *   The ith item in this array corresponds to the ith item in the records array.
         */

        /**
         * Sent when a record is inserted into the model.
         *
         * @event model#insert
         * @property {string} changeType "insert"
         * @property {object} change
         * @property {model.Record} change.record The inserted record.
         * @property {string} change.recordId The id of the inserted record.
         * @property {string} change.insertAfterId The id of the record that this new record was inserted
         *   after or null if inserted at the beginning.
         */

        /**
         * Sent when one or more records are copied.
         *
         * @event model#copy
         * @property {string} changeType "copy"
         * @property {object} change
         * @property {array} change.records The records that were copied.
         * @property {array} change.recordIds The ids of the records that were copied.
         *   The ith item in this array corresponds to the ith item in the records array.
         * @property {string} change.insertAfterId The id of the record that these new records were inserted after
         *   or null if inserted at the beginning.
         */

        /**
         * Sent when one or more records are moved.
         *
         * @event model#move
         * @property {string} changeType "move"
         * @property {object} change
         * @property {array} change.records The records that were moved.
         * @property {array} change.recordIds The ids of the records that were moved.
         *   The ith item in this array corresponds to the ith item in the records array.
         * @property {object} change.insertAfterId: The id of the record that these new records were inserted after
         *   or null if inserted at the beginning.
         */

        /**
         * Sent when record changes are reverted.
         *
         * @event model#revert
         * @property {string} changeType "revert"
         * @property {object} change
         * @property {array} change.records The records that were reverted.
         * @property {array} change.recordIds The ids of the records that were reverted.
         *   The ith item in this array corresponds to the ith item in the records array.
         * @property {object} change.newIds For records where the identity was changed and is now reverted this is a
         *   map from the previous (old) id to the new (reverted) id.
         */

        /**
         * Sent when metadata has changed. The record field values have not changed but the record or field
         * metadata has changed. Typically, this is the result of validation errors. If external code changes
         * the metadata it must call {@link model#metadataChanged} (which sends this notification) to let other views
         * know about the change.
         *
         * @event model#metaChange
         * @property {string} changeType "metaChange"
         * @property {object} change
         * @property {model.Record} change.record The record that changed.
         * @property {string} change.field The name of the field that changed or null if field metadata didn't change.
         * @property {string} change.property The name of the metadata property that changed or null if not specified.
         *     If multiple properties changed this can be a comma separated list.
         */

        /**
         * Sent when the model instance changes. This happens when the id of the master record in the parent model
         * that this model is associated with changes. A view that stores the model
         * id should update the instance portion of the model id in response to this notification.
         * This only applies to detail models.
         *
         * @event model#instanceRename
         * @property {string} changeType "instanceRename"
         * @property {object} change
         * @property {string} change.oldInstance The old instance.
         * @property {string} change.newInstance The new instance.
         */

        /**
         * Sent when the model is destroyed.
         *
         * @event model#destroy
         * @property {string} changeType "destroy"
         * @property {object} change There is no additional information so this object is empty.
         */

        //
        // Configuration methods
        //

        /**
         * <p>Get the value of the given model option. The model options are provided in the call
         * to {@link apex.model.create}. See also {@link model#setOption}.</p>
         *
         * @param {string} pName Name of option to get.
         * @return {*} Option value.
         * @example <caption>This example gets the <code class="prettyprint">onlyMarkForDelete</code> option.</caption>
         * var markForDelete = model.getOption( "onlyMarkForDelete" );
         * @example <caption>This example gets the <code class="prettyprint">hasTotalRecords</code> option.</caption>
         * var hasTotalRecords = model.getOption( "hasTotalRecords" );
         */
        getOption: function( pName ) {
            const value = this._options[pName];

            if ( value === undefined ) {
                throw new Error( "No such option: " + pName);
            }
            return value;
        },

        /**
         * <p>Set the value of the given model option. The model options are provided in the call
         * to {@link apex.model.create}. See also {@link model#getOption}.</p>
         *
         * <p>The options that can be set are:</p>
         * <ul>
         *     <li>genIdPrefix</li>
         *     <li>pageItemsToSubmit</li>
         *     <li>fetchData</li>
         *     <li>saveData</li>
         *     <li>regionData</li>
         *     <li>parentRecordId</li>
         *     <li>editable</li>
         *     <li>trackChanges</li>
         *     <li>onlyMarkForDelete</li>
         *     <li>pageSize</li>
         *     <li>requestOptions</li>
         *     <li>callServer</li>
         *     <li>visibilityFilter</li>
         *     <li>visibilityFilterContext</li>
         *     <li>delayClearData</li>
         * </ul>
         *
         * @param {string} pName Name of option to set. Not all options can be set.
         * @param {*} pValue Value to set the option to.
         */
        setOption: function( pName, pValue ) {
            const o = this._options;

            if ( gSettableOptions.has( pName ) ) {
                if ( pName === "editable" && !o.identityField && o.shape !== SHAPE_RECORD ) {
                    throw identityFieldRequiredError();
                }
                if ( pName === "trackChanges" && !pValue && o.onlyMarkForDelete ) {
                    // don't warn here because don't know if onlyMarkForDelete was explicitly set
                    o.onlyMarkForDelete = false;
                }
                if ( pName === "onlyMarkForDelete" && o.trackChanges === false ) {
                    if ( pValue ) {
                        debug.warn( pName + " cannot be true when trackChanges is false" );
                    }
                    pValue = false; // force to false when trackChanges is false
                }
                o[pName] = pValue;
            } else {
                debug.warn( "Option cannot be set: " + pName );
            }
        },

        //
        // Internal methods
        //

        _callServer: function( requestData, requestOptions ) {
            return ( this._options.callServer || server.plugin )( requestData, requestOptions );
        },

        _drainWaiters: function( err ) {
            for ( let i = 0; i < this._waitingPages.length; i++ ) {
                let waiter = this._waitingPages[i];

                // if have all the data or there is a record at the desired offset of the waiter then the waiters request should be able to be satisfied
                if ( this._haveAllData || this._data[waiter.offset] || err ) {
                    this._waitingPages.splice( i, 1 );
                    i -= 1; // stay in place because of removed waiter
                    if ( err && err.status !== 0 ) {
                        // reporting of errors is separate but caller is still expecting to be called back
                        callForEachCallback( waiter.thisArg, waiter.callback, null, -1, null, err );
                    } else {
                        waiter.next();
                    }
                    // In most cases data already fetched will completely satisfy any waiters but if for any reason
                    // a fetch is started must stop processing waiters to avoid an infinite loop
                    if ( this._requestsInProgress.fetch ) {
                        return;
                    }
                }
            }
        },

        // given an offset into _data return the corresponding server offset. Only used for table models
        _getServerOffset: function( offset ) {
            var id, iNode, record,
                i = offset - 1;

            // The offset into the server's result set can be different from the index into the model data array
            // because of aggregate records which the server doesn't count but this model does.
            record = this._data[i];
            while ( record ) {
                id = this._getIdentity( record, i );
                iNode = this.getRecordMetadata( id );
                if ( iNode && iNode.serverOffset >= 0 ) {
                    return iNode.serverOffset + 1;
                }
                i -= 1;
                record = this._data[i];
            }
            return offset;
        },

        _clear: function() {
            let o = this._options;

            if ( this._requestsInProgress.fetch || this._requestsInProgress.save ) {
                debug.error( "Model cleared during ajax request" );
            }
            this._haveAllData = false;
            this._clearDataPending = false;
            if ( o.shape === SHAPE_TABLE ) {
                this._data = [];
                if ( o.hasTotalRecords ) {
                    this._totalRecords = 0;
                } else {
                    this._totalRecords = -1; // unknown
                }
                this._offset = 0;
                // Keep track of number of inserted and deleted records to estimate the value returned by
                // getServerTotalRecords; what would the server report after a save.
                this._numInsertedRecords = 0;
                this._numDeletedRecords = 0;
                // keep track of the number of aggregate and disabled records to detect the select all state
                // when selection state kept in model.
                this._numAggregateRecords = 0;
                this._numDisabledRecords = 0;
                if ( this._masterRecordIsInserted ) {
                    this._haveAllData = true;
                }
                this._dataOverflow = false;
            } else {
                this._data = null;
            }
            this._changes = [];
            this._errors = [];
            this._index.clear();
            this._selection.clear();
            this._controlBreaksMap.clear();
            this._selectAll = false;
            this._selectRange = null;
            this._selectAnchor = null;

            // Allow control breaks to change, so cache the break field keys whenever the model is cleared
            this._controlBreakKeys = null; // when not null the model has control break fields defined
            let breakFields = [];

            for ( const [name, field] of Object.entries( o.fields ) ) {
                if ( field.controlBreakIndex > 0 ) {
                    breakFields.push( {n: name, i: field.controlBreakIndex } );
                }
            }
            breakFields.sort( ( a, b ) => a.i - b.i );
            if ( breakFields.length > 0 ) {
                this._controlBreakKeys = breakFields.map( f => this.getFieldKey( f.n ) );
            }
            // todo consider allowing other field metadata to change such as
            //  defaultValue, calcValue, dependsOn, aggregates
        },

        _checkClearPending() {
            if ( this._clearDataPending ) {
                this._clear(); // sets _clearDataPending to false
            }
        },

        _saveDataState: function() {
            this._saveState = {
                _data: this._data,
                _totalRecords: this._totalRecords,
                _haveAllData: this._haveAllData,
                _offset: this._offset,
                _numInsertedRecords: this._numInsertedRecords,
                _numDeletedRecords: this._numDeletedRecords,
                _numAggregateRecords: this._numAggregateRecords,
                _numDisabledRecords: this._numDisabledRecords,
                _dataOverflow: this._dataOverflow,
                _changes: this._changes,
                _errors: this._errors,
                _index: this._index,
                _controlBreaksMap: this._controlBreaksMap,
                _selection: this._selection,
                _selectAll: this._selectAll,
                _selectRange: this._selectRange,
                // todo consider if _selectAnchor should be saved
            };
            // don't want to share the saved index or selection with the model
            // expect _clear to be called but it doesn't create new maps
            this._index = new Map();
            this._selection = new Map();
            this._controlBreaksMap = new Map();
        },

        _restoreDataState: function() {
            const state = this._saveState;

            this._data = state._data;
            this._totalRecords = state._totalRecords;
            this._haveAllData = state._haveAllData;
            this._offset = state._offset;
            this._numInsertedRecords = state._numInsertedRecords;
            this._numDeletedRecords = state._numDeletedRecords;
            this._numAggregateRecords = state._numAggregateRecords;
            this._numDisabledRecords = state._numDisabledRecords;
            this._dataOverflow = state._dataOverflow;
            this._changes = state._changes;
            this._errors = state._errors;
            this._index = state._index;
            this._controlBreaksMap = state._controlBreaksMap;
            this._selection = state._selection;
            this._selectAll = state._selectAll;
            this._selectRange = state._selectRange;
        },

        _clearChanges: function( changeArray ) {
            const deletedIds = [],
                changedIds = [],
                o = this._options,
                changes = this[changeArray];
            let resequenceStartIndex = -1,
                resequenceNeeded = false;

            // for each change clear flags
            // Note when changes cleared after save the call to _updateData has already cleared some of these flags
            for ( let i = 0; i < changes.length; i++ ) {
                const iNode = changes[i],
                    id = this._getIdentity( iNode.record );

                if ( iNode.deleted && o.onlyMarkForDelete ) {
                    // actually have to remove the record at this point
                    this._removeRecord( id, iNode );
                    if ( o.shape === SHAPE_TABLE ) {
                        resequenceNeeded = true;
                    }
                }
                if ( iNode.deleted ) {
                    deletedIds.push( id );
                } else if ( iNode.inserted || iNode.updated ) {
                    changedIds.push( id );
                    if ( iNode.inserted && o.shape === SHAPE_TABLE ) {
                        iNode.serverOffset = 0;
                        resequenceNeeded = true; // The actual value gets set later by _resequenceServerOffset
                    }
                }

                if ( resequenceNeeded ) {
                    if ( resequenceStartIndex === -1 || iNode.index < resequenceStartIndex ) {
                        resequenceStartIndex = iNode.index;
                    }
                }

                delete iNode.deleted; // just in case
                delete iNode.recordId; // just in case
                delete iNode.inserted;
                delete iNode.autoInserted;
                delete iNode.updated;
                delete iNode.original;
            }

            if ( resequenceNeeded ) {
                this._resequenceServerOffset( resequenceStartIndex );
            }
            // need to clear _num[Inserted/Deleted]Records but first must reflect them in the _totalRecords
            if ( this._totalRecords >= 0 ) {
                this._totalRecords += this._numInsertedRecords;
                this._totalRecords -= this._numDeletedRecords;
            }
            this._numInsertedRecords = 0;
            this._numDeletedRecords = 0;

            // send notification because metadata for cleared records has changed
            this[changeArray] = [];
            notifyChange( this, N_CLEAR_CHANGES, {
                deletedIds: deletedIds,
                changedIds: changedIds
            } );
        },

        _reindex: function( startIndex,  endIndex ) {
            const data = this._data;
            let end = data.length;

            if ( endIndex != null && endIndex < end ) {
                end = endIndex;
            }

            for ( let i = startIndex; i < end; i++ ) {
                if ( data[i] !== undefined ) {
                    let id = this._getIdentity( data[i] );

                    this.getRecordMetadata( id ).index = i;
                }
            }
        },

        // When records are inserted or removed the serverOffset needs to be adjusted (see bug 25965625)
        _resequenceServerOffset: function( startIndex = 0 ) {
            const data = this._data;
            let rec, iNode,
                curOffset = -1;

            for ( ;; ) {
                if ( startIndex > 0 ) {
                    rec = data[startIndex - 1];
                    curOffset = this.getRecordMetadata( this.getRecordId( rec ) ).serverOffset;
                    if ( curOffset === undefined ) {
                        startIndex -= 1;
                        continue;
                    } // else done
                }
                break;
            }
            for ( let i = startIndex; i < data.length; i++ ) {
                rec = data[i];

                if ( rec ) {
                    iNode = this.getRecordMetadata( this.getRecordId( rec ) );
                    // not all records have a serverOffset
                    if ( iNode.serverOffset >= 0 ) {
                        curOffset += 1;
                        iNode.serverOffset = curOffset;
                    }
                } else {
                    curOffset += 1;
                }
            }
        },

        // when shape is tree offset is parent node or falsey for root and srvRecOffset is not used
        // total and moreData are just for table models
        _addData: function( offset, srvRecOffset, data, total, moreData, dataOverflow ) {
            const o = this._options,
                self = this,
                hasCalculatedValues = this._calculatedFields.length > 0;
            let id, meta, rec, dst, iNode, parentNode, curOffset, sOff, change, expectBreakStart,
                replaced, expectAggRecs, aggRecs;

            function setIndex( id, offset, index, rec ) {
                const meta = { record: rec };

                // if the record has metadata copy it
                if (self._metaKey) {
                    extend(meta, rec[self._metaKey]);
                    // convert Y/N used by server to true/false
                    meta.sel = meta.sel === true || meta.sel === "Y"; // xxx think this is intended for initial selection but what should be done after user changes selection. how can the initial total selection count be provided
                    // convert Y/N used by server to true/false
                    if ( meta.disabled != null ) {
                        meta.disabled = meta.disabled === true || meta.disabled === "Y";
                    }
                    if ( meta.agg && (!id || (self._identityKeys && !rec[self._identityKeys[0]] ) ) ) {
                        self._assignTempIdentity( rec );
                        id = self._getIdentity( rec );
                    }
                    // convert what APEX server sends in metadata to what the model access checking requires
                    updateWithAllowedOps( meta );
                }
                if ( offset != null ) {
                    meta.serverOffset = offset;
                }
                if ( index != null ) {
                    // for table models we keep the index of the record within _data in the index iNode/meta
                    // this is to avoid using array indexOf. see also _reindex, which keeps the index updated
                    meta.index = index;
                }
                if ( meta.agg ) {
                    self._numAggregateRecords += 1;
                }
                if ( meta.disabled ) {
                    self._numDisabledRecords += 1;
                }
                self._index.set( id, meta );
                if ( meta.sel || self._selectAll ||
                        ( self._selectRange && ( index > self._selectRange[0] && index <= self._selectRange[1] ) ) ) {

                    // don't set the selection if aggregate or disabled
                    if ( !meta.agg && !meta.disabled ) {
                        meta.sel = true;
                        // todo think: if just meta.sel is set, don't currently know if view is persisting selection
                        //   state so set selection anyway
                        self._selection.set( id, meta );
                    } else {
                        delete meta.sel;
                    }
                }
                if ( o.visibilityFilter && o.visibilityFilterContext ) {
                    meta.hidden = !o.visibilityFilter( self, rec, o.visibilityFilterContext );
                }
                normalizeDataValues( rec, o.fields, o.recordIsArray );
                if ( hasCalculatedValues && !meta.agg ) {
                    calcRecordValues( self, meta );
                }
                return meta;
            }

            function insertNeededAggregateRecords( index, aggRecs, grandTotal ) {
                let count = 0;

                for ( let i = 0; i < self._aggregateRecs.length; i++ ) {
                    let dst, rec, meta, pk,
                        name = self._aggregateRecs[i];

                    if ( !aggRecs[name] ) {
                        rec = self._initRecord( false ); // a aggregate record is an empty record, want no defaults
                        pk = self._getIdentity( rec );
                        // add aggregate record metadata
                        meta = {
                            agg: name
                        };
                        if ( grandTotal ) {
                            meta.grandTotal = grandTotal;
                        }
                        rec[self._metaKey] = meta;
                        dst = index + count;
                        if ( self._data[dst] ) {
                            // the insert case
                            self._data.splice( dst, 0, rec ); // no need to reindex here because the remaining items haven't been indexed yet
                        } else {
                            // the append case
                            self._data[dst] = rec;
                        }
                        setIndex( pk, null, dst, rec );
                        count += 1;
                    }
                }
                return count;
            }

            function finishCheckNeededAggRecs( i, meta, rec, expectAggRecs, aggRecs ) {
                if ( self._data.length > 0 && self._haveAllData && self._aggregateRecs.length > 0 ) {
                    if ( expectAggRecs ) {
                        // this is the case where there are control breaks
                        if ( meta && meta.grandTotal ) {
                            // if the last record is a grandTotal then need to back up over all the grandTotal agg records
                            for ( i = self._data.length - 1; i >= 0; i-- ) { // reusing i on purpose
                                rec = self._data[i];
                                meta = self._metaKey && rec[self._metaKey];
                                if ( !(meta && meta.agg && meta.grandTotal) ) {
                                    break;
                                }
                            }
                            i += 1;
                        }
                        i += insertNeededAggregateRecords( i, aggRecs );
                        self._reindex( i ); // need to reindex the records we backed up over
                    }
                    // currently assuming that a grand total is always desired
                    i = insertNeededAggregateRecords( self._data.length, aggRecs, true );
                    if ( i > 0 ) {
                        // may also need if have agg rec but not for same column
                        // assumes that for a given agg function server will either do all the columns or none
                        self._checkAggregates(); // check all
                    }
                }
            }

            function finishCheckSelection() {
                // todo think another case where knowing about the holes would be helpful
                if ( self._selectRange !== null ) {
                    let start = self._selectRange[0] + 1,
                        end = self._selectRange[1] - 1;

                    if ( self._selectAll ) {
                        start = 0;
                        end = self.getTotalRecords( true );
                    }
                    for ( let i = start; i < end; i++ ) {
                        if ( !self._data[i] ) {
                            return;
                        }
                    }
                    // if we get here then there were no holes in the range so remove range
                    self._selectRange = null;
                }
            }

            function updateControlBreaks( rec, id, sOff, where ) {
                const controlBreakId = self.getControlBreakId( rec );
                let cbInfo, iNode;

                if ( controlBreakId == null ) {
                    return;
                }

                cbInfo = self._controlBreaksMap.get( controlBreakId );
                if ( !cbInfo ) {
                    cbInfo = {
                        values: self._controlBreakKeys.map( k => rec[k] )
                    };
                    self._controlBreaksMap.set( controlBreakId, cbInfo );
                }
                if ( where === "start" ) {
                    iNode = cbInfo.firstId ? self.getRecordMetadata( cbInfo.firstId ) : null;
                    if ( !iNode || sOff < iNode.serverOffset ) {
                        cbInfo.firstId = id;
                    }
                } else if ( where === "end" ) {
                    iNode = cbInfo.lastId ? self.getRecordMetadata( cbInfo.lastId ) : null;
                    if ( !iNode || sOff > iNode.serverOffset ) {
                        cbInfo.lastId = id;
                        // todo think any case where endControlBreak needs to be updated?
                    }
                }
            }

            if ( o.shape === SHAPE_TABLE ) {
                // when paginationType is none or when starting at the beginning (and there are no changes) clear the model first
                if ( ( offset === 0 && !this.isChanged() ) || o.paginationType === PT_NONE ) {
                    this._clear();
                }
                if ( o.paginationType === PT_ONE ) {
                    this._offset = offset;
                }

                // total records is just advisory. The actual number of elements in _data can be different even when have all data
                this._totalRecords = -1; // unknown
                if ( total != null ) {
                    this._totalRecords = total;
                } else if ( o.hasTotalRecords ) {
                    debug.warn( "Model missing total records" );
                }
                if ( !this._haveAllData && !moreData ) {
                    // only set this once when reach the end. Only way to clear this is to clearData
                    // todo there could still be holes is there a need to know when really have all data? maybe _data.length === _index.size means have all data
                    this._haveAllData = true; // can never be true when pagination type is one
                }
                if ( dataOverflow ) {
                    this._dataOverflow = true;
                }

            } else if ( o.shape === SHAPE_RECORD ) {
                this._clear();
            }

            if ( o.shape === SHAPE_TREE && offset ) {
                debug.trace( "Model: " + this.modelId() + ". add data subtree: ", offset );
                parentNode = offset;

                parentNode[this._childrenKey] = data;
                if ( o.identityField ) {
                    // for tree models add parent reference to each node metadata
                    self.walkTree( parentNode, {
                        node: function( n, p ) {
                            if ( p ) {
                                let id = self._getIdentity( n ),
                                    meta = setIndex( id, null, null, n );

                                // todo think why does below set serverOffset and this doesn't serverOffset shouldn't apply to trees
                                meta.parent = p;
                            }
                        }
                    }, null );
                }
                notifyChange( this, N_ADD_DATA, {
                    parentNode: parentNode,
                    offset: 0,
                    count: data.length
                } );
            } else if ( this._data === null || this._data.length === 0 || o.shape !== SHAPE_TABLE || o.paginationType === PT_ONE ) {
                debug.trace( "Model: " + this.modelId() + ". add data set: ", offset, data?.length, total, moreData );
                this._data = data;
                this._numInsertedRecords = 0;
                this._numDeletedRecords = 0;
                this._numAggregateRecords = 0;
                this._numDisabledRecords = 0;
                // even if there is no identity still create an index to store metadata if any
                if ( o.shape !== SHAPE_RECORD ) {
                    change = {
                        offset: 0,
                        count: data.length
                    };
                    // this handles trees starting at the root and tables starting at the beginning
                    curOffset = srvRecOffset;
                    if ( o.shape === SHAPE_TREE && this.root() ) {
                        if ( o.identityField ) {
                            // for tree models add parent reference to each node metadata
                            this.walkTree( this.root(), {
                                node: function ( n, p ) {
                                    let meta,
                                        id = self._getIdentity( n );

                                    // todo THINK can tree models have aggregate records? Currently NO
                                    if ( self._metaKey && n[self._metaKey].agg ) {
                                        sOff = null;
                                    } else {
                                        sOff = curOffset;
                                        curOffset += 1;
                                    }
                                    meta = setIndex( id, sOff, null, n );
                                    meta.parent = p;
                                }
                            }, null );
                        }
                        change.parentNode = null;
                        change.count = 1;
                    } else {
                        expectBreakStart = true;

                        expectAggRecs = false;
                        aggRecs = {};
                        let i; // used after loop
                        for ( i = 0; i < this._data.length; i++ ) {
                            rec = this._data[i];
                            id = this._getIdentity( rec, i );
                            meta = this._metaKey && rec[this._metaKey];

                            if ( meta && meta.agg ) {
                                sOff = null;
                                aggRecs[meta.agg] = 1;
                            } else {
                                sOff = curOffset;
                                curOffset += 1;
                                if ( expectAggRecs ) {
                                    i += insertNeededAggregateRecords( i, aggRecs );
                                }
                                expectAggRecs = false;
                            }
                            // skip over aggregate records which are currently not
                            // correctly associated with the control break
                            if ( meta && this._controlBreakKeys && expectBreakStart && !meta.agg ) {
                                updateControlBreaks( rec, id, sOff, "start" );
                                expectBreakStart = false;
                            }

                            if ( meta && meta.endControlBreak ) {
                                updateControlBreaks( rec, id, sOff, "end" );
                                expectBreakStart = true;
                                if ( this._aggregateRecs.length > 0 ) {
                                    expectAggRecs = true;
                                    aggRecs = {};
                                }
                            }
                            setIndex( id, sOff, i, rec );
                        }
                        finishCheckNeededAggRecs( i, meta, rec, expectAggRecs, aggRecs );
                        finishCheckSelection();
                    }
                } else if ( this._data ) {
                    this._haveAllData = true; // once a record is set we have all the data
                    // a record shape
                    change = {
                        offset: 0,
                        count: 1
                    };
                    setIndex( this._getIdentity( this._data ), null, null, this._data );
                } else {
                    this._haveAllData = true; // even if server says there is no record we have all the data
                    // a record shape with a null record
                    change = {
                        offset: 0,
                        count: 0
                    };
                }
                notifyChange( this, N_ADD_DATA, change );
            } else {
                expectBreakStart = true; // may not be the actual start of a control break, but we treat it as such
                                         // until we know better

                // need to merge data in to existing data
                debug.trace( "Model: " + this.modelId() + ". add data merge: ", offset, data?.length, total, moreData );
                dst = offset;
                curOffset = srvRecOffset;
                replaced = [];
                expectAggRecs = false;
                aggRecs = {};
                let i; // used after loop
                for ( i = 0; i < data.length; i++ ) {
                    rec = data[i];
                    id = this._getIdentity( rec, dst );
                    meta = this._metaKey && rec[this._metaKey];

                    if (meta && meta.agg ) {
                        sOff = null;
                        aggRecs[meta.agg] = 1;
                    } else {
                        sOff = curOffset;
                        curOffset += 1;
                    }

                    iNode = this.getRecordMetadata( id );
                    // iNode is only found if there is a duplicate ID which means that the same record was fetched
                    // if the model already contains this record and it hasn't been changed then update it in place
                    if ( iNode ) {
                        // if it has changed then must just drop it
                        if ( iNode.updated || iNode.inserted || iNode.deleted ) {
                            continue;
                        }
                        // update: replace the existing record with the new one from the server
                        this._data[iNode.index] = rec;
                        normalizeDataValues( rec, o.fields, o.recordIsArray );
                        iNode.record = rec;
                        // the new record is being put in the old place so leave the serverOffset as is
                        // but decrement the currentOffset to account for it
                        curOffset -= 1;
                        // if there is metadata merge it in again
                        if ( meta ) {
                            // todo THINK no easy way to clean out prev metadata, perhaps delete fields?
                            // because the server only includes 'sel' metadata prop if it is true don't have to
                            // worry about overwriting the current selection state.
                            extend( iNode, meta );
                        }
                        replaced.push( id );
                        if ( hasCalculatedValues && !iNode.agg ) {
                            calcRecordValues( this, iNode );
                        }
                    } else {
                        // add to model
                        if ( this._data[dst] ) {
                            // Because of aggregate records returned by the server and records can be fetched in any order
                            // it is possible that there is already a different record where this one needs to go which
                            // is why it needs to be inserted before dst
                            this._data.splice( dst, 0, rec ); // xxx reindex?
                        } else {
                            this._data[dst] = rec;
                        }
                        // add index
                        setIndex( id, sOff, dst, rec );
                        dst += 1;
                    }
                    if ( meta ) {
                        // skip over aggregate records which are currently not
                        // correctly associated with the control break
                        if ( meta && this._controlBreakKeys && expectBreakStart && !meta.agg ) {
                            updateControlBreaks( rec, id, sOff, "start" );
                            expectBreakStart = false;
                        }
                        if ( !meta.agg ) {
                            if ( expectAggRecs ) {
                                dst += insertNeededAggregateRecords( dst, aggRecs );
                            }
                            expectAggRecs = false;
                        }
                        if ( meta.endControlBreak ) {
                            updateControlBreaks( rec, id, sOff, "end" );
                            expectBreakStart = true;
                            if ( this._aggregateRecs.length > 0 ) {
                                expectAggRecs = true;
                                aggRecs = {};
                            }
                        }
                    }
                }
                finishCheckNeededAggRecs( i, meta, rec, expectAggRecs, aggRecs );
                finishCheckSelection();
                change = {
                    offset: offset,
                    count: dst - offset
                };
                if ( replaced.length ) {
                    change.replacedIds = replaced;
                }
                notifyChange( this, N_ADD_DATA, change );
            }
        },

        _updateData: function( data, altMetaKey ) {
            const o = this._options,
                updatedRecs = [],
                updatedIds = [],
                deleted = [],
                deletedIds = [],
                newIds = {}, // map from old ids to new ids
                metaKey = altMetaKey || this._metaKey;
            let checkAgg = false,
                resequenceStartIndex = -1;

            for ( let i = 0; i < data.length; i++ ) {
                const rec = data[i],
                    meta = rec[metaKey];
                let iNode, id,
                    prevId = meta ? meta.recordId : null;

                // When saving or refreshing records it is possible that some of them are no longer found on the server
                if ( meta && prevId && meta.notFound ) {
                    iNode = this.getRecordMetadata( prevId );
                    this._removeRecord( prevId, iNode );
                    deleted.push( iNode.record );
                    deletedIds.push( prevId );
                    if ( resequenceStartIndex === -1 || iNode.index < resequenceStartIndex ) {
                        resequenceStartIndex = iNode.index;
                    }
                    continue;
                } // else
                id = this._getIdentity( rec );
                if ( prevId === id ) { // prevId is all about checking if there was a change in id
                    prevId = null;
                }
                iNode = this.getRecordMetadata( prevId ? prevId : id );

                // if the model contains this record update it
                if ( iNode ) {
                    if ( prevId ) {
                        newIds[prevId] = id;
                        // update the index
                        this._index.set( id, iNode );
                        this._index.delete( prevId );
                        this._selection.delete( prevId );
                        if ( iNode.sel ) {
                            this._selection.set( id, iNode );
                        }
                        if ( resequenceStartIndex === -1 || iNode.index < resequenceStartIndex ) {
                            resequenceStartIndex = iNode.index;
                        }
                        iNode.serverOffset = 0; // The actual value gets set later by _resequenceServerOffset
                        if ( this._controlBreakKeys ) {
                            // see if this record is the start or end of a control break and update the id if so
                            for ( const [, cbInfo] of this._controlBreaksMap ) {
                                if ( cbInfo.lastId === prevId ) {
                                    cbInfo.lastId = id;
                                }
                                if ( cbInfo.firstId === prevId ) {
                                    cbInfo.firstId = id;
                                }
                            }
                        }
                    }
                    updatedRecs.push( rec );
                    updatedIds.push( prevId || id );
                    this._data[iNode.index] = rec;
                    normalizeDataValues( rec, o.fields, o.recordIsArray );
                    iNode.record = rec;
                    // need to update record metadata again
                    if ( metaKey && meta ) {
                        extend(true, iNode, meta);
                        // extend handles changes in values but doesn't handle removed properties (bug 30889483)
                        if ( iNode.highlight && meta.highlight === undefined ) {
                            delete iNode.highlight;
                        }
                        // convert what APEX server sends in metadata to what the model access checking requires
                        updateWithAllowedOps( iNode );
                        delete iNode.recordId;
                    } else if ( altMetaKey ) {
                        if ( o.recordIsArray ) {
                            rec.splice(altMetaKey, 1);
                        } else {
                            delete rec[altMetaKey];
                        }
                    }
                    if ( o.visibilityFilter && o.visibilityFilterContext ) {
                        iNode.hidden = !o.visibilityFilter( this, rec, o.visibilityFilterContext );
                    }
                    calcRecordValues( this, iNode );

                    // updating the record value also clears some metadata
                    delete iNode.deleted; // just in case
                    delete iNode.inserted; // just in case
                    delete iNode.autoInserted;
                    delete iNode.updated;
                    delete iNode.original;
                    clearRecordChanges( iNode );
                    this._removeError( iNode );
                    this._removeChange( iNode );
                }
                // otherwise do nothing
            }

            if ( resequenceStartIndex >= 0 ) {
                this._resequenceServerOffset( resequenceStartIndex );
            }
            if ( updatedRecs.length > 0 ) {
                notifyChange(this, N_REFRESH_RECORDS, {
                    records: updatedRecs,
                    recordIds: updatedIds,
                    newIds: newIds
                });
                checkAgg = true;
            }
            if ( deleted.length > 0 ) {
                if ( this._totalRecords >= deleted.length ) {
                    this._totalRecords -= deleted.length;
                }
                notifyChange( this, N_DELETE, {
                    records: deleted,
                    recordIds: deletedIds
                } );
                checkAgg = true;
            }
            if ( checkAgg ) {
                this._checkAggregates(); // check all
            }
        },

        /*
         * Initialize and return a new record either completely new or using newRecord as a starting point
         * or as a copy of srcRecord and with an optional parentRecord
         * only one of newRecord or srcRecord should be set
         * if newRecord is false then no defaults will be used. Useful for aggregate records.
         */
        _initRecord: function( newRecord, srcRecord, parentRecord ) {
            const o = this._options;
            let dstChildren, dstRecord, masterModel, masterRecord,
                useDefaults = true;

            // Use pNewRecord or create new one
            if ( newRecord ) {
                dstRecord = newRecord;
            } else {
                if ( newRecord === false ) {
                    useDefaults = false;
                }
                dstRecord = o.recordIsArray ? [] : {};

                // create the new record with defaults or as copy
                for ( let i in o.fields ) {
                    if ( hasOwnProperty( o.fields, i ) ) {
                        let defValue, propDefault,
                            prop = o.fields[i],
                            key = o.recordIsArray ? prop.index : i;

                        if ( !prop.virtual ) {
                            if ( !srcRecord || prop.noCopy ) {
                                if ( prop.parentField && o.parentModel ) {
                                    if ( !masterModel ) {
                                        masterModel = model.get( o.parentModel );
                                        if ( masterModel && !masterRecord && o.parentRecordId ) {
                                            masterRecord = masterModel.getRecord( o.parentRecordId );
                                        }
                                    }
                                    if ( masterRecord ) {
                                        dstRecord[key] = masterModel.getValue( masterRecord, prop.parentField );
                                        continue;
                                    } // else fall through to use default value or empty string
                                }
                                defValue = "";
                                if ( useDefaults ) {
                                    propDefault = prop.defaultValue;
                                    if ( propDefault !== undefined ) {
                                        if ( typeof propDefault === "function" ) {
                                            defValue = propDefault( this, srcRecord ); // srcRecord only useful when copying and noCopy is true
                                        } else {
                                            defValue = propDefault;
                                        }
                                    }
                                }
                                if ( key !== this._metaKey ) {
                                    dstRecord[key] = defValue;
                                }
                            } else {
                                // copy all but identity fields; new values get assigned below
                                if ( !this._identityKeys.includes( key ) ) {
                                    dstRecord[key] = srcRecord[key];
                                }
                            }
                        }
                    }
                }
            }

            if ( masterModel ) {
                model.release( o.parentModel );
            }

            // set a temporary primary key - there should be one
            if ( this._identityKeys ) {
                this._assignTempIdentity( dstRecord );
            }
            // initialize metadata field if any
            if ( this._metaKey && dstRecord[this._metaKey] === undefined ) {
                dstRecord[this._metaKey] = {};
            }
            // the sequence field can't be set until the new record is inserted
            // also control break column values can't be set until record is inserted

            if ( o.shape === SHAPE_TREE ) {
                if ( this._parentIdKey ) {
                    dstRecord[this._parentIdKey] = this._getIdentity( parentRecord );
                }
                // a tree must have a children field todo tree not all nodes have children
                dstChildren = [];
                dstRecord[this._childrenKey] = dstChildren;
                if ( srcRecord ) {
                    let srcChildren = srcRecord[this._childrenKey];

                    if ( srcChildren ) {
                        for ( let i = 0; i < srcChildren.length; i++ ) {
                            dstChildren.push( this._initRecord( null, srcChildren[i], dstRecord ) );
                        }
                    }
                }
            }
            return dstRecord;
        },

        _assignTempIdentity: function( rec ) {
            for ( let i = 0; i < this._identityKeys.length; i++ ) {
                // if the record already has an identity value don't overwrite it
                if ( !rec[this._identityKeys[i]] ) {
                    rec[this._identityKeys[i]] = this._options.genIdPrefix + nextTempId( this.name );
                }
            }
        },

        _getIdentity: function( rec, index) {
            let id = null;

            if ( this._identityKeys !== undefined ) {
                if ( this._identityKeys.length === 1 ) {
                    id = rec[this._identityKeys[0]] + "";
                } else {
                    id = [];
                    for ( let i = 0; i < this._identityKeys.length; i++ ) {
                        id.push( rec[this._identityKeys[i]] + "" );
                    }
                }
            } else if ( index != null ) {
                id = index + "";
            } else if ( this._options.shape === SHAPE_RECORD ) {
                id = DEFAULT_REC_ID;
            }
            if ( id !== null ) {
                return makeIdentityKey( id );
            }
            return id;
        },

        // this is different from _getIdentity because it returns a form that is useful for the server
        _getPrimaryKey: function( rec ) {
            let key;

            if ( this._identityKeys !== undefined ) {
                key = [];
                for ( let i = 0; i < this._identityKeys.length; i++ ) {
                    key.push( rec[this._identityKeys[i]] + "" );
                }
            }
            return key;
        },

        _getType: function( rec ) {
            let t = "default",
                o = this._options;

            if ( rec && this._typeKey !== undefined ) {
                t = rec[this._typeKey];
                if ( t !== null && objectWithValue( t ) ) {
                    t = t.v;
                }
                if ( !t ) {
                    t = "default";
                }
            }
            return o.types[t] || o.types.default;
        },

        _getRecordById: function( id ) {
            let iNode = this._index.get( makeIdentityKey( id ) );

            return iNode ? iNode.record : null;
        },

        _removeRecord: function( id, iNode ) {
            const o = this._options;
            let a, pk, index;

            if ( o.shape === SHAPE_TABLE ) {
                a = this._data;
                index = iNode.index;
            } else if ( o.shape === SHAPE_TREE ) {
                a = iNode.parent[this._childrenKey];
                index = a.indexOf( iNode.record );
                delete iNode.parent;
            }
            // if this record was the end of a control break then the previous record becomes the
            // end of the control break
            if ( this._controlBreakKeys && iNode.endControlBreak ) {
                let prevRecord = a[index - 1],
                    curControlBreakId = this.getControlBreakId( iNode.record );

                if ( prevRecord && curControlBreakId === this.getControlBreakId( prevRecord ) ) {
                    // the previous record becomes the new end of the break
                    let prevId = this.getRecordId( prevRecord ),
                        iNodePrev = this.getRecordMetadata( prevId ),
                        cbInfo = this._controlBreaksMap.get( curControlBreakId );

                    cbInfo.lastId = prevId;
                    iNodePrev.endControlBreak = true;
                    if ( this._metaKey ) {
                        prevRecord[this._metaKey].endControlBreak = true;
                    }
                } else {
                    // this was the last record in the control break so the control break no longer exists
                    this._controlBreaksMap.delete( curControlBreakId );
                }
            }
            // remove from collection
            a.splice( index, 1 );
            this._reindex( index );
            // remove from index
            pk = makeIdentityKey( id );
            this._index.delete( pk );
            if ( iNode.sel ) {
                this._selection.delete( pk  );
            }
        },

        _addChange: function( iNode ) {
            if ( !this._options.trackChanges ) {
                return;
            }
            let index = this._changes.indexOf( iNode );

            // if already present remove from where it is
            if ( index >= 0 ) {
                this._changes.splice( index, 1 );
            }
            this._changes.push( iNode );
        },

        _removeChange: function( iNode ) {
            // when trackChanges is false should never find a change to remove so don't even bother
            if ( !this._options.trackChanges ) {
                return;
            }
            let index = this._changes.indexOf( iNode );

            if ( index >= 0 && !iNode.deleted && !iNode.updated && !iNode.inserted ) {
                this._changes.splice( index, 1 );
            }
        },

        _removeError: function( iNode ) {
            let index = this._errors.indexOf( iNode );

            if ( index >= 0 ) {
                this._errors.splice( index, 1 );
            }
        },

        _addParentItems: function ( request ) {
            var i, prop, masterModel, masterRecord, item, masterMeta,
                parentItems = {values:[]},
                o = this._options;

            if ( o.parentModel && o.parentRecordId ) {
                for ( i in o.fields ) {
                    if ( hasOwnProperty( o.fields, i ) ) {
                        prop = o.fields[i];
                        if ( prop.parentField ) {
                            if ( !masterModel ) {
                                masterModel = model.get( o.parentModel );
                                if ( masterModel && !masterRecord ) {
                                    masterRecord = masterModel.getRecord( o.parentRecordId );
                                    masterMeta = masterModel.getRecordMetadata( o.parentRecordId );
                                }
                            }
                            if ( masterRecord ) {
                                item = {
                                    n: prop.parentField,
                                    v: masterModel.getValue( masterRecord, prop.parentField )
                                };
//                                if ( masterMeta ) {
                                    // xxx ck
//                                }
                                parentItems.values.push( item );
                            }
                        }
                    }
                }
                if ( masterMeta ) {
                    if ( masterMeta.salt ) {
                        parentItems.salt = masterMeta.salt;
                    }
                    if ( masterMeta.protected ) {
                        parentItems.protected = masterMeta.protected;
                    }
                }
                if ( masterModel ) {
                    model.release( o.parentModel );
                }
                request.parentRecordId = o.parentRecordId;
                if ( parentItems.values.length > 0 ) {
                    request.parentItems = parentItems;
                }
            }
        },

        _updateAggregates: function() {
            var i, j, field, fieldName, aggFun, aggCtx,
                fields = this._options.fields,
                aggFields = [];

            if ( this._staleAggFields.length <= 0 ) {
                return; // nothing to do
            }

            for ( i = 0; i < this._staleAggFields.length; i++ ) {
                fieldName = this._staleAggFields[i];
                field = fields[fieldName];
                for ( j = 0; j < field.aggregates.length; j++ ) {
                    aggFun = field.aggregates[j];
                    if ( typeof aggFun === "string" ) {
                        aggFun = gAggregateFunctions[aggFun];
                    }
                    aggCtx = {
                        name: aggFun.name,
                        fieldName: fieldName,
                        key: this.getFieldKey( this._staleAggFields[i] ),
                        state: {
                            dataType: field.dataType,
                            formatMask: field.formatMask
                        },
                        agg: aggFun
                    };
                    aggCtx.agg.init( aggCtx.state );
                    aggFields.push( aggCtx );
                }
            }

            this.forEach( function( record, index, id ) {
                var i, value, oldValue,
                    meta = this.getRecordMetadata( id );

                for ( i = 0; i < aggFields.length; i++ ) {
                    aggCtx = aggFields[i];
                    if ( meta.agg ) {
                        // in _addData agg records are inserted as needed so there will be a place to put the results
                        if ( meta.agg === aggCtx.name ) {
                            let dataType = aggCtx.state.dataType,
                                formatMask = aggCtx.state.formatMask;

                            oldValue = record[aggCtx.key];
                            value = aggCtx.agg.get( aggCtx.state, !meta.grandTotal ) + "";
                            if ( dataType === "NUMBER" && formatMask ) {
                                value = locale.formatNumber( value, formatMask );
                            // todo date formatting
                            } else {
                                value = "" + value;
                            }
                            record[aggCtx.key] = value;
                            notifyChange( this, N_SET, {
                                oldValue: oldValue,
                                oldIdentity: null,
                                recordId: id,
                                record: record,
                                field: aggCtx.fieldName
                            } );
                        }
                    } else if ( !meta.deleted ) {
                        value = record[aggCtx.key];
                        aggCtx.agg.add( aggCtx.state, value );
                    }
                }
            }, this );

            this._staleAggFields = [];
        },

        _checkAggregates: function( fieldName ) {
            if ( !fieldName ) {
                // if no field name given then add them all
                for ( let name in this._aggregatedFields ) {
                    if ( hasOwnProperty( this._aggregatedFields, name ) ) {
                        this._checkAggregates( name );
                    }
                }
            } else if ( this._aggregatedFields[fieldName] && this._staleAggFields.indexOf( fieldName ) < 0 ) {
                this._staleAggFields.push( fieldName );
                this._debouncedUpdateAggregates();
            }
        },

        _recalculate: function( dependents ) {
            this.forEach( function( record, index, id ) {
                const iNode = this.getRecordMetadata( id );

                if ( !iNode.agg ) {
                    doCalculations( this, iNode, dependents, true );
                }

            }, this );
        }
    };

    const defaultOptions = {
            shape: SHAPE_TABLE,
            recordIsArray: false,
            hasTotalRecords: false,
            genIdPrefix: "t",
            regionId: null,
            ajaxIdentifier: null,
            pageItemsToSubmit: null,
            regionData: {},
            fetchData: {},
            saveData: {},
            requestOptions: {},
            version: 1,
            parentModel: null,
            parentRecordId: null,
            editable: false,
            trackChanges: true,
            onlyMarkForDelete: true,
            identityField: null,
            typeField: null,
            childrenField: null,
            parentIdentityField: null,
            sequenceField: null,
            metaField: null,
            sequenceStep: 10,
            saveSelection: false,
            types: {
                "default" : {
                    isDisabled: false,
                    validChildren: true, // any children are allowed
                    operations: {
                        canAdd: true,
                        canEdit: true,
                        canDelete: true,
                        canDrag: true,
                        drag: {
                            normal: "move",
                            ctrl: "copy"
                        },
                        externalDrag: {
                            normal: "add"
                        }
                    }
                }
            },
            check: null,
            sortCompare: null,
            callServer: null,
            paginationType: PT_NONE,
            pageSize: 100,
            preFetch: false,
            visibilityFilterContext: null,
            visibilityFilter: null,
            delayClearData: false
        },
        validShapes = new Set( [SHAPE_TABLE, SHAPE_TREE, SHAPE_RECORD] ),
        validPaginationTypes = new Set( [PT_NONE, PT_ONE, PT_PROGRESSIVE] );


    // todo cleanup this doc
    // Types (from treeview widget)
    // {
    //     "<type name or 'default'>": {
    //         icon:        <icon name or null>,
    //         classes:     <class name(s)>,
    //         isDisabled:  <true/false>,
    //         defaultLabel: <text>, xxx not used
    //         validChildren: [ "type", ... ] | true, // true allows any children, or an array of valid type names
    //         operations: {
    //             canAdd:    <true/false/function>, // Note: node must also have a children array to be able to add
    //             canDelete: <true/false/function>, // Note: can't delete root node
    //             canRename: <true/false/function>, xxx canEdit
    //             canDrag:   <true/false/function>
    //                                               // The above functions are called in the context of the adapter with arguments:
    //                                               //   node, operation, children. The last two only apply for canAdd. The function
    //                                               // must return true or false.
    //             drag: {
    //                 normal: <op>,
    //                 ctrl: <op>,
    //                 alt: <op>,
    //                 shift: <op>
    //            }, // <op> is a built in action "move", "copy", or "add" or a custom operation that can be handled in the beforeStop event
    //            externalDrag: <same object as drag> // only applies to the default type
    //         }
    //     },

    /**
     * @typedef {(string|array)} model.ModelId
     * @desc
     * <p>A model is uniquely identified by a string name and optional string instance id. The instance id is used to
     * support multiple detail models in a master detail arrangement. The instance id is the identity value of the
     * record in the master model for which the detail model pertains. The form for a model id is "name" or a
     * tuple array ["name","instance"]</p>
     * @example <caption>A model with no instance.</caption>
     * "MyModel"
     * @example <caption>A detail model with instance id "000109".</caption>
     * ["MyDetailModel", "000109"]
     */

    /**
     * @typedef {(array|object)} model.Record
     * @desc
     * A model record is either an array or an object depending on the model option <code class="prettyprint">recordIsArray</code>.
     */

    /**
     * @typedef {(array|object)} model.Node
     * @desc
     * A model node is a synonym for {@link model.Record} that is more naturally used when the model has a tree shape.
     */

    /* TODO future
     * like calculated columns and aggregates consider how highlights can be updated.
     * Also consider local sort, filter, validation
     * consider doc an aggregate interface to be passed as an aggregates item in place of the built-in functions.
     */

    // todo doc field meta property formatMask
    /**
     * @typedef {object} model.FieldMeta
     * @desc
     * The field metadata describes the field and affects how the model uses the field. It may contain additional
     * properties especially if the metadata is shared with view layers.
     *
     * @property {string} index Only used when records are arrays. This is the index into the array where the field
     *   value is stored.
     * @property {number} controlBreakIndex Indicates that the field is used as a control break and provides
     *   the order in which this field is sorted for that purpose. Starting at 1.
     *   The server is responsible for sorting the data. The view layer may provide additional configuration to
     *   control sorting. The end result is that the data is sorted so that all the records with the same
     *   control break column values ordered by <code class="prettyprint">controlBreakIndex</code> are
     *   grouped together. The server must also set the record metadata property
     *   <code class="prettyprint">endControlBreak</code>. See {@link model.RecordMetadata}.
     *   This field property can change after the model is initialized but doesn't take effect until after
     *   the model data is cleared with {@link model#clearData}.
     * @property {*} defaultValue This value is used when a new record is added or an existing record is duplicated
     *   and <code class="prettyprint">noCopy</code> is true.
     *   The defaultValue has no effect for the identity, meta, children, and parent fields if defined.
     *   If there is no defaultValue empty string is used.
     *   If defaultValue is a function it is called and the return value is used as the field's value. The function
     *   is passed the model. If the new record is a copy of an existing record the source record is also passed in.
     * @property {string} dataType The data type of the field value.
     * @property {function} calcValue This is a function used to calculate the value for the field. When any of the
     *   fields listed in the <code class="prettyprint">dependsOn</code> property change this function is called.
     *   The function signature is <code class="prettyprint">calcValue( argsArray, model, record ) return *</code>.
     *   The values of the fields listed in <code class="prettyprint">dependsOn</code> are passed
     *   in the <code>argsArray</code>. This function is also called when a record is received from the server and
     *   the value of this field is null or undefined.
     * @property {array} dependsOn An array of field names from this model that this field depends on.
     *   When any of the fields named in this array change then this field is either marked stale or if there is
     *   a <code class="prettyprint">calcValue</code> function the <code class="prettyprint">calcValue</code>
     *   function is called to recalculate the value of this field.
     * @property {array} aggregates An array of aggregate function names. The built-in aggregate function names
     *     are: "COUNT", "COUNT_DISTINCT", "SUM", "AVG", "MIN", "MAX", "MEDIAN".
     * @property {string} parentField Only applies if the model has a parentModel. When a new record is added or an existing record is
     *   duplicated and noCopy is true the value of this field is taken from the parentField of the parentModel
     *   This is useful for foreign key fields but can be any field that gets a default from the parentModel.
     * @property {boolean} noCopy If true the field value is not copied when a record is copied/duplicated.
     * @property {boolean} readonly If true the field cannot be edited.
     * @property {boolean} volatile The field is generated by the server. It cannot be edited. It is not sent back to the server. This means
     *   that for records stored as arrays the volatile fields should be at the end or the server must account
     *   for the missing volatile fields when using other field's index. Volatile fields may depend on (are calculated
     *   from) other fields and the value may be considered stale if the record is edited. It is up to the view
     *   layers to make this determination.
     * @property {boolean} virtual A virtual field has no associated data. None of the other properties apply. The main purpose for
     *   including a virtual field is so that view layers and the model can share the same field metadata.
     *   This allows view layers to have fields that don't have corresponding data in the model.
     */

    /**
     * <p>A callback function to do additional access checking. See the <code class="prettyprint">check</code>
     * option property of {@link apex.model.create} and the {@link model#check} method.</p>
     *
     * @callback model.CheckCallback
     * @param {boolean} pResult The result of the access checking so far.
     * @param {string} pOperation One of the default checks ("canEdit", "canDelete", "canAdd", "canDrag") or a custom
     *   operation.
     * @param {model.Record} pRecord The record to check if action is allowed on it.
     * @param {(string)=} pAddAction Only used by allowAdd see {@link model#allowAdd} for details.
     * @param {(model.Record[])=} pRecordsToAdd Only used by allowAdd see {@link model#allowAdd} for details.
     * @return {boolean} true if the operation is allowed.
     */

    /* TODO
     * @param {boolean} pOptions.saveSelection If true all selected records will be saved as well as any changed records.
     *   The selection state metadata property "sel": true will be included on any selected record. The default is false.
     *   It is up to the view layer to call the {@link model#setSelectionState} method to actually save the selection
     *   in the model.
     * @param {string} pOptions.sequenceField This only applies to models that support reordering.
     *   The name of the sequence field. The sequence field value should be a floating point number (or string representation of a number).
     *   This value will be updated when adding, copying, or moving records. The default is null. TODO finish implementing
     * @param {number} pOptions.sequenceStep Only used if sequenceField is given. This is the preferred distance between sequence values
     *  of adjacent records. The default is 10.
     * todo think sequence min precision or something to limit to integer, implies re sequenceing will be done.
     * @param {string} pOptions.typeField Name of type field. The type field associates a record with type information
     *   provided in the type option. The default is null. See the <code class="prettyprint">types</code> option for more information.
     * @param {function} pOptions.sortCompare A function to compare two records for the purpose of ordering.
     *   The function signature is the same as the Array sort method argument. This should not be used when the server
     *   does the sorting. This is most useful for tree shape models so that newly added records/nodes are
     *   put in the right order. TODO
     * @param {boolean} pOptions.preFetch If true additional data will start to be fetched before all of the existing data
     *   has been read by forEachInPage. The default is false. todo not yet implemented
     * @param {number} pOptions.types todo
     */
    /**
     * <p>Create a model with the given identity, options and optionally initial data.
     * When you are done with the model you must call {@link apex.model.release}. Or if you are sure no one else is using it
     * you can call {@link apex.model.destroy}.</p>
     *
     * @function create
     * @memberof apex.model
     * @param {model.ModelId} pModelId Model identifier. Must be unique for the page. Creating a model with an identifier
     *   that already exists will overwrite the existing model.
     * @param {object} pOptions Model options. All properties are optional unless specified otherwise.
     * @param {string} pOptions.shape The shape of data the model holds. One of "table", "tree", or "record". The default is "table".
     * @param {boolean} pOptions.recordIsArray If true record fields are stored in an array otherwise the record is an object.
     *   If recordIsArray is true then the field metadata must include the <code class="prettyprint">index</code> property. The default is false.
     * @param {boolean} pOptions.hasTotalRecords Only applies if <code class="prettyprint">shape</code> is "table".
     *   If true the sever will always provide the total number of records.
     *   The default is false unless paginationType is "none".
     * @param {string} pOptions.genIdPrefix A string prefix to use when generating ids for inserted records. The default is "t".
     * @param {Object.<string, model.FieldMeta>} pOptions.fields This required option defines the fields of each record.
     *   Each property is the name of a field. The value is a {@link model.FieldMeta} object with metadata about the field that
     *   the model uses.
     * @param {string} pOptions.regionId Primary region ID that this model is associated with for the purpose of exchanging
     *   data with the APEX server. If there is no regionId then the model cannot use standard requests to fetch or save
     *   data and therefore is just a local model. The default is null.
     * @param {string} pOptions.ajaxIdentifier The Ajax Identifier used to identify the Ajax call to fetch or save data.
     *   The default is null.
     * @param {string[]} pOptions.pageItemsToSubmit An array of page item names to submit when fetching and saving data.
     *   The default is null.
     * @param {object} pOptions.regionData Additional data to send at the region level for all requests. The default is an empty object.
     * @param {object} pOptions.fetchData Additional data to send in fetch requests. The default is an empty object.
     * @param {object} pOptions.saveData Additional data to send in save requests. The default is an empty object.
     * @param {object} pOptions.requestOptions The properties of this object are included
     *   in the options object of {@link apex.server.plugin} for any ajax requests made by the model. Setting the
     *   <code class="prettyprint">loadingIndicator</code> property will be ignored. See the
     *   <code class="prettyprint">makeLoadingIndicator</code> property for how to control the loading indicator.
     * @param {(number|string)} pOptions.version This is the version (could be a hash) of the model definition. The value
     *   is opaque to the model. It is sent in all requests; fetch, save etc. If the server detects that the version is
     *   different than it expects then it returns an error. This is to ensure that the client and server agree on the
     *   general model and field definitions. The default is 1. This option currently has no effect and is reserved
     *   for future use.
     * @param {model.ModelId} pOptions.parentModel Model identifier of parent (master) model or null if there is no parent.
     *   The default is null.
     * @param {string} pOptions.parentRecordId Only applies if parentModel is given. The record id of the record in the
     *   parent model that this model is associated with. Typically, this model's ModelId instance and the parentRecordId
     *   are the same. The default is null.
     * @param {boolean} pOptions.editable If true the model is editable and false otherwise. The default is false.
     * @param {boolean} pOptions.trackChanges If true changes to the model are tracked and can be saved. If false
     *   changes are not tracked and cannot be saved. Setting to false is useful for making optimistic UI updates. This
     *   is when changes are persisted in some other way and the model is updated to reflect the changes that
     *   were already saved. This only applies if editable is true. The default is true.
     * @param {boolean} pOptions.onlyMarkForDelete If false deleted records are removed from the collection.
     *   If true then deleted records are marked as deleted but remain in the collection. The default is true however
     *   if trackChanges is false then onlyMarkForDelete is also false.
     * @param {(string|string[])} pOptions.identityField Name of identity field or an array of identity field names if the
     *   records have a multivalued primary key. Required if editable is true and shape is not "record".
     *   It is a best practice to specify the identityField even if the model is not editable as it can be useful for
     *   pagination, selection, and fetching additional data. The default is null.
     * @param {string} pOptions.childrenField This only applies for tree shape models. The name of the field that
     *   contains an array of node children. The default is null.
     * @param {string} pOptions.parentIdentityField This only applies for tree shape models. The name of parent node
     *   identity field. The default is null.
     * @param {string} pOptions.metaField The name of meta field. The meta field stores metadata about the record and
     *   possibly record fields The default is null.
     * @param {model.CheckCallback} pOptions.check A function that is called to do additional permission checking.
     * @param {boolean} pOptions.delayClearData If false, data is cleared right way. If true, data is cleared after
     *   the next fetch completes. The default is false. Currently only applies to table shape models.
     *   See {@link model#clearData}.
     * @param {string} pOptions.paginationType One of "none", "one", "progressive".
     * <ul>
     * <li>none: No paging. The server has given all the data it has (it may be capped, but you can't get more)</li>
     * <li>one: The model contains just one page at a time. When it asks the server for a new page it
     *  replaces the previous one.</li>
     * <li>progressive: The model will keep adding to its collection as it gets additional pages from
     *   the server</li>
     * </ul>
     * <p>This only applies to table shape models. The default is "none".</p>
     * @param {number} pOptions.pageSize This is the number of table rows (records) to fetch from the server.
     *   This only applies to table shape models. The default is 100.
     * @param {function} pOptions.makeLoadingIndicator
     *   <code class="prettyprint">function(jQuery[] progressViews, Object[] progressOptions)</code>.
     *   This is a function that receives an array of progress views and a corresponding array of progress options and returns
     *   a function suitable for the {@link apex.server.plugin} <code class="prettyprint">loadingIndicator</code> option.
     *   It can also return null to disable showing any loading indicator.
     *   If not specified the default is to show the standard APEX progress spinner centered over any visible view(s)
     *   of the model. A view informs the model about its existence by subscribing to the model and passing in the
     *   <code class="prettyprint">progressView</code> and optional <code class="prettyprint">progressOptions</code>
     *   options. See also the {@link model#subscribe} method and {@link model.Observer}.
     * @param {function} pOptions.callServer - <code class="prettyprint">function(object requestData, object requestOptions) -> promise</code>.
     *   A function that is called in place of {@link apex.server.plugin} for all Ajax
     *   requests the model makes. This has the same signature as {@link apex.server.plugin} with the
     *   optional <code class="prettyprint">pAjaxIdentifier</code> parameter omitted. The jQuery promise returned must
     *   be resolved with the response data. This option allows hooking into the ajax requests to access the request
     *   and response data. In this case your <code class="prettyprint">callServer</code> function simply calls
     *   {@link apex.server.plugin}. This option can also be used to exchange data with something other than the APEX
     *   server for example by making a REST service ajax request. In this case the function must adapt the request and
     *   response data formats between what the model expects and what the REST service expects.
     *   See the {@link model} Ajax Messages section for details.
     * @param {function} pOptions.visibilityFilter <code class="prettyprint">function(model model, record record, object visibilityFilterContext) -> boolean</code>
     *   A function called by {@link model.updateVisibility} to determine which records are visible.
     *   This is also called when adding new records to the model. The function takes this model, the record,
     *   and the <code class="prettyprint">visibilityFilterContext</code> as arguments and returns true if the
     *   record is visible and false otherwise. See {@link model#updateVisibility} for an example.
     * @param {object} pOptions.visibilityFilterContext An object value to pass to the
     *   <code class="prettyprint">visibilityFilter</code>.
     *
     * @param {(array|object)} [pData] Initial data to add to the model. For table shape data it is an array of
     *   {@link model.Record}. For tree shape models it is a {@link model.Node} for the root. For record shape data it
     *   is a single {@link model.Record}. If null or not given there is no initial data.
     * @param {number} [pTotal] Total number of records in the server's collection. Only applies for table shape models.
     * @param {boolean} [pMoreData] If true there is more data available on the server for this model. If false
     *   <code class="prettyprint">pData</code> contains all the data. If omitted or null determine if there is more
     *   data based on <code class="prettyprint">pData</code> and <code class="prettyprint">pTotal</code>.
     *   If <code class="prettyprint">pTotal</code> is not given assume there is more data on server.
     *   Only applies for table shape models and only if <code class="prettyprint">paginationType</code> is not "none".
     *   For record shape models can be false when <code class="prettyprint">pData</code> is null to indicate
     *   that there is no data.
     * @param {boolean} [pDataOverflow] If true there is more than the sever configured maximum allowed records for
     *   this model. In other words the database has more records in the result set than it is willing to return.
     *   Putting a limit on the amount of data that can be returned is typically done so that both client and
     *   server resources are not overwhelmed. Only applies for table shape models.
     * @return {model}
     * @example <caption>This example creates a very simple local table shape model called "people" that stores name and age.
     * The records are arrays and the model is given some initial data. The model is editable and the ID field
     * is the record identity.</caption>
     * var fields = {
     *         ID: {
     *             index: 0
     *         },
     *         NAME: {
     *             index: 1
     *         },
     *         AGE: {
     *             index: 2
     *         }
     *     },
     *     data = [
     *         ["00010", "Mark", "32"],
     *         ["00091", "Mary", "27"],
     *         ...
     *     ];
     * apex.model.create("people", {
     *     shape: "table",
     *     recordIsArray: true,
     *     fields: fields,
     *     identityField: "ID",
     *     editable: true,
     *     paginationType: "none"
     * }, data, data.length );
     *
     * @example <caption>This example creates a table shape model that gets data from a REST service called from the
     * browser by using the <code class="prettyprint">callServer</code> option. The records are objects.
     * The example code only handles the fetch request.</caption>
     * function myRESTCallServer( requestData, options ) {
     *     var deferred = apex.jQuery.Deferred(),
     *         region = requestData.regions[0], // assume there is just one region in the request
     *         offset = region.fetchData.firstRow - 1, // convert to zero-based if needed
     *         count = region.fetchData.maxRows;
     *
     *     // make an ajax request using XMLHttpRequest or fetch API. Use offset and count to specify the page of
     *     // data to fetch as part of the REST URL.
     *     fetch( "some/REST/URL" ).then( function( response ) {
     *         var responseData = response.json();
     *         // suppose the REST service response is an array of records and the records do not have any nested
     *         // structure that needs to be adjusted and the array is in a variable called responseData.
     *         var response = {
     *             regions: [ {
     *                 id: region.id,
     *                 ajaxIdentifier: region.ajaxIdentifier,
     *                 fetchedData: {
     *                     values: responseData,
     *                     firstRow: offset,
     *                     moreData: true
     *                 }
     *             } ]
     *         };
     *         deferred.resolve( response )
     *     } );
     *     return deferred.promise();
     * }
     * var fields = ...;// define model fields according to what the REST service returns.
     * apex.model.create( "people", {
     *     shape: "table",
     *     recordIsArray: false,
     *     fields: fields,
     *     identityField: "ID", // this assumes the REST service returns a field with name "ID" that is the primary key
     *     callServer: myRESTCallServer,
     *     paginationType: "progressive"
     * }, null );
     */
    // todo need a parameter to set initial offset for pData
    model.create = function( pModelId, pOptions, pData, pTotal, pMoreData, pDataOverflow ) {
        const mId = makeModelId( pModelId ),
            that = Object.create( modelPrototype );
        let o, fields, myFields, field, pfMap, pField, value, moreData, m, masterRecordMeta, masterModel;

        function checkNoCalculations( fieldName, type ) {
            const field = o.fields[fieldName];

            if ( field.calcValue || field.dependsOn || ( field.aggregates && field.aggregates.length > 0 ) ) {
                debug.warn("Model " + type + " field does not support calculations");
                delete field.calcValue;
                delete field.dependsOn;
            }
        }

        function processCalcFields( fields, depMap, calcFields, aggFields, aggRecs ) {
            let agg, fieldName, field, dependsOn, aggName, depName, itemName,
                externalDeps = [],
                aggNames = {};

            const externalChangeHandler = function( event ) {
                const itemId = event.target.id;

                that._recalculate( that._dependentFields[":" + itemId] );
            };

            // a depends on b
            function dep(a, b) {
                if (!depMap[b]) {
                    depMap[b] = [];
                }
                depMap[b].push(a);
            }

            for ( fieldName in fields ) {
                if ( hasOwnProperty( fields, fieldName ) ) {
                    field = fields[fieldName];
                    if ( field.calcValue ) {
                        calcFields.push( fieldName );
                    }
                    dependsOn = field.dependsOn;
                    if ( dependsOn ) {
                        for ( let i = 0; i < dependsOn.length; i++ ) {
                            depName = dependsOn[i];
                            if ( depName.substr( 0, 1 ) === ":" ) {
                                // it's a page item
                                itemName = depName.substr( 1 );
                                if ( !apexItem( itemName ).node ) {
                                    throw fieldDependsError( fieldName, itemName );
                                }
                                externalDeps.push( itemName );
                            } else {
                                // its a column
                                // todo check parent models
                                if ( !fields[depName] ) {
                                    throw fieldDependsError( fieldName, depName );
                                }
                            }
                            dep( fieldName, depName );
                        }
                    }
                    if ( field.aggregates ) {
                        // validate aggregates
                        for ( let i = 0; i < field.aggregates.length; i++ ) {
                            agg = field.aggregates[i];
                            // must be a known built-in aggregate name or an object with correct interface
                            if ( ( typeof agg === "string" && !gAggregateFunctions[agg] ) ||
                                 ( typeof agg === "object" && !(agg.name && agg.init && agg.add && agg.get) ) ) {
                                throw new Error( `Field '${fieldName}' has invalid aggregate` );
                            }
                            aggName = agg.name || agg;
                            if ( !aggNames[aggName] ) {
                                aggRecs.push(aggName);
                            }
                            aggNames[aggName] = 1;
                        }
                        aggFields[fieldName] = 1;
                    }
                }
            }
            if ( externalDeps.length > 0 ) {
                that._externalItems$ = $( externalDeps.map( i => "#" + util.escapeCSS( i ) ).join( "," ) );
                that._externalItems$.on( 'change', externalChangeHandler );
                that._externalItemsHandler = externalChangeHandler;
            }
        }

        that.name = mId[0];
        that.instance = mId[1];
        that._requestsInProgress = {};
        that._listeners = [];
        that._waitingPages = [];
        fields = pOptions.fields;
        that._options = extend( true, {}, defaultOptions, pOptions );
        that._options.fields = fields; // it is important that fields map is not copied
        // todo consider if types should also not be copied; trouble is in the merging of defaults
        o = that._options;

        if ( !o.fields ) {
            throw new Error( "The fields option is required" );
        }
        if ( !validShapes.has( o.shape ) ) {
            throw new Error( "Invalid shape option: " + o.shape );
        }
        if ( !validPaginationTypes.has( o.paginationType ) ) {
            throw new Error( "Invalid paginationType option: " + o.paginationType );
        }

        if ( o.editable && !o.identityField && o.shape !== SHAPE_RECORD ) {
            throw identityFieldRequiredError();
        }

        if ( o.shape === SHAPE_TREE && !o.childrenField ) {
            throw new Error( "A tree shaped model requires a childrenField" );
        }

        if ( o.shape === SHAPE_TABLE && o.paginationType === PT_NONE && pOptions.hasTotalRecords === undefined ) {
            o.hasTotalRecords = true;
        }

        if ( !o.trackChanges && o.onlyMarkForDelete ) {
            if ( pOptions.onlyMarkForDelete ) {
                // only warn if explicitly set to true
                debug.warn( "Model forcing onlyMarkForDelete to false" );
            }
            o.onlyMarkForDelete = false;
        }

        // _dependentFields is map field name -> array of field names that need to recalculate or be invalidated (stale) when field changes
        that._dependentFields = {};
        // _calculatedFields is an array of fields that can be calculated
        that._calculatedFields = [];
        // set of fields that have aggregates
        that._aggregatedFields = {};
        // array of needed aggregate record names to ensure there is a row to put the aggregate in
        that._aggregateRecs = [];
        processCalcFields( o.fields, that._dependentFields, that._calculatedFields, that._aggregatedFields, that._aggregateRecs );
        that._staleAggFields = [];
        that._debouncedUpdateAggregates = util.debounce( function() { that._updateAggregates(); }, 250 );

        if ( o.identityField ) {
            if ( isArray( o.identityField ) ) {
                that._identityKeys = [];
                for ( let i = 0; i < o.identityField.length; i++ ) {
                    that._identityKeys.push( that.getFieldKey( o.identityField[i] ) );
                    if ( that._identityKeys[i] === undefined ) {
                        throw fieldNotFoundError( "Identity", o.identityField[i] );
                    }
                    checkNoCalculations( o.identityField[i], "identity" );
                }
            } else {
                that._identityKeys = [that.getFieldKey( o.identityField )];
                if ( that._identityKeys[0] === undefined ) {
                    throw fieldNotFoundError( "Identity", o.identityField );
                }
                checkNoCalculations( o.identityField, "identity" );
            }
        }
        if ( o.typeField ) {
            that._typeKey = that.getFieldKey( o.typeField );
            if ( that._typeKey === undefined ) {
                throw fieldNotFoundError( "Type", o.typeField );
            }
            checkNoCalculations( o.typeField, "type" );
        }
        if ( o.childrenField ) {
            that._childrenKey = that.getFieldKey( o.childrenField );
            if ( that._childrenKey === undefined ) {
                throw fieldNotFoundError( "Children", o.childrenField );
            }
            checkNoCalculations( o.childrenField, "children" );
        }
        if ( o.parentIdentityField ) {
            // todo consider supporting multiple keys in the future
            that._parentIdKey = that.getFieldKey( o.parentIdentityField );
            if ( that._parentIdKey === undefined ) {
                throw fieldNotFoundError( "Parent identity", o.parentIdentityField );
            }
            checkNoCalculations( o.parentIdentityField, "parentIdentity" );
        }
        if ( o.sequenceField ) {
            that._sequenceKey = that.getFieldKey( o.sequenceField );
            if ( that._sequenceKey === undefined ) {
                throw fieldNotFoundError( "Sequence", o.sequenceField );
            }
            checkNoCalculations( o.sequenceField, "sequence" );
        }
        if ( o.metaField ) {
            that._metaKey = that.getFieldKey( o.metaField );
            if ( that._metaKey === undefined ) {
                throw fieldNotFoundError( "Meta", o.metaField );
            }
            checkNoCalculations( o.metaField, "meta" );
        }

        if ( o.shape !== SHAPE_RECORD ) {
            if ( o.identityField ) {
                // table and tree shape with identity can get a record by its id
                that.getRecord = that._getRecordById;
            } else if ( o.shape === SHAPE_TABLE ) {
                // table without identity can get a record by its index among all other records same as recordAt
                that.getRecord = that.recordAt;
            } else {
                // tree shape without identity cannot get records except by using root and child methods or walk tree
                that.getRecord = function() {
                    return null;
                };
            }
        } else {
            that.getRecord = function() {
                return that._data;
            };
        }

        that._index = new Map();
        that._selection = new Map();
        that._controlBreaksMap = new Map();
        that._clear();
        if ( pData ) {
            if ( o.paginationType === PT_NONE ) {
                // when no pagination then must have all data
                moreData = false;
            } else {
                // if given more data flag use it, otherwise guess based on pTotal
                if ( pMoreData != null) {
                    moreData = pMoreData;
                } else {
                    // if given data and a total use that to figure out if there is more data
                    // otherwise assume there is more
                    moreData = pTotal != null ? pData.length < pTotal : true;
                }
            }
            // todo need to be able to pass in an offset for pData to model.create. Issue is
            //   correspondence between offset and srvRecOffset that is afected by aggregate records
            that._addData( 0, 0, pData, pTotal, moreData, pDataOverflow );
        } else {
            if ( pTotal != null ) {
                that._totalRecords = pTotal;
            }
            if ( o.shape === SHAPE_RECORD && pMoreData === false ) {
                that._haveAllData = true;
            }
        }

        // if there is no data given and there is a parent model and the parent record is inserted then there
        // can't possibly be any data for this model so create an empty model
        if ( o.parentModel && o.parentRecordId && !pData ) {
            masterModel = model.get( o.parentModel );
            if ( masterModel ) {
                masterRecordMeta = masterModel.getRecordMetadata( o.parentRecordId );
                if ( masterRecordMeta.inserted ) {
                    that._masterRecordIsInserted = true; // will be cleared after the master record has been saved
                    that._clear(); // data is already empty but this will make sure _haveAllData is true
                }
                if ( masterRecordMeta.deleted ) {
                    that._saveDataState();
                    that._masterRecordIsDeleted = true;
                    // force clear. it will be OK because changes were saved in _saveDataState
                    that._clear();
                    that._addData( 0, 0, [], 0, false, false );
                }

                pfMap = that._parentFieldsMap = {};
                for ( let i in o.fields ) {
                    if ( hasOwnProperty( o.fields, i ) ) {
                        field = o.fields[i];
                        if ( field.parentField ) {
                            if ( !pfMap[field.parentField] ) {
                                pfMap[field.parentField] = [];
                            }
                            pfMap[field.parentField].push( i );
                        }
                    }
                }

                // Add a listener on the parent model
                that.parentModelViewId = masterModel.subscribe( {
                    onChange: function( type, change ) {
                        let ids;

                        if ( type === N_DELETE || type === N_REVERT || type === N_REFRESH_RECORDS || type === N_CLEAR_CHANGES ) {
                            ids = change.recordIds || change.deletedIds;
                            for ( let i = 0; i < ids.length; i++ ) {

                                if ( ids[i] === o.parentRecordId ) {
                                    // if master record is deleted then all the records in this model are deleted but allow them to be restored including changes
                                    if ( type === N_DELETE ) {
                                        that._saveDataState();
                                        that._masterRecordIsDeleted = true;
                                        // force clear. it will be OK because changes were saved in _saveDataState
                                        that._clear();
                                        that._addData( 0, 0, [], 0, false, false );
                                        notifyChange( that, N_REFRESH, {} );
                                    } else if ( ( type === N_REVERT || type === N_REFRESH_RECORDS ) && that._masterRecordIsDeleted ) {
                                        delete that._masterRecordIsDeleted;
                                        that._restoreDataState();
                                        notifyChange( that, N_REFRESH, {} );
                                    } else if ( type === N_REFRESH_RECORDS && change.newIds && change.newIds[that.instance] ) {
                                        const newParentRecordId = change.newIds[that.instance];
                                        let toDelete = [];

                                        // The parent record id changed so need to rename this instance
                                        o.parentRecordId = newParentRecordId;
                                        model.renameInstance( that.modelId(), newParentRecordId );
                                        // The parent record may have been newly inserted and saved which means that
                                        // any detail records where also inserted but if there were any that were
                                        // auto inserted but not updated (not saved) they need to be removed because
                                        // they have stale data from old parent record.
                                        that.forEach( ( rec, index, id ) => {
                                            let iNode = that.getRecordMetadata( id );

                                            if ( iNode.autoInserted && !iNode.updated ) {
                                                // remove records that were auto inserted and never updated.
                                                toDelete.push( iNode.record );
                                            }
                                        } );
                                        if ( toDelete.length ) {
                                            that.deleteRecords( toDelete );
                                        }
                                    } else if ( type === N_CLEAR_CHANGES && that._masterRecordIsDeleted ) {
                                        // in this case the model will never be used again someone should clean the model out
                                        // but at least get rid of the saved state
                                        delete that._saveState;
                                    }
                                    break;
                                }
                            }
                            if ( type === N_CLEAR_CHANGES && that._masterRecordIsInserted ) {
                                delete that._masterRecordIsInserted;
                            }
                        } else if ( type === N_SET && ( change.oldIdentity || change.recordId ) === o.parentRecordId ) {
                            // if any master record copied fields are modified then must re-copy the values if not edited (matches old value of parent change)
                            pField = change.field;
                            if ( pField in pfMap ) {
                                myFields = pfMap[pField];
                                value = masterModel.getValue( change.record, pField );
                                that.forEach(function( rec ) {
                                    let f;

                                    // don't process aggregates here
                                    if ( that._metaKey && rec[that._metaKey].agg ) {
                                        return;
                                    }
                                    for ( let i = 0; i < myFields.length; i++ ) {
                                        f = myFields[i];
                                        if ( change.oldValue === that.getValue( rec, f ) ) {
                                            // The field can be readonly but cell must otherwise be writeable
                                            that.setValue( rec, f, value );
                                        }
                                    }
                                } );
                            }
                            if ( change.oldIdentity ) {
                                o.parentRecordId = change.recordId;
                                model.renameInstance( that.modelId(), change.recordId );
                            }
                        } else if ( type === N_REFRESH && that._masterRecordIsDeleted ) {
                            delete that._masterRecordIsDeleted;
                            that._restoreDataState();
                            notifyChange( that, N_REFRESH, {} );
                        } else if ( type === N_DESTROY ) {
                            // Currently the parent model o.parentModel cannot be set/changed once a model is created
                            // so the parent model should not be deleted. But if it is, do some cleanup.
                            o.parentModel = null;
                            that.parentModelViewId = null; // the subscription to the parent model is no good anymore
                            delete that._masterRecordIsDeleted;
                            delete that._masterRecordIsInserted;
                        }
                    },
                    // Just for debugging to make it easier to identify the observers from _getStats
                    progressView: "m:" + pModelId
                } );

                model.release( o.parentModel );
            }
        }

        // check to see if there are too many unused, unchanged models lying around
        if ( gModelsLRU.length >= gMaxCachedModels ) {
            m = getModelLRU();
            if ( m ) {
                debug.info( "Model: cache overflow; remove model from cache: " + m.modelId() );
                model.destroy( makeModelId( m.modelId() ) ); // Be specific; never remove all instances (bug 28298408)
            }
        }

        // add that model
        m = gModels[mId[0]];
        if ( !m ) {
            m = {
                instances: {},
                instancesRef: {}
            };
            gModels[mId[0]] = m;
        }
        if ( mId[1] ) {
            // there is an instance
            if ( m.instances[mId[1]] ) {
                // if overwriting existing model destroy the old one
                model.destroy( mId );
                // just in case there were no other instances, which would have removed the main model
                gModels[mId[0]] = m;
            }
            m.instancesRef[mId[1]] = 1;
            m.instances[mId[1]] = that;
        } else {
            // no instance just save it under the name
            if ( m.model ) {
                // if overwriting existing model destroy the old one
                model.destroy( mId );
                // destroy deletes the key so need to put it back
                gModels[mId[0]] = m;
            }
            m.modelRef = 1;
            m.model = that;
        }
        debug.info( "Model: created model: " + pModelId + " refCount: 1" );
        return that;
    };

    function lookup( modelId ) {
        const mId = makeModelId( modelId );
        let m = gModels[mId[0]];

        if ( m ) {
            if ( mId[1] ) {
                m = m.instances[mId[1]];
            } else {
                m = m.model;
            }
        }
        return m;
    }

    function list( type, includeRelated, pIncludeLocal, modelId ) {
        let mId = modelId ? makeModelId( modelId ) : null,
            result = [];

        function isRelated( model ) {
            let pm,
                m = model,
                curId = makeModelId( m.modelId() );

            while ( curId ) {
                if ( curId[0] === mId[0] && ( curId[1] === mId[1] || mId[1] === null ) ) {
                    return true;
                }
                curId = null;
                pm = m.getOption( "parentModel" );
                if ( pm ) {
                    m = lookup( pm );
                    if ( m ) {
                        curId = makeModelId( pm );
                    }
                }
            }
            return false;
        }

        function matches( model ) {
            let match = !!( pIncludeLocal || model._options.regionId );

            if ( match ) {
                if ( type === "change" ) {
                    match = model.isChanged();
                } else if ( type === "error" ) {
                    match = model.hasErrors();
                }
                if ( match && includeRelated ) {
                    match = isRelated( model );
                }
            }
            return match;
        }

        function add( name, model ) {
            result.push( {
                id: name,
                model: model
            } );
        }

        function addInstances( m, name ) {
            if ( m.model ) {
                if ( matches( m.model ) ) {
                    add( name, m.model );
                }
            }
            for ( let instName in m.instances ) {
                if ( hasOwnProperty( m.instances, instName ) ) {
                    if ( matches( m.instances[ instName ] ) ) {
                        add( [name, instName], m.instances[ instName ] );
                    }
                }
            }
        }

        if ( !mId ) {
            // if including all then include related makes no sense
            includeRelated = false;
        }

        if ( !includeRelated && mId && mId[0] ) {
            let mName = mId[0],
                m = gModels[mName];

            if ( m ) {
                if ( mId[1] ) {
                    if ( m.instances[mId[1]] && matches( m.instances[mId[1]] ) ) {
                        add( [mName, mId[1]], m.instances[ mId[1] ] );
                    }
                } else {
                    addInstances( m, mName );
                }
            }
        } else {
            for ( let mName in gModels ) {
                if ( hasOwnProperty( gModels, mName ) ) {
                    let m = gModels[mName];

                    addInstances( m, mName );
                }
            }
        }
        return result;
    }

    /**
     * <p>Returns an array of all the currently defined model identifiers in no particular order.
     * If <code class="prettyprint">pModelId</code> is null or not provided all models are listed.
     * If <code class="prettyprint">pModelId</code> contains just a model name then just that model if any and all
     * instances with the same model name if any are returned.
     * If <code class="prettyprint">pModelId</code> contains a model and an instance then just that model instance is included.
     * Specifying <code class="prettyprint">pModelId</code> is most useful when <code class="prettyprint">pIncludeRelated</code> is true.
     *
     * @function list
     * @memberof apex.model
     * @param {boolean} [pIncludeLocal] If true models that don't have a regionId will be included.
     * @param {model.ModelId} [pModelId] Model identifier as given in call to {@link apex.model.create} or just a model name.
     * @param {boolean} [pIncludeRelated] If true then any dependents of any listed models are included.
     * @return {model.ModelId[]} Array of model identifiers
     */
    model.list = function( pIncludeLocal, pModelId, pIncludeRelated ) {
        const mList = list( null, pIncludeRelated, pIncludeLocal, pModelId );

        return mList.map( i => i.id );
    };

    /**
     * For internal use, unit tests and debugging
     * @ignore
     * @function _resetTempIds
     * @memberof apex.model
     */
    model._resetTempIds = resetTempIds;

    /**
     * For internal use
     * @ignore
     * @function _getStats
     * @memberof apex.model
     */
    model._getStats = function() {
        let  mInfo, instName,
            stats = [];

        for ( let mName in gModels ) {
            if ( hasOwnProperty( gModels, mName ) ) {
                const m = gModels[mName],
                    model = m.model;

                if ( model ) {
                    mInfo = {
                        name: model.name,
                        instance: null,
                        refCount: m.modelRef,
                        cachePos: gModelsLRU.indexOf( model ),
                        subscribers: model._listeners.length,
                        progressViews: model._listeners.map( function ( x ) {
                            return x.progressView || null;
                        } )
                    };
                    stats.push( mInfo );
                }
                for ( instName in m.instances ) {
                    if ( hasOwnProperty( m.instances, instName ) ) {
                        const model = m.instances[instName];

                        mInfo = {
                            name: model.name,
                            instance: model.instance,
                            refCount: m.instancesRef[instName],
                            cachePos: gModelsLRU.indexOf( model ),
                            subscribers: model._listeners.length,
                            progressViews: model._listeners.map( function(x) {
                                return x.progressView || null;
                            } )
                        };
                        stats.push( mInfo );
                    }
                }
            }
        }
        return stats;
    };

    /**
     * Returns true if any of the specified models have changes.
     *
     * @function anyChanges
     * @memberof apex.model
     * @param {boolean} [pIncludeLocal] If true models that don't have a <code class="prettyprint">regionId</code>
     *   will be included in the check for changes.
     * @param {model.ModelId} [pModelId] Model identifier as given in call to {@link apex.model.create} or just a model name.
     *  See {@link apex.model.list} for how this parameter is used to select which models to operate on.
     * @param {boolean} [pIncludeRelated] If true then any dependents of any selected models are included in check
     * @return {boolean} true if any of the specified models have changed.
     * @example <caption>This example displays an alert message if any (non-local) models on the page have unsaved changes.</caption>
     * if ( apex.model.anyChanges() ) {
     *     apex.message.alert("Save Changes");
     * }
     */
    model.anyChanges = function( pIncludeLocal, pModelId, pIncludeRelated ) {
        const mList = list( "change", pIncludeRelated, pIncludeLocal, pModelId );

        return mList.length > 0;
    };

    /**
     * Returns true if any of the specified models have errors.
     *
     * @function anyErrors
     * @memberof apex.model
     * @param {boolean} [pIncludeLocal] If true models that don't have a <code class="prettyprint">regionId</code>
     *   will be included in check for errors.
     * @param {model.ModelId} [pModelId] Model identifier as given in call to {@link apex.model.create} or just a model name.
     *  See {@link apex.model.list} for how this parameter is used to select which models to operate on.
     * @param {boolean} [pIncludeRelated] If true then any dependents of any selected models are included in check.
     * @return {boolean} true if any of the specified models have errors.
     * @example <caption>This example displays an alert message if any (non-local) models on the page have errors.</caption>
     * if ( apex.model.anyErrors() ) {
     *     apex.message.alert("Fix Errors");
     * }
     */
    model.anyErrors = function( pIncludeLocal, pModelId, pIncludeRelated ) {
        const mList = list( "error", pIncludeRelated, pIncludeLocal, pModelId );

        return mList.length > 0;
    };

    /**
     * <p>Low level function to add changes for any of the specified models to a request.
     * Changes are added to the provided request data. This doesn't actually send the request to the server.
     * In most cases {@link apex.model.save} should be used rather than this function.</p>
     *
     * @function addChangesToSaveRequest
     * @memberof apex.model
     * @param {object} pRequestData An initial request object that will have all changes for the specified models added to it.
     * @param {model.ModelId} [pModelId] Model identifier as given in call to {@link apex.model.create} or just a model name.
     *  See {@link apex.model.list} for how this parameter is used to select which models to operate on.
     * @param {boolean} [pIncludeRelated] If true then any dependents of any selected models are included if they have changes.
     * @return {function} A function that must be called with the promise returned from the save request.
     */
    model.addChangesToSaveRequest = function( pRequestData, pModelId, pIncludeRelated ) {
        let callbacks = [],
            mList = list( "change", pIncludeRelated, false, pModelId );

        if ( mList.length <= 0 ) {
            return null;
        }
        for ( let i = 0; i < mList.length; i++ ) {
            let cb = mList[i].model.addChangesToSaveRequest( pRequestData );

            if ( cb ) {
                callbacks.push( cb );
            }
        }
        return function( promise ) {
            for ( let i = 0; i < callbacks.length; i++ ) {
                callbacks[i]( promise );
            }
        };
    };

    /**
     * <p>Save any of the specified models that have changes. This consolidates all the model data to save into a single
     * request.</p>
     *
     * @function save
     * @memberof apex.model
     * @param {object} [pRequestData] An initial request object that will have all changes for the specified models added to it.
     * @param {object} [pOptions] Options to pass on to {@link apex.server.plugin} API.
     * @param {model.ModelId} [pModelId] Model identifier as given in call to {@link apex.model.create} or just a model name.
     * @param {boolean} [pIncludeRelated] If true then any dependents of any selected models are included in check.
     * @param {function} [pCallServer] An optional function to call in place of {@link apex.server.plugin}. See
     *    the callServer option of {@link apex.model.create} for more information.
     * @return {null|promise} The promise from {@link apex.server.plugin} if a save request is sent or null if there are no
     * changed models to save.
     * @example <caption>This example saves all the models on the page that have changes.</caption>
     * apex.model.save();
     */
    model.save = function( pRequestData, pOptions, pModelId, pIncludeRelated, pCallServer ) {
        let updateModelsCallback, p, mList, models;

        pRequestData = pRequestData || {};
        pOptions = pOptions || {};
        mList = list( "change", pIncludeRelated, false, pModelId ); // do this before addChangesToSaveRequest because it clears the change state
        updateModelsCallback = apex.model.addChangesToSaveRequest( pRequestData, pModelId, pIncludeRelated );

        if ( updateModelsCallback ) {
            // If saving for a primary model and no loading indicator options then try to make one from the models to be saved
            if ( pModelId && pOptions.loadingIndicator === undefined && pOptions.loadingIndicatorPosition === undefined ) {
                models = [];
                // there must be at least one model because updateModelsCallback is truthy
                for ( let i = 1; i < mList.length; i++ ) {
                    models.push( mList[i].model );
                }
                pOptions.loadingIndicator = makeLoadingIndicatorFunction( mList[0].model, models );
            }
            p = (pCallServer || server.plugin)( pRequestData, pOptions );
            updateModelsCallback( p );
            return p;
        } // else
        return null;
    };

    /**
     * <p>Fetches data for multiple models in a single Ajax request. In most cases there is no need to process
     * the data of the promise because the models have already done so.</p>
     *
     * @function multipleFetch
     * @memberof apex.model
     * @param {object} [pRequestData] An initial request object that will have fetch requests for the specified models added to it.
     * @param {object} [pOptions] Options to pass on to {@link apex.server.plugin} API.
     * @param {array} pModelIds An array of model ids to fetch data for.
     * @param {function} [pCallServer] An optional function to call in place of {@link apex.server.plugin}. See
     *    the callServer option of {@link apex.model.create} for more information.
     * @returns {null|promise} Returns the promise from {@link apex.server.plugin}, if there is at least one model to
     *   fetch data for. The promise is resolved with the ajax response data. Returns null if there are no valid model
     *   ids given or if all models are already busy fetching data.
     * @example <caption>The following example will refresh two interactive grid regions, r1 and r2,
     * with a single ajax request.</caption>
     * // an array of the IG region views
     * let igViews = [
     *     apex.region( "r1" ).call( "getCurrentView" ),
     *     apex.region( "r2" ).call( "getCurrentView" )
     * ];
     * // an array of the IG region view model ids to fetch
     * let modelIds = igViews.map( v => v.model.modelId() );
     *
     * // for each of the views, clear the data without notifying the view
     * igViews.forEach( v => { v.model.clearData( false ) } );
     *
     * apex.model.multipleFetch( null, {
     *     loadingIndicatorPosition: "page"
     * }, modelIds ).done( () => {
     *     // this assumes the IG regions only have grid views
     *     igViews.forEach( v => { v.view$.grid( "refresh" ) } );
     * } );
     * // Compare with: apex.region( "r1" ).refresh(); apex.region( "r2" ).refresh();
     * // which results in 2 ajax requests. Simpler code but more network traffic.
     */
    model.multipleFetch = function( pRequestData, pOptions, pModelIds, pCallServer ) {
        let p,
            callbacks = [];

        pRequestData = pRequestData || {};
        pOptions = pOptions || {};
        pModelIds.forEach( modelId => {
            let cb,
                mList = list( null, false, false, modelId );

            // expect only one model to be found
            if ( mList.length > 0 ) {
                cb = mList[0].model._addToFetchRequest( pRequestData, 0 );
                if ( cb ) {
                    callbacks.push( cb );
                }
            }
        } );

        if ( callbacks.length > 0 ) {
            // caller should set loading indicator in pOptions if desired; it doesn't default to using models
            p = (pCallServer || server.plugin)( pRequestData, pOptions );
            for ( let i = 0; i < callbacks.length; i++ ) {
                callbacks[i]( p );
            }
            return p;
        } // else
        return null;
    };

    // todo consider document
    model.equalModelIds = function( mid1, mid2 ) {
        if ( typeof mid1 === "string" && typeof mid2 === "string" ) {
            return mid1 === mid2;
        } else if ( isArray( mid1 ) && isArray( mid2 ) && mid1.length === 2 && mid2.length === 2 ) {
            return util.arrayEqual( mid1, mid2 );
        } // else
        return false;
    };

    /**
     * Get a model by its model identifier.
     *
     * @function get
     * @memberof apex.model
     * @param {model.ModelId} pModelId Model identifier as given in call to {@link apex.model.create}.
     * @return {model} The model identified by pModelId.
     * @example <caption>Get access to a model with model id MyModel and release it when done.</caption>
     * var myModel = apex.model.get("MyModel");
     * // ... do something with myModel
     * apex.model.release("MyModel");  // release it when done
     */
    model.get = function( pModelId ) {
        const mId = makeModelId( pModelId ),
            m = gModels[mId[0]];
        let model, refCount;

        if ( m ) {
            if ( mId[1] ) {
                model = m.instances[mId[1]];
                if ( model ) {
                    refCount = m.instancesRef[mId[1]] += 1;
                }
            } else {
                model = m.model;
                if ( model ) {
                    refCount = m.modelRef += 1;
                }
            }
            if ( model ) {
                removeFromModelLRU( model );
                debug.info( "Model: get model: " + pModelId + " refCount: " + refCount );
            }
        }
        return model;
    };

    function removeFromModelLRU( model ) {
        let i = gModelsLRU.indexOf( model );

        if ( i >= 0 ) {
            gModelsLRU.splice( i, 1 );
        }
    }

    function addToModelLRU( model ) {
        let i = gModelsLRU.indexOf( model );

        if ( i >= 0 ) {
            gModelsLRU.splice( i, 1 );
        }
        gModelsLRU.push( model );
    }

    function getModelLRU() {
        for ( let i = 0; i < gModelsLRU.length; i++ ) {
            let model = gModelsLRU[i];

            if ( !model.isChanged() ) {
                return model;
            }
        }
        return null;
    }

    /**
     * <p>Rename the instance portion of the model identified by pOldModelId.
     * This only applies to detail models. Detail model ids have an instance that
     * matches the id of a record in the parent model. When the record id
     * in the parent model changes the detail model needs to have its instance
     * updated to reflect the change to the master record. This method is called automatically.</p>
     *
     * @ignore
     * @function renameInstance
     * @memberof apex.model
     * @param {model.ModelId} pOldModelId Model identifier as given in call to {@link apex.model.create}
     *   of the model to rename.
     * @param {string} pNewInstance The new instance to use for this model id.
     */
    model.renameInstance = function( pOldModelId, pNewInstance ) {
        const mId = makeModelId( pOldModelId ),
            name = mId[0],
            instance = mId[1],
            m = gModels[name];

        if ( m ) {
            if ( instance ) {
                let refCount,
                    curModel = m.instances[instance];

                if ( m.instances[pNewInstance] ) {
                    debug.error( "Model: Error rename model to one that already exists.", pNewInstance );
                }
                curModel.instance = pNewInstance;
                refCount = m.instancesRef[instance];
                delete m.instances[instance];
                delete m.instancesRef[instance];
                m.instances[pNewInstance] = curModel;
                m.instancesRef[pNewInstance] = refCount;
                debug.info( "Model: rename model " + name + " instance: " + instance + " to " + pNewInstance );
                notifyChange( curModel, "instanceRename", {
                    oldInstance: instance,
                    newInstance: pNewInstance
                } );
            }
        }
    };

    /**
     * <p>Release a model if it is not being used but may be used again in the future. This allows the model
     * to be destroyed if needed to conserve memory.</p>
     * <p>Models are reference counted. For every call to {@link apex.model.get} or {@link apex.model.create}
     * a call to {@link apex.model.release} with the same model id is required.
     * When the reference count is zero the model is destroyed unless it is changed or if it has a
     * parent model, in which case it is cached.</p>
     *
     * @function release
     * @memberof apex.model
     * @param {model.ModelId} pModelId Model identifier as given in call to {@link apex.model.create}.
     * @example <caption>Get access to a model with model id MyModel and release it when done.</caption>
     * var myModel = apex.model.get("MyModel");
     * // ... do something with myModel
     * apex.model.release("MyModel");  // release it when done
     */
    model.release = function( pModelId ) {
        const mId = makeModelId( pModelId );
        let refCount,
            m = gModels[mId[0]];

        if ( m ) {
            if ( mId[1] ) {
                if ( m.instancesRef[mId[1]] ) {
                    refCount = m.instancesRef[mId[1]] -= 1;
                    m = m.instances[mId[1]];
                } else {
                    m = null;
                }
            } else {
                refCount = m.modelRef -= 1;
                m = m.model;
            }
            if ( m ) {
                debug.info( "Model: release model: " + pModelId + " refCount: " + refCount );
                // if refcount is 0 and the model has no changes and (it is not an instance or the parent model
                // doesn't exist) then destroy it now
                if ( refCount <= 0 ) {
                    if ( m._options.parentModel && lookup( m._options.parentModel ) ) {
                        // it is an instance which could be used again or could be destroyed later if there are too many
                        debug.info( "Model: save in cache model: " + pModelId );
                        addToModelLRU( m );
                    } else if ( !m.isChanged() ) {
                        model.destroy( mId ); // be specific so instances are not destroyed; don't use pModelId
                    }
                    // otherwise it has changes and can't be destroyed
                }
            }
        }
    };

    /**
     * <p>Destroy and remove a model by its identifier. This bypasses reference counting and caching. This method should
     * not be used unless you are sure that no one else is using the model.</p>
     * <p>If <code class="prettyprint">pModelId</code> is a string model name and there are one or more instances
     * they will all be destroyed.</p>
     *
     * @function destroy
     * @memberof apex.model
     * @param {model.ModelId} pModelId Model identifier as given in call to {@link apex.model.create} or just a model name.
     * @example <caption>Destroy the model with model id MyModel.</caption>
     * apex.model.destroy("MyModel");
     */
    model.destroy = function( pModelId ) {
        const mId = makeModelId( pModelId );
        let instName,
            m = gModels[mId[0]];

        function remove( m ) {
            if ( m ) {
                removeFromModelLRU( m );
                if ( m.parentModelViewId ) {
                    let pm = m._options.parentModel,
                        masterModel = model.get( pm );

                    if ( masterModel ) {
                        masterModel.unSubscribe( m.parentModelViewId );
                        m.parentModelViewId = null;
                        model.release( pm );
                    }
                }
                if ( m._externalItems$ ) {
                    m._externalItems$.off( 'change', m._externalItemsHandler );
                }
                // Let any observers know that this model is destroyed
                notifyChange( m, N_DESTROY, {} );
                m._data = null;
                m._index = null;
                m._selection = null;
                m._controlBreaksMap = null;
                // it is possible that models could be released/destroyed while a request is inflight
                // set this flag so when the requests complete they can be ignored
                m._destroyed = true;
                debug.info( "Model: destroy model: " + pModelId );
            }
        }

        if ( m ) {
            if ( mId[1] ) {
                remove( m.instances[mId[1]] );
                delete m.instancesRef[mId[1]];
                delete m.instances[mId[1]];
            } else {
                remove( m.model );
                delete m.model;
                delete m.modelRef;
                if ( typeof pModelId === "string" && !mId[1] ) {
                    // delete all the instances
                    for ( instName in m.instances ) {
                        if ( hasOwnProperty( m.instances, instName ) ) {
                            remove( m.instances[instName] );
                            delete m.instancesRef[instName];
                            delete m.instances[instName];
                        }
                    }
                }
            }
            if ( Object.keys(m.instances).length === 0 && !m.model ) {
                delete gModels[mId[0]];
            }
        }
    };

    /**
     * Get the max number of cached detail instance models.
     *
     * @function getMaxCachedModels
     * @memberof apex.model
     * @return {number} Max cached detail instance models.
     */
    model.getMaxCachedModels = function() {
        return gMaxCachedModels;
    };

    /**
     * Set the max number of cached unreferenced, unchanged detail instance models that will be kept.
     *
     * @function setMaxCachedModels
     * @memberof apex.model
     * @param {number} n Number of unreferenced, unchanged detail instance models that will be kept.
     */
    model.setMaxCachedModels = function( n ) {
        gMaxCachedModels = parseInt( n, 10 ) || DEFAULT_MAX_MODELS;
    };

    /**
     * internal use for now
     * A helper function to process initial data suitable for calls to apex.model.create
     * @ignore
     * @function initialModelData
     * @memberof apex.model
     * @param {string|object} [initialData] optional initial data. If it is a string it is the id of a
     *   application/json type script element that contains an object as described below. If it is
     *   an object then it should have the following properties:
     * @param {array} initialData.values an array of records
     * @param {boolean} initialData.moreData true if the server has more records and false otherwise
     * @param {number} [initialData.totalRows] optional total number of rows in the result set
     * @returns {object}
     */
    model.initialModelData = function( initialData ) {
        let valid = true;

        if ( typeof initialData === "string" ) {
            try {
                initialData = JSON.parse( $( "#" + initialData ).text() );
            } catch ( ex ) {
                debug.error( "Failed to parse initial model data.", ex );
                valid = false;
            }
        }
        if ( initialData != null ) {
            // null or undefined is ok but if not either of those it must be an object
            // todo consider it would be nice to do some validation of the properties in the object
            //  but there is a lot of variability of what is required for different uses
            if ( isArray( initialData ) || typeof initialData !== "object" ) {
                valid = false;
            }
        }
        if ( !valid ) {
            debug.error( "Invalid model data. Proceeding with no data." );
            initialData = {
                values: null
            };
        }
        return initialData;
    };

    //
    // Data binding support for models
    // Unit tests are in tests/binding_test.html
    //
    const gModelCursors = new Map(); // map model name to cursor for that model only for dynamically created cursors

    /*
     * xxx A mix-in for interfaces/classes to implement the model cursor interface
     * members used
     * model
     * modelId (tmv base should switch from modelName to modelId)
     * currentRecord
     * currentRecordId
     * <a-model-cursor id="..." model-id="..." record-id="..."></a-model-cursor>
     * xxx todo
     *      What about item value bindings and the item().reinit thing that tmv base does?
     */
    const WebComponent = apex.WebComponent;
    const componentMetaData = {
        modelId: {
            type: WebComponent.dataTypes.string
            // setterGetter: true, - default
            // reactive: false - default
        },
        recordId: {
            type: WebComponent.dataTypes.string,
            // setterGetter: true, - default
            // reactive: false - default
            default: ""
        },
        explicitStore: {
            type: WebComponent.dataTypes.boolean,
            // setterGetter: true, - default
            // reactive: false - default
            default: false
        },
        syncWith: {
            type: WebComponent.dataTypes.string, // region id
            default: ""
        }
        // xxx option to sync current record to some other view?
    };
    WebComponent._addHyphenCaseAttrNames( componentMetaData );
    const observedAttributes = WebComponent._configObservedAttributes( componentMetaData );

    // todo someday it should extend apex.RegionComponent
    const ModelCursor = class extends WebComponent {
        // private properties
        #model = null;
        #record = null;
        #recordIndex = -1;
        #recordShape = false;
        #treeShape = false;
        #subscribers = [];
        #modelViewId = null;
        #validModelId = null; // {ModelId} could be a string or array
        #region = null;
        #recordSetFromView = false;
        #actions = null;
        #v = {
            modelId: null,
            recordId: null,
            explicitStore: null,
            syncWith: null
        };

        constructor() {
            super();
            this._configPrivateState( this.#v );

            /*todo consider adding actions such as next-record etc. They are easy to bind to buttons.
            <a-model-cursor id="c1" model-id="m1">
            <button data-action="[c1]next">
            <div id="m" modelid="myempmodel">
               <a-number-field ab-item-value="=SAL">...</a-number-field>
            </a-model-cursor>

             */
            let self = this;

            this.#actions = apex.actions.createContext( "modelCursor", this );
            this.#actions.add( [{
                name: "cursor-next",
                action: function() {
                    self.nextRecord();
                }
            }, {
                name: "cursor-previous",
                action: function() {
                    self.previousRecord();
                }
            }] );
        }

        getModel() {
            return this.#model;
        }

        getCurrentRecord() {
            return this.#record;
        }

        firstRecord() {
            let rec,
                recIndex = 0;

            if ( this.#recordShape ) {
                rec = this.#model.getRecord();

                if ( rec ) {
                    this.recordId = this.#model.getRecordId( rec );
                    return true;
                }
            } else if ( this.#treeShape ) {
                // todo support tree shape
            } else { // table
                rec = this.#model.recordAt( recIndex );
                if ( rec ) {
                    this.recordId = this.#model.getRecordId( rec );
                    this.#recordIndex = recIndex; // set after recordId
                    return true;
                }
            }
            return false;
        }

        // todo make async and support fetching more data as needed?
        nextRecord() {
            if ( this.#recordShape ) {
                return false; // not supported
            }
            let rec,
                recIndex = this.#recordIndex;

            if ( this.#treeShape ) {
                // todo support tree shape
            } else { // table
                if ( recIndex < 0 && this.#record ) {
                    this.#recordIndex = recIndex = this.#model.indexOf( this.#record );
                }
                if ( recIndex >= 0 ) {
                    // todo option to skip aggregates?
                    recIndex += 1;
                    rec = this.#model.recordAt( recIndex );
                    if ( rec ) {
                        this.recordId = this.#model.getRecordId( rec );
                        this.#recordIndex = recIndex; // set after recordId
                        return true;
                    }
                }
                // else already at end
            }
            return false;
        }

        // todo factor out common code for next/prev
        previousRecord() {
            if ( this.#recordShape ) {
                return false; // not supported
            }
            let rec,
                recIndex = this.#recordIndex;

            if ( this.#treeShape ) {
                // todo support tree shape
            } else { // table
                if ( recIndex < 0 && this.#record ) {
                    this.#recordIndex = recIndex = this.#model.indexOf( this.#record );
                }
                if ( recIndex >= 0 ) {
                    // todo option to skip aggregates?
                    recIndex -= 1;
                    if ( recIndex < 0 ) {
                        return false; // was already at start
                    }
                    rec = this.#model.recordAt( recIndex );
                    if ( rec ) {
                        this.recordId = this.#model.getRecordId( rec );
                        this.#recordIndex = recIndex; // set after recordId
                        return true;
                    }
                }
            }
            return false;
        }

        lastRecord() {
            let rec,
                recIndex = 0;

            if ( this.#recordShape ) {
                rec = this.#model.getRecord();

                if ( rec ) {
                    this.recordId = this.#model.getRecordId( rec );
                    return true;
                }
            } else if ( this.#treeShape ) {
                // todo support tree shape
            } else { // table
                let total = this.#model.getTotalRecords( true );

                if ( total > 0 ) {
                    recIndex = total -1;
                }
                rec = this.#model.recordAt( recIndex );
                if ( rec ) {
                    this.recordId = this.#model.getRecordId( rec );
                    this.#recordIndex = recIndex; // set after recordId
                    return true;
                }
            }
            return false;
        }

        /* xxx not sure this will be needed
        // insert a new record after the current record xxx how to do at start
        // and make the new record the current record
        insertRecord( pParentRecord = null, pAfterCurrent = true ) {
            let afterRecord = pAfterCurrent ? this.#record : null;

            this.recordId = this.#model.insertNewRecord( pParentRecord, afterRecord );
        }
         */

        store() {
            $( this ).trigger( "apexbindstore" );
        }

        subscribe( recordId, field, callback ) {
            this.#subscribers.push( {
                field: field,
                recordId: recordId,
                notify: callback
            } );
        }

        unsubscribe( recordId, field, callback ) {
            let index = this.#subscribers.findIndex( x => x.notify === callback &&
                x.recordId === recordId && x.field === field );

            if ( index >= 0 ) {
                this.#subscribers.splice( index, 1 );
            }
            // return to caller if there are no more subscribers for potential proper cleanup of model cursor
            return this.#subscribers.length === 0;
        }

        attributeChangedCallback( attribute, oldValue, newValue ) {
            super.attributeChangedCallback( attribute, oldValue, newValue );

            if ( attribute === "model-id" ) {
                let newModelId = this.#v.modelId; // already set by base class so should be same as newValue

                if ( newModelId.startsWith( "[" ) && newModelId.endsWith( "]" ) ) {
                    // parse as JSON to get model id with name, instance pair
                    try {
                        newModelId = JSON.parse( newModelId );
                        if ( !( isArray( newModelId ) && newModelId.length === 2 ) ) {
                            newModelId = null;
                        }
                    } catch ( ex ) {
                        newModelId = null;
                    }
                }
                this.#initModel( newModelId );
            } else if ( attribute === "record-id" ) {
                if ( oldValue !== newValue ) {
                    this.#setRecord( this.#v.recordId );
                }
            } else if ( attribute === "sync-with" ) {
                // todo xxx make this generic; currently IG specific. Need an interface that regions can implement
                //  for selection, or better, current record observing
                // xxx should make sure watching the same model or maybe take model-id from the watched region?
                if ( oldValue !== newValue ) {
                    let region = apex.region( newValue ),
                        self = this;

                    if ( this.#region ) {
                        this.#region.off( "interactivegridselectionchange.ig" );
                    }

                    if ( region && region.type === "InteractiveGrid" ) {
                        this.#region = region;
                        region.on( "interactivegridselectionchange.ig", util.debounce( ( event, data ) => {
                            const record = data.selectedRecords[0];

                            if ( record ) {
                                self.#recordSetFromView = true;
                                self.recordId = data.model.getRecordId( record );
                            }
                        }, 100 ) );
                    }
                }
            }
        }

        #initModel( modelId ) {
            let modelChanged = true,
                prevModelReleased = false;

            /* xxx
    *addData
    *clearChanges
    delete
    metaChange

    in addition to the data there are things about the model that you may want to bind to
    modelId%total_records
    modelId%no_data
    modelId%no_record
    modelId%is_changed
    modelId%has_errors
    Also record metadata: deleted, inserted, updated, disabled, hidden, ?
    * APEX$REC_DELETED, APEX$REC_INSERTED, APEX$REC_UPDATED ...
    Field metadata: ENAME%changed
             */
            const modelChangeHandler = ( type, change ) => {
                if ( type === N_REFRESH ) {
                    // with setData new data is added before the refresh notification so check if empty
                    if ( this.#model._data.length === 0 ) {
                        // the data has been cleared so remove a cached record
                        this.#record = null;
                    }
                    // expect something else to happen next to get new data.
                    // xxx probably need configuration options here to say what to do. Maybe some other view will
                    // start fetching data. Maybe the data is already set. Maybe this view should start fetching
                    // in any case there should follow an addData notification
                    // If there is another view it may be in control of the current record.

                    //console.log("xxx refresh todo loop and update based on observed values");
                } else if ( type === N_DESTROY ) {
                    // if the model is destroyed then this cursor is no longer valid
                    this.modelId = "";
                } else if ( type === N_ADD_DATA ) {
                    let prevIndex = this.#recordIndex;

                    // when new data is added make sure the current record is in sync with record id.
                    // if there is no such recordId this will set the record to null and in any case notify
                    this.#setRecord( this.#v.recordId );
                    // restore the recordIndex if there was one
                    if ( prevIndex > 0 && this.#record !== null ) {
                        this.#recordIndex = this.#model.indexOf( this.#record );
                    }
                } else if ( type === N_REFRESH_RECORDS || type === N_REVERT ) {
                    for ( let i = 0; i < change.recordIds.length; i++ ) {
                        let recId = change.recordIds[i];

                        // update our stored record if needed
                        if ( recId === this.#v.recordId ) {
                            this.#record = change.records[i];
                        }
                        // todo think without saving values have no way of knowing if a field actually changed
                        this.#notify( recId, null );
                    }
                } else if ( type === "move" ) {
                    // todo think
                    //   probably not a change in less observing the sequence field
                } else if ( type === N_CLEAR_CHANGES ) {
                    // xxx only affects metadata notify any observers of metadata
                    //console.log("xxx clearChanges", change.deleteIds, change.changedIds );
                } else if ( change.recordIds ) {
                    //console.log("xxx type", type, change.recordIds, change.records );
                } else if ( type === "set" || type === "metaChange" ) {
                    //console.log("xxx type", type, change.record, change.field, change);
                    this.#notify( change.recordId, change.field );
                }
                // copy and insert don't apply; the records didn't exist at time cursor was created so nothing
                // could be observing the records.
            };

            if ( this.#model ) {
                // if there was a model unbind our listener
                this.#model.unSubscribe( this.#modelViewId );
                if ( isArray( this.#validModelId ) && isArray( modelId ) ) {
                    modelChanged = !util.arrayEqual( this.#validModelId, modelId );
                } else {
                    modelChanged = this.#validModelId !== modelId;
                }
                if ( modelChanged ) {
                    // and release the model if it is different from what is being set
                    model.release( this.#validModelId );
                    this.#model = null;
                    this.#record = null;
                    prevModelReleased = true;
                }
            }

            let prevRecordId = this.recordId;

            if ( modelId ) {
                if ( modelChanged ) {
                    this.#model = model.get( modelId );
                    if ( !this.#model ) {
                        this.#validModelId = null;
                        debug.error( "Model not found: ", this.#v.modelId );
                    } else {
                        this.#validModelId = modelId;
                    }
                }
                let m = this.#model,
                    shape = m.getOption( "shape" );

                this.#recordShape = shape === SHAPE_RECORD;
                this.#treeShape = shape === SHAPE_TREE;
                this.#modelViewId = m.subscribe( {
                    onChange: modelChangeHandler
                    // todo consider attributes to control showing progress in the region
                    //   progressView: this.element,
                    //   progressOptions: o.progressOptions
                } );
                if ( prevModelReleased && this.#v.recordId ) {
                    let rec = this.#recordShape ? m.getRecord() : m.recordAt( 0 ); // start at first record when model changes

                    if ( rec ) {
                        this.recordId = m.getRecordId( rec );
                        this.#recordIndex = 0; // set after recordId
                    } else {
                        this.recordId = "";
                    }
                } else if ( this.#recordShape ) {
                    let recordId = "";

                    if ( m.getOption( "identityField" ) ) {
                        recordId = m.getRecordId( m.getRecord() );
                    }
                    this.recordId = recordId;
                }
                // xxx for record shape may be no recordId but still want #record set
            } else if ( prevModelReleased && this.#v.recordId ) {
                this.recordId = "";
            }
            if ( this.#v.recordId === prevRecordId ) {
                // The model changed and has set the record id, which will cause a notification,
                // but if the record id happens to be the same as before there is no notification so force
                // calling setRecord so current record is initialized and notification sent
                this.#setRecord ( this.#v.recordId );
            }
        }

        #notify( matchRecordId, matchField ) {
            const subscribers = this.#subscribers,
                recordShape = this.#recordShape;

            for ( let i = 0; i < subscribers.length; i++ ) {
                let sub = subscribers[i],
                    recordId = sub.recordId;

                if ( !recordId && !recordShape ) {
                    recordId = this.#v.recordId;
                }
                if ( ( recordShape || !matchRecordId || recordId === matchRecordId ) &&
                    ( !matchField || sub.field === matchField ) ) {
                    sub.notify();
                }
            }
        }

        #setRecord( recordId ) {
            if ( ( recordId || this.#recordShape ) && this.#model ) {
                this.#record = this.#model.getRecord( recordId );
            } else {
                this.#record = null;
            }
            this.#recordIndex = -1;
            this.#notify( null, null );
            if ( this.#region ) {
                // todo xxx make generic to work with any appropriate region
                if ( !this.#recordSetFromView ) {
                    this.#region.call( "setSelectedRecords", [this.#record], false, false );
                }
                this.#recordSetFromView = false;
            }
        }

        static get observedAttributes() {
            return observedAttributes;
        }
        static get componentMetaData() {
            return componentMetaData;
        }
    };

    // xxx need to run after IG models are initialized but before data binding, see also binding.js
    // xxx temp hack? alt define right away but wait to process modelId, recordId until after models have been created
    apex.gPageContext$.on( "apexreadyend", () => {
        customElements.define( 'a-model-cursor', ModelCursor );
    } );

    /**
     * @typedef {object} apex.binding.ModelDataReference
     * @augments apex.binding.DataReference
     * @desc
     * <p>An APEX model data reference. One of modelId or cursor is required.</p>
     *
     * @property {string} type The data reference type is "model".
     * @property {string} [modelId] The id of the model. A string representation of a {@link model.ModelId}
     *   If the model's modelId is an array then this is the JSON string of that array.
     * @property {ModelCursor} [cursor] A model cursor element xxx or string id or either?
     * @property {string} [recordId] The id of a model record. Not required if it comes from the
     *   cursor or if model is record shape.
     * @property {string} field Name of the record field.
     * @example <caption>The following object is a data reference to the
     * <code class="prettyprint">SALARY</code> column of a record shape model named "employee".</caption>
     * {
     *     type: "model",
     *     modelId: "employee",
     *     field: "SALARY"
     * }
     */
    // todo may need a property
    apex.binding.addDataRefType( "model", {
        priority: 10,
        subscribe: function( ref, callback ) {
            if ( !ref.field || !(
                ( ref.cursor && !ref.modelId ) || ( !ref.cursor && ref.modelId && typeof ref.modelId === "string" ) ) ) {
                debug.error("Invalid model data reference: ", ref );
                return;
            }

            let cursor = ref.cursor;

            if ( !cursor ) {
                // there must be a model id. Use it to get or create a cursor
                const modelId = ref.modelId;

                cursor = gModelCursors.get( modelId );
                if ( !cursor ) {
                    let mc$ = $( `<a-model-cursor model-id="${util.escapeHTMLAttr( modelId)}" style="display:none;"></a-model-cursor>`);

                    mc$.appendTo( "body" );
                    cursor = mc$[0];
                    // xxx check if valid?
                    gModelCursors.set( modelId, cursor );
                }
            }

            cursor.subscribe( ref.recordId || null, ref.field, callback );
        },
        unsubscribe: function( ref, callback ) {
            let modelId = ref.modelId,
                cursor = modelId ? null : ref.cursor;

            if ( !cursor ) {
                cursor = gModelCursors.get( modelId );
            }
            if ( cursor ) {
                let last = cursor.unsubscribe( ref.recordId || null, ref.field, callback );

                if ( last && modelId ) {
                    // cleanup dynamic created cursor when it has no more listeners
                    gModelCursors.delete( modelId );
                    $( cursor ).remove();
                }
            }
        },
        _getCursorFromRef: function( ref ) {
            let cursor = ref.cursor;

            if ( !cursor ) {
                cursor = gModelCursors.get( ref.modelId );
            }
            return cursor || null;
        },
        getValue: function( ref ) {
            const cursor = this._getCursorFromRef( ref ),
                bindModel = cursor?.getModel();

            if ( !bindModel ) {
                // the model has been destroyed or the cursor is invalid
                return ""; // return no value
                // todo think should this be null to distinguish from actual empty value?
                //  note getValue on an invalid item returns "".
            }
            let returnValue = "",
                record;

            if ( ref.recordId ) {
                record = bindModel.getRecord( ref.recordId );
            } else {
                record = cursor.getCurrentRecord();
            }
            if ( record ) {
                returnValue = bindModel.getValue( record, ref.field );
            }
            return returnValue;
        },
        setValue: function( ref, value, displayValue, validity, validityMessage ) {
            // todo xxx displayValue, validity, validityMessage
            const cursor = this._getCursorFromRef( ref ),
                bindModel = cursor?.getModel(),
                field = ref.field;

            if ( !bindModel ) {
                debug.warn( "setValue no model", ref );
                return; // model must exist
            }
            let record, recordId;

            if ( bindModel.getOption( "shape" ) !== "record" ) {
                recordId = ref.recordId || ref.cursor.recordId;
                record = bindModel.getRecord( recordId );
            } else {
                record = bindModel.getRecord();
            }

            if ( record ) {
                let result,
                    prevValue = bindModel.getValue( record, field );

                if ( prevValue !== null && typeof prevValue === "object" && hasOwnProperty( prevValue, "v" ) ) {
                    value = {
                        v: value,
                        d: displayValue
                    };
                }
                result = bindModel.setValue( record, field, value );
                if ( result === "DUP" ) {
                    // xxx this._setColumnItemValue( columnItem, record, property );
                } else {
                    let id = bindModel.getRecordId( record );
                    if ( !validity.valid ) {
                        bindModel.setValidity( "error", id, field, validityMessage );
                    } else {
                        bindModel.setValidity( "valid", id, field );
                    }
//xxx                    if ( id !== prevId ) {
//                        this._identityChanged( prevId, id );
//                    }
                }
            }
        },
        /**
         * @ignore
         * @param name
         * @param element
         * @returns {null}
         */
        parse: function( name, element ) {
            // xxx currently only get the column from name get the rest from data-bind-model-cursor attribute
            // find at any ancestor [data-bind-model], [data-bind-record], .a-GV-row[data-id], [data-bind-cursor], a-model-cursor
            let cursor,
                modelContext$ = $( element ).closest( "[data-bind-model],[data-bind-cursor],a-model-cursor" ), // a model or model cursor
                recordContext$ = $( element ).closest( "[data-bind-record],.a-GV-row[data-id]" ), // optional record id
                recordId = recordContext$.attr( "data-bind-record" ) || recordContext$.attr( "data-id" ),
                ref = null;

            if ( !modelContext$[0] ) {
                return ref; // must have a model or cursor
            } // else
            cursor = modelContext$.attr( "data-bind-cursor" ); // check if it points to a cursor
            if ( cursor ) {
                modelContext$ = $( "#" + cursor );
            }
            if ( modelContext$.is( "a-model-cursor" ) ) {
                cursor = modelContext$[0];
            }

            ref = {
                type: "model",
                field: name
            };
            if ( cursor ) {
                ref.cursor = cursor; // xxx should this be id or element?
            } else {
                ref.modelId = modelContext$.attr( "data-bind-model" );
            }
            if ( recordId ) {
                ref.recordId = recordId;
            }
            return ref;
        }
    } );

})( apex.model, apex.server, apex.debug, apex.util, apex.item, apex.locale, apex.jQuery );
