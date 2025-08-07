/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { S as Separator } from './Separator-93c70737.js';
import { MenuSeparatorRedwoodTheme } from './UNSAFE_Menu/themes/redwood/MenuSeparatorTheme.js';

function MenuSeparator() {
    const { classes } = useComponentTheme(MenuSeparatorRedwoodTheme);
    return (jsx("div", { class: classes, children: jsx(Separator, {}) }));
}

export { MenuSeparator as M };
//# sourceMappingURL=MenuSeparator-02bd6517.js.map
