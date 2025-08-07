/* @oracle/oraclejet-preact: undefined */
import { jsxs, jsx } from 'preact/jsx-runtime';
import { u as useLoadingIndicatorTimer } from './useLoadingIndicatorTimer-898d4e3e.js';
import { L as LiveRegion } from './LiveRegion-81216fe6.js';
import { H as HiddenAccessible } from './HiddenAccessible-61197e7c.js';
import { u as useId } from './useId-03dbfdf0.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { baseStyles, loadingContainerStyles } from './UNSAFE_VisProgressiveLoader/themes/ProgressiveLoaderStyles.css.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { s as sizeToCSS } from './size-782ed57a.js';
import { S as Skeleton } from './Skeleton-c1d24eea.js';
import { baseStyles as baseStyles$1, baseSkeletonContainerStyles, skeletonContainerStyles } from './UNSAFE_VisProgressiveLoader/themes/VisSkeletonStyles.css.js';

/**
 * Displays the specified fallback content during progressive loading of the main content.
 */
function ProgressiveLoader({ isLoading, fallback, children, role, tabIndex, width, height, 'aria-label': ariaLabel, 'aria-labelledby': ariaLabelledBy, 'aria-describedby': ariaDescribedBy }) {
    const showLoadingIndicator = useLoadingIndicatorTimer(isLoading);
    const { vis_stateLoading, vis_stateLoaded } = useTranslationBundle('@oracle/oraclejet-preact');
    const descId = useId();
    return isLoading && showLoadingIndicator ? (jsxs("div", { role: role, tabIndex: tabIndex, "aria-label": ariaLabel, "aria-labelledby": ariaLabelledBy, "aria-describedby": ariaDescribedBy
            ? [...new Set(ariaDescribedBy.split(/\s+/).concat(descId))].join(' ')
            : descId, class: classNames([baseStyles, loadingContainerStyles]), style: {
            width: width && sizeToCSS(width),
            height: height && sizeToCSS(height)
        }, children: [fallback, jsx(HiddenAccessible, { id: descId, children: vis_stateLoading() }), jsx(LiveRegion, { type: "polite", children: vis_stateLoading() })] })) : (jsxs("div", { class: baseStyles, style: {
            width: width && sizeToCSS(width),
            height: height && sizeToCSS(height)
        }, children: [children, jsx(LiveRegion, { type: "polite", children: ariaLabel ? `${ariaLabel}, ${vis_stateLoaded()}` : vis_stateLoaded() })] }));
}

/**
 * Skeleton loading for visualizations.
 */
function VisSkeleton({ type, width, height }) {
    return (jsx("div", { class: baseStyles$1, style: {
            width: width && sizeToCSS(width),
            height: height && sizeToCSS(height)
        }, children: jsx("div", { class: classNames([baseSkeletonContainerStyles, skeletonContainerStyles[type]]), children: jsx(Skeleton, { width: "100%", height: "100%" }) }) }));
}

/**
 * Displays the specified fallback content during progressive loading of the visualization.
 */
function VisProgressiveLoader({ type, role = 'application', children, ...props }) {
    const fallback = jsx(VisSkeleton, { type: type });
    return (jsx(ProgressiveLoader, { role: role, tabIndex: 0, fallback: fallback, ...props, children: children }));
}

export { VisProgressiveLoader as V };
//# sourceMappingURL=VisProgressiveLoader-0d9a0dd0.js.map
