/* @oracle/oraclejet-preact: undefined */
import { c as classNames } from './classNames-4e12b00d.js';
import { m as mergeDeepWithKey } from './mergeDeepWithKey-08531060.js';

const combineClassNames = (key, l, r) => key === 'class' ? classNames([l, r]) : r;
const mergeInterpolations = (interpolations) => (props) => interpolations.reduce((acc, fn) => mergeDeepWithKey(combineClassNames, acc, fn(props)), {});

export { mergeInterpolations as m };
//# sourceMappingURL=mergeInterpolations-e2db2a66.js.map
