/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains a link tool that should serve as a placeholder for a potential
 * element at the link's source.
 */

import Placeholder from './Placeholder.mjs';

export default class SourcePlaceholder extends Placeholder {

    preinitialize() {
        super.preinitialize(...arguments);

        this.name = 'source-placeholder';
        this.ratio = 0;
        this.translate = -1;
    }
}