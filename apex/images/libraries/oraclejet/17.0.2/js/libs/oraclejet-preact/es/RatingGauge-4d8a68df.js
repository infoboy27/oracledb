/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs } from 'preact/jsx-runtime';
import { Fragment } from 'preact';
import { useRef, useState, useEffect } from 'preact/hooks';
import { c as classNames } from './classNames-4e12b00d.js';
import { ratingGaugeVars } from './UNSAFE_RatingGauge/themes/RatingGaugeContract.css.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { u as useUser } from './useUser-99920e02.js';
import { a as assignInlineVars } from './vanilla-extract-dynamic.esm-2955d60a.js';
import { RatingGaugeRedwoodTheme } from './UNSAFE_RatingGauge/themes/redwood/RatingGaugeTheme.js';
import { u as useKeyboardEvents } from './useKeyboardEvents-102b4feb.js';
import 'preact/compat';
import './LayerHost-45f545d7.js';
import './LayerStyles.styles.css';
import './Floating-9703160e.js';
import './useDatatip.styles.css';
import './datatipUtils-5cb22909.js';
import { f as findThreshold, v as validateRange, g as getMeterAriaProps, b as getThresholdColorFromValue } from './meterUtils-5d22645f.js';
import { u as useDatatip } from './useDatatip-7c661980.js';
import { u as useTooltipControlled } from './useTooltipControlled-2044f639.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';
import './TabbableModeContext-7d8ad946.js';
import { u as useTabbableMode } from './useTabbableMode-a3a351d0.js';
import { u as useTestId } from './useTestId-adde554c.js';

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
    const { forcedColors } = useUser();
    const isHighContrast = forcedColors === 'active';
    const needsHighContrastStyle = isHighContrast && isDisabled;
    const enumColor = getColorEnum(color);
    const customColors = assignInlineVars({
        [ratingGaugeVars.colorSelected]: color,
        [ratingGaugeVars.borderColorSelected]: color,
        [ratingGaugeVars.colorSelectedReadonly]: color
    });
    const { variantClasses, styles: { ratingStarBaseStyle, innerRatingStarColor, outerRatingStarColor, outerDisabledHighContrastBaseStyle, outerDisabledHighContrastSelectedStyle, outerDisabledHighContrastUnselectedStyle } } = useComponentTheme(RatingGaugeRedwoodTheme, {
        color: enumColor,
        selectionState: isSelected ? 'isSelected' : 'isNotSelected',
        disabledState: isDisabled ? 'isDisabled' : 'isNotDisabled',
        readonlyState: isReadOnly ? 'isReadonly' : 'isNotReadonly',
        highContrastState: isHighContrast ? 'isHighContrast' : 'isNotHighContrast'
    });
    return (jsx("svg", { viewBox: "0 0 36 36", height: "100%", width: "100%", style: !enumColor ? customColors : undefined, class: classNames([ratingStarBaseStyle, enumColor ? variantClasses : '']), children: jsxs("g", { children: [jsx("path", { class: innerRatingStarColor, d: "m18 1 5.0061 11.9524 12.9939 1.0344-9.9 8.4215 3.0246 12.5917-11.1246-6.7476-11.12461 6.7476 3.02461-12.5917-9.9-8.4215 12.9939-1.0344z" }), jsx("path", { class: classNames([
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
    const { direction } = useUser();
    const isRtl = direction === 'rtl';
    const { styles: { fractionalStarBaseStyle } } = useComponentTheme(RatingGaugeRedwoodTheme);
    if (fillRatio === 1 || fillRatio === 0) {
        return (jsx(RatingStar, { isSelected: fillRatio === 1, isDisabled: isDisabled, isReadOnly: isReadonly, color: color }));
    }
    // if fillRatio is not 1 or zero, absolutely position selected star above the
    // unselected star and clip both to form partially selected star.
    return (jsxs(Fragment, { children: [jsx("div", { class: fractionalStarBaseStyle, style: {
                    clipPath: `inset(0% ${isRtl ? (1 - fillRatio) * 100 : 0}% 0% ${isRtl ? 0 : fillRatio * 100}%)`
                }, children: jsx(RatingStar, { isSelected: false, isDisabled: isDisabled, isReadOnly: isReadonly, color: color }) }), jsx("div", { class: fractionalStarBaseStyle, style: {
                    clipPath: `inset(0% ${isRtl ? 0 : (1 - fillRatio) * 100}% 0% ${isRtl ? (1 - fillRatio) * 100 : 0}%)`
                }, children: jsx(RatingStar, { isSelected: true, isDisabled: isDisabled, isReadOnly: isReadonly, color: color }) })] }));
};

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const useEvents = (max, step, value, rootRef, dimensionsRef, isInteractive, onCommit, onInput) => {
    const currentInputRef = useRef();
    const { direction } = useUser();
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
    const keyboardEventsProps = useKeyboardEvents(value, 0, max, step, currentInputRef, onCommit, onInput);
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
        ? findThreshold(value, thresholds)?.accessibleLabel
        : datatip;
    const { datatipContent, datatipProps } = useDatatip({
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
    const [isOpen, setIsOpen] = useState(false);
    const text = isReadonly && !isDisabled ? tooltip : '';
    const { tooltipContent, tooltipProps } = useTooltipControlled({
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
    const testIdProps = useTestId(testId);
    validateRange(0, max, value, step);
    const rootRef = useRef(null);
    const dimensionsRef = useRef(getDimensions(null));
    const isInteractive = !isReadonly && !isDisabled;
    // Since the dimension are compute lazily after render, store width and x in ref
    // This is used to identify hovered and clicked star.
    // width of the rating gauge depends on size and max so passing them as dependencies for useEffect
    useEffect(() => {
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
    const ariaProps = getMeterAriaProps(value, 0, max, props['aria-label'], props['aria-labelledby'], props.thresholds, isDisabled, isReadonly, props.tooltip);
    const { 'aria-describedby': datatipAriaDescribedBy, ...restDatatipProps } = datatipProps;
    const { 'aria-describedby': tooltipAriaDescribedBy, ...restTooltipProps } = tooltipProps;
    const mergedEventProps = mergeProps(eventProps, restDatatipProps, restTooltipProps);
    const ariaDescribedBy = [
        datatipAriaDescribedBy,
        tooltipAriaDescribedBy,
        props['aria-describedby']
    ]
        .filter(Boolean)
        .join(' ');
    const itemColor = getThresholdColorFromValue(value, color, props.thresholds);
    const { isTabbable } = useTabbableMode();
    const { classes, styles: { baseStyle, interactiveStyle, itemStyle, sizeStyle } } = useComponentTheme(RatingGaugeRedwoodTheme, {
        size
    });
    return (jsxs(Fragment, { children: [jsx("div", { ...testIdProps, ...ariaProps, ref: rootRef, class: classNames([classes, baseStyle, isInteractive ? interactiveStyle : undefined]), tabIndex: isTabbable && !isDisabled ? 0 : -1, ...mergedEventProps, "aria-describedby": ariaDescribedBy, children: [...Array(max)].map((_, index) => {
                    const fillRatio = Math.min(Math.max(0, value - index), 1);
                    return (jsx("div", { className: classNames([sizeStyle, itemStyle]), children: jsx(RatingGaugeItem, { fillRatio: fillRatio, isDisabled: isDisabled, isReadonly: isReadonly, color: itemColor }) }));
                }) }), datatipContent, tooltipContent] }));
}

export { RatingGauge as R };
//# sourceMappingURL=RatingGauge-4d8a68df.js.map
