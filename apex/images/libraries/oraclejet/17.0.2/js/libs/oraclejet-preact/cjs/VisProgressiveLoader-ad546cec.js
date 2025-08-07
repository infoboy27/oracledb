/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var useLoadingIndicatorTimer = require('./useLoadingIndicatorTimer-128b4b14.js');
var LiveRegion = require('./LiveRegion-1315adeb.js');
var HiddenAccessible = require('./HiddenAccessible-087eb49a.js');
var useId = require('./useId-6c0eeb27.js');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');
var UNSAFE_VisProgressiveLoader_themes_ProgressiveLoaderStyles_css = require('./UNSAFE_VisProgressiveLoader/themes/ProgressiveLoaderStyles.css.js');
var classNames = require('./classNames-c14c6ef3.js');
var size = require('./size-4e606ce4.js');
var Skeleton = require('./Skeleton-f0f86df2.js');
var UNSAFE_VisProgressiveLoader_themes_VisSkeletonStyles_css = require('./UNSAFE_VisProgressiveLoader/themes/VisSkeletonStyles.css.js');

/**
 * Displays the specified fallback content during progressive loading of the main content.
 */
function ProgressiveLoader({ isLoading, fallback, children, role, tabIndex, width, height, 'aria-label': ariaLabel, 'aria-labelledby': ariaLabelledBy, 'aria-describedby': ariaDescribedBy }) {
    const showLoadingIndicator = useLoadingIndicatorTimer.useLoadingIndicatorTimer(isLoading);
    const { vis_stateLoading, vis_stateLoaded } = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const descId = useId.useId();
    return isLoading && showLoadingIndicator ? (jsxRuntime.jsxs("div", { role: role, tabIndex: tabIndex, "aria-label": ariaLabel, "aria-labelledby": ariaLabelledBy, "aria-describedby": ariaDescribedBy
            ? [...new Set(ariaDescribedBy.split(/\s+/).concat(descId))].join(' ')
            : descId, class: classNames.classNames([UNSAFE_VisProgressiveLoader_themes_ProgressiveLoaderStyles_css.baseStyles, UNSAFE_VisProgressiveLoader_themes_ProgressiveLoaderStyles_css.loadingContainerStyles]), style: {
            width: width && size.sizeToCSS(width),
            height: height && size.sizeToCSS(height)
        }, children: [fallback, jsxRuntime.jsx(HiddenAccessible.HiddenAccessible, { id: descId, children: vis_stateLoading() }), jsxRuntime.jsx(LiveRegion.LiveRegion, { type: "polite", children: vis_stateLoading() })] })) : (jsxRuntime.jsxs("div", { class: UNSAFE_VisProgressiveLoader_themes_ProgressiveLoaderStyles_css.baseStyles, style: {
            width: width && size.sizeToCSS(width),
            height: height && size.sizeToCSS(height)
        }, children: [children, jsxRuntime.jsx(LiveRegion.LiveRegion, { type: "polite", children: ariaLabel ? `${ariaLabel}, ${vis_stateLoaded()}` : vis_stateLoaded() })] }));
}

/**
 * Skeleton loading for visualizations.
 */
function VisSkeleton({ type, width, height }) {
    return (jsxRuntime.jsx("div", { class: UNSAFE_VisProgressiveLoader_themes_VisSkeletonStyles_css.baseStyles, style: {
            width: width && size.sizeToCSS(width),
            height: height && size.sizeToCSS(height)
        }, children: jsxRuntime.jsx("div", { class: classNames.classNames([UNSAFE_VisProgressiveLoader_themes_VisSkeletonStyles_css.baseSkeletonContainerStyles, UNSAFE_VisProgressiveLoader_themes_VisSkeletonStyles_css.skeletonContainerStyles[type]]), children: jsxRuntime.jsx(Skeleton.Skeleton, { width: "100%", height: "100%" }) }) }));
}

/**
 * Displays the specified fallback content during progressive loading of the visualization.
 */
function VisProgressiveLoader({ type, role = 'application', children, ...props }) {
    const fallback = jsxRuntime.jsx(VisSkeleton, { type: type });
    return (jsxRuntime.jsx(ProgressiveLoader, { role: role, tabIndex: 0, fallback: fallback, ...props, children: children }));
}

exports.VisProgressiveLoader = VisProgressiveLoader;
//# sourceMappingURL=VisProgressiveLoader-ad546cec.js.map
