/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { useCallback } from 'preact/hooks';
import { u as useHover } from './useHover-d5088fcd.js';
import { S as SvgClose } from './Close-97d45aca.js';
import { F as Flex } from './Flex-24628925.js';
import { m as mergeInterpolations } from './mergeInterpolations-e2db2a66.js';
import { f as flexitemInterpolations } from './flexitem-7b7f7920.js';
import { u as useTabBarContext } from './useTabBarContext-0071d2a7.js';
import { B as BaseTabBarItem } from './TabBarItem-c681fa07.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { E as EmbeddedIconButton } from './EmbeddedIconButton-2bee9a35.js';

function RemovableTabBarItem({ itemKey, label, icon, badge, metadata, severity, 'aria-controls': ariaControls }) {
    const { selection, currentKey, layout, onRemove } = useTabBarContext();
    const isSelected = selection === itemKey;
    const isCurrent = currentKey === itemKey;
    const handleRemove = useCallback(() => {
        onRemove?.({ value: itemKey });
    }, [onRemove, itemKey]);
    const { hoverProps, isHover } = useHover({});
    //instead of specifying flex: '1 0 auto' in cssProps var
    const styleInterpolations = mergeInterpolations([
        ...Object.values(flexitemInterpolations)
    ]);
    const flexDimensions = styleInterpolations({
        flex: layout === 'stretch' ? '1 0 auto' : '0 0 auto'
    });
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    //TODO: In addition to aria-label a genric instruction is required for keyboard deletion
    //common to al tabs,after feedback from Curt's investigations.
    return (jsx("div", { ...hoverProps, style: flexDimensions, children: jsx(Flex, { children: jsx(BaseTabBarItem, { "aria-controls": ariaControls, itemKey: itemKey, label: label, icon: icon, badge: badge, metadata: metadata, severity: severity, removeIcon: jsx("span", { "data-oj-tabbar-item-remove-icon": "true", children: jsx(EmbeddedIconButton, { "aria-label": translations.tabBarNavigationList_removeCueText(), size: "xs", onAction: handleRemove, children: (isHover || isSelected || isCurrent) && jsx(SvgClose, {}) }) }) }) }) }));
}

export { RemovableTabBarItem as R };
//# sourceMappingURL=RemovableTabBarItem-217d4a0b.js.map
