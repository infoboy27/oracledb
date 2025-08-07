/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { u as useNavigationListContext, B as BaseNavigationListItem } from './BaseNavigationListItem-3a377d46.js';
import { S as SvgClose } from './Close-97d45aca.js';
import { useCallback } from 'preact/hooks';
import { u as useHover } from './useHover-d5088fcd.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { E as EmbeddedIconButton } from './EmbeddedIconButton-2bee9a35.js';

function RemovableNavigationListItem({ itemKey, label, badge, metadata, severity }) {
    const { selection, currentKey, onRemove } = useNavigationListContext();
    const isSelected = selection === itemKey;
    const isCurrent = currentKey === itemKey;
    const handleRemove = useCallback(() => {
        onRemove?.({ value: itemKey });
    }, [onRemove, itemKey]);
    const { hoverProps, isHover } = useHover({});
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    //instead of specifying flex: '1 0 auto' in cssProps var
    return (jsx("div", { ...hoverProps, children: jsx(BaseNavigationListItem, { itemKey: itemKey, label: label, badge: badge, metadata: metadata, severity: severity, removeIcon: jsx("span", { "data-oj-navigationlist-item-remove-icon": true, children: jsx(EmbeddedIconButton, { "aria-label": translations.tabBarNavigationList_removeCueText(), size: "xs", onAction: handleRemove, children: (isHover || isSelected || isCurrent) && jsx(SvgClose, {}) }) }) }) }));
}

export { RemovableNavigationListItem as R };
//# sourceMappingURL=RemovableNavigationListItem-4c86bec8.js.map
