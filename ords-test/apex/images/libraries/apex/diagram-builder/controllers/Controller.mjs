/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Base for the other controllers.
 */

const { mvc } = joint;

class Controller extends mvc.Listener {

    constructor(context, cfg) {
        super(context);
        this.context = context;
        this.config = cfg;
    }

    startListening() { }

    trigger(evName, ...rest) {
        mvc.Events.trigger.call(this, evName, ...rest);
    }

    on() {
        mvc.Events.on.call(this, ...arguments);
    }

    off() {
        mvc.Events.off.call(this, ...arguments);
    }

    destroy() {
        this.stopListening();
    }
}

export default Controller;