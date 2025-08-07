/*!
 * Copyright (c) 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Extended joint.linkTools.Segments with additional functionality and/or overrides.
 * 
 * Adds handles above links to be able to reposition a link segment. This can lead to creation
 * and/or repositioning of new vertices.
 */

const { linkTools, util } = joint;

export default class Segments extends linkTools.Segments {

    #linkBeforeChangeInitialProps;

    // Override to save the original link props
    onHandleChangeStart(handle, e) {
        const { relatedView: linkView } = this;
        const { model } = linkView;
        this.#linkBeforeChangeInitialProps = {
            vertices: model.vertices(),
            source: util.cloneDeep(model.source()),
            target: util.cloneDeep(model.target())
        };
        super.onHandleChangeStart(handle, e);
    }

    // Override to dispatch a custom event with new & original link props
    onHandleChangeEnd(handle, e) {
        const { relatedView: linkView } = this;
        const { model } = linkView;

        super.onHandleChangeEnd(handle, e);

        const [normalizedEvt, x, y] = linkView.paper.getPointerArgs(e);
        const ori = this.#linkBeforeChangeInitialProps;
        const curr = {
            vertices: model.vertices(),
            source: model.source(),
            target: model.target()
        };
        const changes = [];
        const newValues = {};
        const oldValues = {};

        if ((curr.vertices.length !== ori.vertices.length) || (curr.vertices.length && !util.isEqual(curr.vertices, ori.vertices))) {
            changes.push('vertices');
        }
        // target and/or source may have changed
        if (!util.isEqual(curr.source, ori.source)) {
            changes.push('source');
        }
        if (!util.isEqual(curr.target, ori.target)) {
            changes.push('target');
        }

        changes.forEach(change => {
            newValues[change] = curr[change];
            oldValues[change] = ori[change];
        });
        this.#linkBeforeChangeInitialProps = null;

        linkView.notify('link:segmenthandle:pointerup', this, handle, newValues, oldValues, normalizedEvt, x, y);
    }
}