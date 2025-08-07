/* @oracle/oraclejet-preact: undefined */
import { jsxs, jsx } from 'preact/jsx-runtime';
import { T as Text } from './Text-da8588ce.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { ButtonLabelLayoutRedwoodTheme } from './UNSAFE_ButtonLabelLayout/themes/redwood/ButtonLabelLayoutTheme.js';

const isNullOrUndefined = (value) => {
    return value === null || value === undefined;
};
function ButtonLabelLayout({ size = 'md', display = 'all', styling = 'default', ...props }) {
    const isShowIcons = display === 'all' || display === 'icons';
    const isShowText = display === 'all' || display === 'label';
    const isOnlyIcon = props.startIcon && (display === 'icons' || !props.children) && !props.endIcon;
    const hasTextStartIcon = !isNullOrUndefined(props.startIcon) && display === 'all';
    const hasTextEndIcon = !isNullOrUndefined(props.endIcon) && isShowIcons;
    const isTwoIcons = !isNullOrUndefined(props.startIcon) && !isNullOrUndefined(props.endIcon);
    const isTwoIconsOnly = isTwoIcons && display === 'icons';
    const { classes: startIconClasses } = useComponentTheme(ButtonLabelLayoutRedwoodTheme, {
        target: 'startIcon',
        size: styling == 'default' ? size : ('embedded' + size),
        onlyIcon: isOnlyIcon ? 'isOnlyIcon' : 'notOnlyIcon',
        twoIconsOnly: isTwoIconsOnly ? 'isTwoIconsOnly' : 'notTwoIconsOnly'
    });
    const { classes: labelClasses, styles: labelStyles } = useComponentTheme(ButtonLabelLayoutRedwoodTheme, {
        target: 'label',
        size: styling == 'embedded' ? ('embedded' + size) : size,
        fill: styling == 'fill' ? 'isFill' : 'notFill',
        textEndIcon: hasTextEndIcon ? 'hasTextEndIcon' : 'notTextEndIcon',
        textStartIcon: hasTextStartIcon ? 'hasTextStartIcon' : 'notTextStartIcon',
        suffix: props.suffix ? 'hasSuffix' : 'notSuffix',
        twoIcons: isTwoIcons ? 'hasTwoIcons' : 'notTwoIcons'
    });
    const { classes: suffixClasses } = useComponentTheme(ButtonLabelLayoutRedwoodTheme, {
        target: 'suffix',
        size: styling == 'default' ? size : ('embedded' + size),
        textStartIcon: hasTextStartIcon ? 'hasTextStartIcon' : 'notTextStartIcon',
        twoIcons: isTwoIcons ? 'hasTwoIcons' : 'notTwoIcons'
    });
    const { classes: endIconClasses } = useComponentTheme(ButtonLabelLayoutRedwoodTheme, {
        target: 'endIcon',
        textEndIcon: hasTextEndIcon ? 'hasTextEndIcon' : 'notTextEndIcon',
        twoIcons: isTwoIcons ? 'hasTwoIcons' : 'notTwoIcons',
        size: styling == 'default' ? size : ('embedded' + size)
    });
    return (jsxs("span", { class: labelStyles.container, children: [isShowIcons && props.startIcon && jsx("span", { class: startIconClasses, children: props.startIcon }), isShowText && props.children && jsxs("span", { class: labelClasses, children: [" ", props.children, " "] }), isShowText && props.suffix && (jsx("span", { class: suffixClasses, children: jsx(Text, { truncation: 'ellipsis', weight: 'inherit', children: props.suffix }) })), isShowIcons && props.endIcon && jsx("span", { class: endIconClasses, children: props.endIcon })] }));
}
ButtonLabelLayout.displayName = 'ButtonLabelLayout';

export { ButtonLabelLayout as B };
//# sourceMappingURL=ButtonLabelLayout-03cfed16.js.map
