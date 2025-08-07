/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var preact = require('preact');
var hooks = require('preact/hooks');
var classNames = require('./classNames-c14c6ef3.js');
var UNSAFE_RatingGauge_themes_RatingGaugeContract_css = require('./UNSAFE_RatingGauge/themes/RatingGaugeContract.css.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var useUser = require('./useUser-a6d15333.js');
var vanillaExtractDynamic_esm = require('./vanilla-extract-dynamic.esm-d5dffce7.js');
var UNSAFE_RatingGauge_themes_redwood_RatingGaugeTheme = require('./UNSAFE_RatingGauge/themes/redwood/RatingGaugeTheme.js');
var useKeyboardEvents = require('./useKeyboardEvents-f1a1dfef.js');
require('preact/compat');
require('./LayerHost-46e4d858.js');

require('./Floating-1280c2ce.js');

require('./datatipUtils-ed3682ed.js');
var meterUtils = require('./meterUtils-b625ddb8.js');
var useDatatip = require('./useDatatip-ff0c568c.js');
var useTooltipControlled = require('./useTooltipControlled-706a3651.js');
var mergeProps = require('./mergeProps-e3da7237.js');
require('./TabbableModeContext-e99d527e.js');
var useTabbableMode = require('./useTabbableMode-5c8fd9e5.js');
var useTestId = require('./useTestId-8234ec1e.js');

function getValue(pageX, max, step, dimensionsRef, isRtl) {
    const dimensions = dimensionsRef.current;
    if (!dimensions || dimensions.width === 0) {
        return -1;
    }
    const width = pageX - dimensions.x;
    const val = (max * (isRtl ? dimensions.width - width : width)) / dimensions.width;
    const numSteps = val / step;
    return numSteps < 0.5 ? 0 : Math.min(max, Math.ceil(numSteps) * step);
}
function getDimensions(element) {
    if (!element) {
        return {
            width: 0,
            x: 0
        };
    }
    const rect = element.getBoundingClientRect();
    return {
        width: rect.width,
        x: rect.x + window.scrollX
    };
}
/**
 * Returns The color in rating gauge, if the color enum is supported. undefined otherwise.
 * @param color The color in rating gauge.
 * @returns The color in rating gauge, if the color enum is supported. undefined otherwise.
 */
function getColorEnum(color) {
    return color === 'neutral' ||
        color === 'gold' ||
        color === 'danger' ||
        color === 'warning' ||
        color === 'success'
        ? color
        : undefined;
}

const RatingStar = ({ isSelected, isDisabled, isReadOnly, color = 'neutral' }) => {
    const { forcedColors } = useUser.useUser();
    const isHighContrast = forcedColors === 'active';
    const needsHighContrastStyle = isHighContrast && isDisabled;
    const enumColor = getColorEnum(color);
    const customColors = vanillaExtractDynamic_esm.assignInlineVars({
        [UNSAFE_RatingGauge_themes_RatingGaugeContract_css.ratingGaugeVars.colorSelected]: color,
        [UNSAFE_RatingGauge_themes_RatingGaugeContract_css.ratingGaugeVars.borderColorSelected]: color,
        [UNSAFE_RatingGauge_themes_RatingGaugeContract_css.ratingGaugeVars.colorSelectedReadonly]: color
    });
    const { variantClasses, styles: { ratingStarBaseStyle, innerRatingStarColor, outerRatingStarColor, outerDisabledHighContrastBaseStyle, outerDisabledHighContrastSelectedStyle, outerDisabledHighContrastUnselectedStyle } } = useComponentTheme.useComponentTheme(UNSAFE_RatingGauge_themes_redwood_RatingGaugeTheme.RatingGaugeRedwoodTheme, {
        color: enumColor,
        selectionState: isSelected ? 'isSelected' : 'isNotSelected',
        disabledState: isDisabled ? 'isDisabled' : 'isNotDisabled',
        readonlyState: isReadOnly ? 'isReadonly' : 'isNotReadonly',
        highContrastState: isHighContrast ? 'isHighContrast' : 'isNotHighContrast'
    });
    return (jsxRuntime.jsx("svg", { viewBox: "0 0 36 36", height: "100%", width: "100%", style: !enumColor ? customColors : undefined, class: classNames.classNames([ratingStarBaseStyle, enumColor ? variantClasses : '']), children: jsxRuntime.jsxs("g", { children: [jsxRuntime.jsx("path", { class: innerRatingStarColor, d: "m18 1 5.0061 11.9524 12.9939 1.0344-9.9 8.4215 3.0246 12.5917-11.1246-6.7476-11.12461 6.7476 3.02461-12.5917-9.9-8.4215 12.9939-1.0344z" }), jsxRuntime.jsx("path", { class: classNames.classNames([
                        outerRatingStarColor,
                        needsHighContrastStyle ? outerDisabledHighContrastBaseStyle : '',
                        needsHighContrastStyle
                            ? isSelected
                                ? outerDisabledHighContrastSelectedStyle
                                : outerDisabledHighContrastUnselectedStyle
                            : ''
                    ]), d: "m23.0061 12.9524-5.0061-11.9524-5.0061 11.9524-12.9939 1.0344 9.9 8.4215-3.02461 12.5917 11.12461-6.7476 11.1246 6.7476-3.0246-12.5917 9.9-8.4215zm10.5043 1.8394-8.5262 7.2528 2.6077 10.8562-9.5919-5.818-9.59192 5.818 2.60772-10.8562-8.52615-7.2528 11.19115-.891 4.3192-10.31227 4.3192 10.31227z" })] }) }));
};

const RatingGaugeItem = ({ fillRatio, isDisabled, isReadonly, color }) => {
    const { direction } = useUser.useUser();
    const isRtl = direction === 'rtl';
    const { styles: { fractionalStarBaseStyle } } = useComponentTheme.useComponentTheme(UNSAFE_RatingGauge_themes_redwood_RatingGaugeTheme.RatingGaugeRedwoodTheme);
    if (fillRatio === 1 || fillRatio === 0) {
        return (jsxRuntime.jsx(RatingStar, { isSelected: fillRatio === 1, isDisabled: isDisabled, isReadOnly: isReadonly, color: color }));
    }
    // if fillRatio is not 1 or zero, absolutely position selected star above the
    // unselected star and clip both to form partially selected star.
    return (jsxRuntime.jsxs(preact.Fragment, { children: [jsxRuntime.jsx("div", { class: fractionalStarBaseStyle, style: {
                    clipPath: `inset(0% ${isRtl ? (1 - fillRatio) * 100 : 0}% 0% ${isRtl ? 0 : fillRatio * 100}%)`
                }, children: jsxRuntime.jsx(RatingStar, { isSelected: false, isDisabled: isDisabled, isReadOnly: isReadonly, color: color }) }), jsxRuntime.jsx("div", { class: fractionalStarBaseStyle, style: {
                    clipPath: `inset(0% ${isRtl ? 0 : (1 - fillRatio) * 100}% 0% ${isRtl ? (1 - fillRatio) * 100 : 0}%)`
                }, children: jsxRuntime.jsx(RatingStar, { isSelected: true, isDisabled: isDisabled, isReadOnly: isReadonly, color: color }) })] }));
};

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const useEvents = (max, step, value, rootRef, dimensionsRef, isInteractive, onCommit, onInput) => {
    const currentInputRef = hooks.useRef();
    const { direction } = useUser.useUser();
    const isRtl = direction === 'rtl';
    const handleInput = (inputValue) => {
        onInput?.({ value: inputValue });
        currentInputRef.current = inputValue;
    };
    const pointerUpHandler = (event) => {
        const val = getValue(event.pageX, max, step, dimensionsRef, isRtl);
        if (val !== -1) {
            onCommit?.({ value: val });
        }
    };
    // When the document or rating gauge parent scrolls, we need to update the dimensionRef.current.x.
    // Instead of updating it for every scroll event, recalculate the dims the first time mouse enters
    // so we get fresh dimension value.
    const pointerEnterHandler = () => {
        dimensionsRef.current = getDimensions(rootRef.current);
    };
    const hoverHandler = (event) => {
        const val = getValue(event.pageX, max, step, dimensionsRef, isRtl);
        if (val !== -1 && val != currentInputRef.current) {
            handleInput(val);
        }
    };
    const blurHandler = () => {
        onCommit?.({ value: value });
    };
    const pointerLeaveHandler = () => {
        handleInput(undefined);
    };
    const keyboardEventsProps = useKeyboardEvents.useKeyboardEvents(value, 0, max, step, currentInputRef, onCommit, onInput);
    return isInteractive
        ? {
            onPointerUp: pointerUpHandler,
            onBlur: blurHandler,
            onPointerMove: hoverHandler,
            onKeyUp: keyboardEventsProps.onKeyUp,
            onKeyDown: keyboardEventsProps.onKeyDown,
            onPointerLeave: pointerLeaveHandler,
            onPointerEnter: pointerEnterHandler
        }
        : {};
};

function useRatingDatatip({ max, value, isDisabled, isReadonly, datatip, thresholds, width }) {
    const datatipIndex = Math.max(1, Math.ceil(value));
    const offset = ((datatipIndex - Math.ceil(max / 2)) * width) / max;
    const datatipText = !datatip && thresholds && !isDisabled
        ? meterUtils.findThreshold(value, thresholds)?.accessibleLabel
        : datatip;
    const { datatipContent, datatipProps } = useDatatip.useDatatip({
        content: isDisabled || isReadonly ? null : datatipText,
        anchor: 'element',
        offset: {
            mainAxis: 8, // redwood datatip design spec
            crossAxis: offset
        },
        placement: 'bottom',
        touchResponse: 'touchStart'
    });
    return {
        datatipContent,
        datatipProps: isReadonly && !isDisabled
            ? {
                'aria-describedby': undefined
            }
            : datatipProps
    };
}

function useRatingTooltip({ isReadonly, isDisabled, tooltip }) {
    const [isOpen, setIsOpen] = hooks.useState(false);
    const text = isReadonly && !isDisabled ? tooltip : '';
    const { tooltipContent, tooltipProps } = useTooltipControlled.useTooltipControlled({
        text,
        isOpen,
        anchor: {
            x: 'element',
            y: 'element'
        },
        position: 'bottom',
        offset: {
            mainAxis: 8, // redwood tooltip design spec
            crossAxis: 0
        },
        isDisabled,
        onToggle: ({ value }) => setIsOpen(value),
        variant: 'tooltip'
    });
    return {
        tooltipContent,
        tooltipProps: !isDisabled && isReadonly
            ? tooltipProps
            : {
                'aria-describedby': undefined
            }
    };
}

/**
 * A rating gauge displays information graphically, typically displaying or accepting user feedback on a product or service.
 */
function RatingGauge({ max = 5, value = 0, size, color = 'neutral', step = 1, isReadonly, isDisabled, testId, ...props }) {
    const testIdProps = useTestId.useTestId(testId);
    meterUtils.validateRange(0, max, value, step);
    const rootRef = hooks.useRef(null);
    const dimensionsRef = hooks.useRef(getDimensions(null));
    const isInteractive = !isReadonly && !isDisabled;
    // Since the dimension are compute lazily after render, store width and x in ref
    // This is used to identify hovered and clicked star.
    // width of the rating gauge depends on size and max so passing them as dependencies for useEffect
    hooks.useEffect(() => {
        dimensionsRef.current = getDimensions(rootRef.current);
    }, [size, max]);
    const eventProps = useEvents(max, step, value, rootRef, dimensionsRef, isInteractive, props.onCommit, props.onInput);
    const { datatipContent, datatipProps } = useRatingDatatip({
        max,
        value,
        isDisabled,
        isReadonly,
        datatip: props.datatip,
        thresholds: props.thresholds,
        width: dimensionsRef.current.width
    });
    const { tooltipContent, tooltipProps } = useRatingTooltip({
        isReadonly,
        isDisabled,
        tooltip: props.tooltip
    });
    const ariaProps = meterUtils.getMeterAriaProps(value, 0, max, props['aria-label'], props['aria-labelledby'], props.thresholds, isDisabled, isReadonly, props.tooltip);
    const { 'aria-describedby': datatipAriaDescribedBy, ...restDatatipProps } = datatipProps;
    const { 'aria-describedby': tooltipAriaDescribedBy, ...restTooltipProps } = tooltipProps;
    const mergedEventProps = mergeProps.mergeProps(eventProps, restDatatipProps, restTooltipProps);
    const ariaDescribedBy = [
        datatipAriaDescribedBy,
        tooltipAriaDescribedBy,
        props['aria-describedby']
    ]
        .filter(Boolean)
        .join(' ');
    const itemColor = meterUtils.getThresholdColorFromValue(value, color, props.thresholds);
    const { isTabbable } = useTabbableMode.useTabbableMode();
    const { classes, styles: { baseStyle, interactiveStyle, itemStyle, sizeStyle } } = useComponentTheme.useComponentTheme(UNSAFE_RatingGauge_themes_redwood_RatingGaugeTheme.RatingGaugeRedwoodTheme, {
        size
    });
    return (jsxRuntime.jsxs(preact.Fragment, { children: [jsxRuntime.jsx("div", { ...testIdProps, ...ariaProps, ref: rootRef, class: classNames.classNames([classes, baseStyle, isInteractive ? interactiveStyle : undefined]), tabIndex: isTabbable && !isDisabled ? 0 : -1, ...mergedEventProps, "aria-describedby": ariaDescribedBy, children: [...Array(max)].map((_, index) => {
                    const fillRatio = Math.min(Math.max(0, value - index), 1);
                    return (jsxRuntime.jsx("div", { className: classNames.classNames([sizeStyle, itemStyle]), children: jsxRuntime.jsx(RatingGaugeItem, { fillRatio: fillRatio, isDisabled: isDisabled, isReadonly: isReadonly, color: itemColor }) }));
                }) }), datatipContent, tooltipContent] }));
}

exports.RatingGauge = RatingGauge;
//# sourceMappingURL=RatingGauge-bafed83c.js.map
