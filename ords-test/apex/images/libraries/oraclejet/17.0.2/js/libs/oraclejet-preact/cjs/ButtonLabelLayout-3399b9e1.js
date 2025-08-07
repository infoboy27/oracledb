/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var Text = require('./Text-aaacb6a0.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var UNSAFE_ButtonLabelLayout_themes_redwood_ButtonLabelLayoutTheme = require('./UNSAFE_ButtonLabelLayout/themes/redwood/ButtonLabelLayoutTheme.js');

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
    const { classes: startIconClasses } = useComponentTheme.useComponentTheme(UNSAFE_ButtonLabelLayout_themes_redwood_ButtonLabelLayoutTheme.ButtonLabelLayoutRedwoodTheme, {
        target: 'startIcon',
        size: styling == 'default' ? size : ('embedded' + size),
        onlyIcon: isOnlyIcon ? 'isOnlyIcon' : 'notOnlyIcon',
        twoIconsOnly: isTwoIconsOnly ? 'isTwoIconsOnly' : 'notTwoIconsOnly'
    });
    const { classes: labelClasses, styles: labelStyles } = useComponentTheme.useComponentTheme(UNSAFE_ButtonLabelLayout_themes_redwood_ButtonLabelLayoutTheme.ButtonLabelLayoutRedwoodTheme, {
        target: 'label',
        size: styling == 'embedded' ? ('embedded' + size) : size,
        fill: styling == 'fill' ? 'isFill' : 'notFill',
        textEndIcon: hasTextEndIcon ? 'hasTextEndIcon' : 'notTextEndIcon',
        textStartIcon: hasTextStartIcon ? 'hasTextStartIcon' : 'notTextStartIcon',
        suffix: props.suffix ? 'hasSuffix' : 'notSuffix',
        twoIcons: isTwoIcons ? 'hasTwoIcons' : 'notTwoIcons'
    });
    const { classes: suffixClasses } = useComponentTheme.useComponentTheme(UNSAFE_ButtonLabelLayout_themes_redwood_ButtonLabelLayoutTheme.ButtonLabelLayoutRedwoodTheme, {
        target: 'suffix',
        size: styling == 'default' ? size : ('embedded' + size),
        textStartIcon: hasTextStartIcon ? 'hasTextStartIcon' : 'notTextStartIcon',
        twoIcons: isTwoIcons ? 'hasTwoIcons' : 'notTwoIcons'
    });
    const { classes: endIconClasses } = useComponentTheme.useComponentTheme(UNSAFE_ButtonLabelLayout_themes_redwood_ButtonLabelLayoutTheme.ButtonLabelLayoutRedwoodTheme, {
        target: 'endIcon',
        textEndIcon: hasTextEndIcon ? 'hasTextEndIcon' : 'notTextEndIcon',
        twoIcons: isTwoIcons ? 'hasTwoIcons' : 'notTwoIcons',
        size: styling == 'default' ? size : ('embedded' + size)
    });
    return (jsxRuntime.jsxs("span", { class: labelStyles.container, children: [isShowIcons && props.startIcon && jsxRuntime.jsx("span", { class: startIconClasses, children: props.startIcon }), isShowText && props.children && jsxRuntime.jsxs("span", { class: labelClasses, children: [" ", props.children, " "] }), isShowText && props.suffix && (jsxRuntime.jsx("span", { class: suffixClasses, children: jsxRuntime.jsx(Text.Text, { truncation: 'ellipsis', weight: 'inherit', children: props.suffix }) })), isShowIcons && props.endIcon && jsxRuntime.jsx("span", { class: endIconClasses, children: props.endIcon })] }));
}
ButtonLabelLayout.displayName = 'ButtonLabelLayout';

exports.ButtonLabelLayout = ButtonLabelLayout;
//# sourceMappingURL=ButtonLabelLayout-3399b9e1.js.map
