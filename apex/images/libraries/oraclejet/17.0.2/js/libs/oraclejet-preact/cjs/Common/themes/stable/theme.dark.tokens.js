/* @oracle/oraclejet-preact: undefined */
'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var utils = require('../../../utils-b7099be5.js');
var Common_themes_themeContract_css = require('../themeContract.css.js');
require('../../../colorUtils-fe6f2fbf.js');
require('../../../_curry1-e8f0d7ea.js');

/**
 * Stable theme tokens are manually updated and are not generated from Figma tokens
 */
const palette = {
    neutral: {
        '0': '0,0,0',
        '10': '10,10,10',
        '20': '15,15,15',
        '30': '22,22,22',
        '40': '33,33,33',
        '50': '46,46,46',
        '60': '63,63,63',
        '70': '73,73,73',
        '80': '85,85,85',
        '90': '101,101,101',
        '100': '118,118,118',
        '110': '129,129,129',
        '120': '139,139,139',
        '130': '151,151,151',
        '140': '164,164,164',
        '150': '178,178,178',
        '160': '195,195,195',
        '170': '207,207,207',
        '180': '228,228,228',
        '190': '238,238,238',
        '200': '254,254,254'
    },
    danger: {
        '10': '20,5,3',
        '20': '32,9,6',
        '30': '44,12,8',
        '40': '64,17,11',
        '50': '89,24,16',
        '60': '119,33,21',
        '70': '137,38,24',
        '80': '159,44,28',
        '90': '188,52,33',
        '100': '218,60,38',
        '110': '232,74,52',
        '120': '242,88,67',
        '130': '253,103,82',
        '140': '255,127,109',
        '150': '255,150,136',
        '160': '255,176,165',
        '170': '255,193,185',
        '180': '255,220,216',
        '190': '255,234,232'
    },
    success: {
        '10': '7,11,3',
        '20': '11,18,5',
        '30': '15,24,6',
        '40': '23,37,10',
        '50': '32,52,14',
        '60': '44,70,19',
        '70': '51,82,22',
        '80': '59,95,26',
        '90': '71,113,31',
        '100': '82,131,36',
        '110': '90,144,41',
        '120': '99,155,48',
        '130': '110,167,57',
        '140': '121,181,66',
        '150': '134,196,76',
        '160': '158,212,107',
        '170': '179,221,139',
        '180': '211,236,185',
        '190': '228,244,210'
    },
    warning: {
        '10': '13,7,1',
        '20': '25,15,2',
        '30': '32,18,2',
        '40': '49,28,4',
        '50': '69,39,5',
        '60': '94,54,7',
        '70': '109,63,8',
        '80': '127,73,9',
        '90': '151,86,11',
        '100': '175,100,12',
        '110': '192,109,14',
        '120': '207,118,15',
        '130': '224,128,16',
        '140': '233,144,42',
        '150': '239,163,75',
        '160': '243,185,118',
        '170': '246,200,148',
        '180': '250,224,194',
        '190': '252,236,219'
    },
    info: {
        '10': '1,12,15',
        '20': '2,17,23',
        '30': '3,25,32',
        '40': '4,36,48',
        '50': '5,51,67',
        '60': '7,69,91',
        '70': '5,80,106',
        '80': '2,93,125',
        '90': '8,110,146',
        '100': '38,127,159',
        '110': '58,139,169',
        '120': '74,149,176',
        '130': '93,161,185',
        '140': '115,173,195',
        '150': '136,186,205',
        '160': '163,202,217',
        '170': '182,213,226',
        '180': '212,231,239',
        '190': '229,241,247'
    },
    brand: {
        '10': '0,10,16',
        '20': '0,18,29',
        '30': '0,23,37',
        '40': '1,36,57',
        '50': '1,49,80',
        '60': '1,66,108',
        '70': '1,77,125',
        '80': '1,89,145',
        '90': '2,106,171',
        '100': '2,123,199',
        '110': '28,136,205',
        '120': '49,147,209',
        '130': '72,159,214',
        '140': '97,172,220',
        '150': '124,186,226',
        '160': '154,202,233',
        '170': '175,213,237',
        '180': '210,231,245',
        '190': '228,241,249'
    }
};
const overlay = {
    hover: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['200'], 0.08),
    active: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['200'], 0.12),
    dangerHover: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.danger['60'], 0.32),
    dangerActive: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.danger['60'], 0.4),
    scrim: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['200'], 0.4),
    inverseHover: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['20'], 0.08),
    inverseActive: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['20'], 0.16)
};
const pageBackground = {
    neutral0: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['10']),
    neutral10: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['20']),
    neutral20: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['30']),
    neutral30: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['40']),
    neutral40: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['50'])
};
const surface = {
    neutral0: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['10']),
    neutral10: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['20']),
    neutral20: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['30']),
    neutral30: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['40']),
    selected: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.brand['70']),
    disabled: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['200'], 0.04),
    popup: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['50']),
    neutral: {
        low: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['40']),
        subtle: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['200'], 0.16),
        strong: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['100'])
    },
    success: {
        low: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.success['40']),
        subtle: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.success['70'], 0.6),
        strong: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.success['100'])
    },
    info: {
        low: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.info['40']),
        subtle: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.info['70'], 0.6),
        strong: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.info['100'])
    },
    warning: {
        low: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.warning['40']),
        subtle: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.warning['70'], 0.6),
        strong: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.warning['100'])
    },
    danger: {
        low: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.danger['40']),
        subtle: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.danger['70'], 0.6),
        strong: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.danger['100'])
    }
};
const border = {
    enabled: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['200'], 0.5),
    disabled: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['200'], 0.2),
    divider: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['200'], 0.12),
    selected: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.brand['170']),
    dropLine: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.brand['170']),
    selectedNeutral: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['200']),
    warning: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.warning['110']),
    danger: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.danger['110']),
    keyboardFocus: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['200'])
};
const boxshadow = {
    shadowcolor: Common_themes_themeContract_css.colorSchemeVars.palette.neutral['0']
};
const textIcon = {
    primary: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['200']),
    secondary: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['200'], 0.7),
    disabled: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['200'], 0.4),
    inverse: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['10']),
    link: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.brand['170']),
    success: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.success['120']),
    info: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.info['120']),
    warning: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.warning['120']),
    danger: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.danger['120']),
    onColor: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['200'])
};
const textfield = {
    surface: {
        enabled: Common_themes_themeContract_css.colorSchemeVars.surface.neutral20
    },
    border: {
        enabled: Common_themes_themeContract_css.colorSchemeVars.border.enabled
    }
};
const collection = {
    header: {
        text: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.textIcon.primary),
        surface: {
            selected: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['200'], 0.12),
            partialSelected: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['200'], 0.04)
        }
    }
};
const collectionGrid = {
    cell: {
        surfaceEdit: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['0'])
    }
};
const measure = {
    track: {
        enabled: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['200'], 0.16),
        disabled: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['200'], 0.16)
    },
    fill: {
        enabled: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['200']),
        disabled: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['200'], 0.3)
    },
    thumb: {
        surface: utils.fallbackVar(Common_themes_themeContract_css.globalVars.currentBackgroundColor, Common_themes_themeContract_css.colorSchemeVars.palette.neutral['0'])
    },
    reference: {
        line: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['200'], 0.8),
        lineContrast: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['20'], 0.7),
        area: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['200'], 0.08)
    }
};
const dvt = {
    contrastLine: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['20']),
    paletteQualitative: {
        '1': '36, 93, 99',
        '2': '222, 127, 17',
        '3': '95, 185, 181',
        '4': '78, 65, 55',
        '5': '160, 201, 140',
        '6': '180, 114, 130',
        '7': '131, 64, 30',
        '8': '158, 127, 204',
        '9': '251, 194, 106',
        '10': '88, 49, 110',
        '11': '95, 162, 186',
        '12': '49, 122, 69'
    },
    threshold: {
        success: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.success['100']),
        warning: 'rgb(207, 124, 0)',
        danger: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.danger['100'])
    },
    marquee: {
        border: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['190'], 0.8),
        surface: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['20'], 0.1)
    },
    referenceObject: {
        area: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['170'], 0.08),
        line: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['190'], 0.8)
    },
    overview: {
        background: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['50']),
        windowBackground: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['0']),
        windowBorder: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['170'])
    }
};
const colorScheme = {
    palette,
    overlay,
    pageBackground,
    surface,
    border,
    boxshadow,
    textIcon,
    textfield,
    collection,
    collectionGrid,
    measure,
    dvt
};

exports.colorScheme = colorScheme;
//# sourceMappingURL=theme.dark.tokens.js.map
