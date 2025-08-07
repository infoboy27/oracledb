/* @oracle/oraclejet-preact: undefined */
/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
class ScaleLinear {
    constructor(domain, range) {
        this._domain = domain;
        this._range = range;
        this.m = (this._range[1] - this._range[0]) / (this._domain[1] - this._domain[0]);
        this.c = this._range[0] - this.m * this._domain[0];
    }
    transform(value) {
        return this.m * value + this.c;
    }
    invert(value) {
        return (value - this.c) / this.m;
    }
    domain() {
        return this._domain;
    }
    range() {
        return this._range;
    }
}
class ScaleLog {
    constructor(domain, range) {
        this._linearDomain = [Math.log(domain[0]), Math.log(domain[1])];
        this._domain = domain;
        this._range = range;
        this.linearScale = new ScaleLinear(this._linearDomain, this._range);
    }
    transform(value) {
        const v = Math.log(value);
        return this.linearScale.transform(v);
    }
    invert(value) {
        const v = this.linearScale.invert(value);
        return Math.pow(10, v);
    }
    domain() {
        return this._domain;
    }
    range() {
        return this._range;
    }
}

export { ScaleLog as S, ScaleLinear as a };
//# sourceMappingURL=scale-3b7850b9.js.map
