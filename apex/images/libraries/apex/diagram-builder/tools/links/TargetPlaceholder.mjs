/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains a link tool that should serve as a placeholder for a potential
 * element at the link's target.
 */

import Placeholder from './Placeholder.mjs';

export default class TargetPlaceholder extends Placeholder {

    preinitialize() {
        super.preinitialize(...arguments);

        this.name = 'target-placeholder';
        this.ratio = 1;
        this.translate = 1;
    }
}