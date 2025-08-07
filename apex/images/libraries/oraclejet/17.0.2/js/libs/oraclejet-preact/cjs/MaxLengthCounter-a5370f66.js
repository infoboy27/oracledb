/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
var classNames = require('./classNames-c14c6ef3.js');
var usePress = require('./usePress-00deca01.js');
require('./FormFieldContext-8418dc68.js');
var useFormFieldContext = require('./useFormFieldContext-20f419ef.js');


var hide = 'MaxLengthCounterStyles_hide__7dy9j71';
var maxLengthCounterBase = 'MaxLengthCounterStyles_maxLengthCounterBase__7dy9j70';
var spanStyles = 'MaxLengthCounterStyles_spanStyles__7dy9j72';

const noop = () => { };
function MaxLengthCounter({ maxLength, valueLength = 0, onClick }) {
    const { isFocused } = useFormFieldContext.useFormFieldContext();
    // We don't want mousedown on this component to do anything, so prevent the default behavior.
    const killEvent = hooks.useCallback((event) => event.preventDefault(), []);
    const textClasses = classNames.classNames([!isFocused && hide]);
    const { pressProps } = usePress.usePress(onClick ?? noop);
    return (jsxRuntime.jsx("div", { class: maxLengthCounterBase, onMouseDown: killEvent, ...pressProps, children: jsxRuntime.jsxs("span", { class: textClasses, children: [jsxRuntime.jsx("span", { class: spanStyles, children: valueLength }), jsxRuntime.jsx("span", { class: spanStyles, children: "/" }), jsxRuntime.jsx("span", { class: spanStyles, children: maxLength })] }) }));
}

exports.MaxLengthCounter = MaxLengthCounter;
//# sourceMappingURL=MaxLengthCounter-a5370f66.js.map
