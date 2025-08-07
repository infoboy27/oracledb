/* @oracle/oraclejet-preact: undefined */
'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var utils = require('../../../utils-b7099be5.js');
var Common_themes_themeContract_css = require('../themeContract.css.js');
require('../../../colorUtils-fe6f2fbf.js');
require('../../../_curry1-e8f0d7ea.js');

/**
 * These theme tokens are manually updated and are not generated from Figma tokens. These will eventually be generated.
 */
const palette = {
    neutral: {
        '0': '255,255,255',
        '10': '251,249,248',
        '20': '245,244,242',
        '30': '241,239,237',
        '40': '228,225,221',
        '50': '212,207,202',
        '60': '188,182,177',
        '70': '174,168,162',
        '80': '158,152,146',
        '90': '139,133,128',
        '100': '122,115,110',
        '110': '111,105,100',
        '120': '102,95,91',
        '130': '92,86,81',
        '140': '81,76,71',
        '150': '71,66,62',
        '160': '58,54,50',
        '170': '49,45,42',
        '180': '32,30,28',
        '190': '22,21,19',
        '200': '0,0,0'
    },
    danger: {
        '10': '255,248,247',
        '20': '255,241,239',
        '30': '255,235,232',
        '40': '255,217,211',
        '50': '255,193,184',
        '60': '255,157,144',
        '70': '255,134,117',
        '80': '254,105,84',
        '90': '236,79,58',
        '100': '214,59,37',
        '110': '195,53,34',
        '120': '179,49,31',
        '130': '162,44,28',
        '140': '143,39,25',
        '150': '124,34,22',
        '160': '102,28,18',
        '170': '86,24,15',
        '180': '60,17,11',
        '190': '42,12,7'
    },
    success: {
        '10': '244,252,235',
        '20': '235,248,222',
        '30': '228,245,211',
        '40': '207,235,179',
        '50': '177,221,136',
        '60': '138,201,79',
        '70': '125,186,69',
        '80': '111,169,57',
        '90': '94,148,43',
        '100': '80,130,35',
        '110': '73,118,32',
        '120': '67,107,29',
        '130': '60,96,26',
        '140': '53,86,23',
        '150': '46,73,20',
        '160': '38,61,16',
        '170': '31,51,14',
        '180': '21,35,9',
        '190': '15,23,6'
    },
    warning: {
        '10': '254,249,242',
        '20': '253,242,229',
        '30': '252,237,220',
        '40': '249,221,188',
        '50': '246,199,146',
        '60': '240,169,87',
        '70': '235,150,50',
        '80': '225,130,18',
        '90': '198,113,14',
        '100': '172,99,12',
        '110': '156,89,11',
        '120': '143,82,10',
        '130': '129,73,9',
        '140': '114,65,8',
        '150': '99,56,7',
        '160': '81,47,6',
        '170': '69,39,5',
        '180': '46,26,3',
        '190': '32,18,2'
    },
    info: {
        '10': '246,250,252',
        '20': '237,246,249',
        '30': '228,241,247',
        '40': '208,229,238',
        '50': '180,213,225',
        '60': '143,191,208',
        '70': '121,177,198',
        '80': '95,162,186',
        '90': '65,144,172',
        '100': '34,126,158',
        '110': '14,114,149',
        '120': '0,104,140',
        '130': '2,94,126',
        '140': '4,83,111',
        '150': '6,72,95',
        '160': '6,60,78',
        '170': '5,50,66',
        '180': '4,35,45',
        '190': '2,24,31'
    },
    brand: {
        '10': '246,250,252',
        '20': '237,246,249',
        '30': '228,241,247',
        '40': '208,229,238',
        '50': '180,213,225',
        '60': '143,191,208',
        '70': '121,177,198',
        '80': '95,162,186',
        '90': '65,144,172',
        '100': '34,126,158',
        '110': '14,114,149',
        '120': '0,104,140',
        '130': '2,94,126',
        '140': '4,83,111',
        '150': '6,72,95',
        '160': '6,60,78',
        '170': '5,50,66',
        '180': '4,35,45',
        '190': '2,24,31'
    }
};
const overlay = {
    hover: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['190'], 0.08),
    active: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['190'], 0.16),
    dangerHover: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.danger['60'], 0.24),
    dangerActive: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.danger['60'], 0.32),
    scrim: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['190'], 0.4),
    inverseHover: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['0'], 0.08),
    inverseActive: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['0'], 0.12)
};
const pageBackground = {
    neutral0: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['0']),
    neutral10: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['10']),
    neutral20: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['20']),
    neutral30: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['30']),
    neutral40: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['40'])
};
const surface = {
    neutral0: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['0']),
    neutral10: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['10']),
    neutral20: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['20']),
    neutral30: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['30']),
    selected: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.brand['30']),
    disabled: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['190'], 0.04),
    popup: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['0']),
    neutral: {
        low: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['10']),
        subtle: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['190'], 0.08),
        strong: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['100'])
    },
    success: {
        low: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.success['10']),
        subtle: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.success['60'], 0.4),
        strong: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.success['120'])
    },
    info: {
        low: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.info['10']),
        subtle: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.info['60'], 0.4),
        strong: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.info['120'])
    },
    warning: {
        low: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.warning['10']),
        subtle: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.warning['60'], 0.4),
        strong: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.warning['120'])
    },
    danger: {
        low: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.danger['10']),
        subtle: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.danger['60'], 0.4),
        strong: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.danger['120'])
    }
};
const border = {
    enabled: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['190'], 0.5),
    disabled: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['190'], 0.2),
    divider: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['190'], 0.12),
    selected: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.brand['100']),
    dropLine: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.brand['100']),
    selectedNeutral: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['190']),
    warning: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.warning['120']),
    danger: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.danger['120']),
    keyboardFocus: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['190'])
};
const boxshadow = {
    shadowcolor: Common_themes_themeContract_css.colorSchemeVars.palette.neutral['200']
};
const textIcon = {
    primary: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['190']),
    secondary: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['190'], 0.7),
    disabled: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['190'], 0.4),
    inverse: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['0']),
    onColor: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['0']),
    link: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.brand['120']),
    success: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.success['120']),
    info: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.info['120']),
    warning: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.warning['120']),
    danger: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.danger['120'])
};
const textfield = {
    surface: {
        enabled: Common_themes_themeContract_css.colorSchemeVars.surface.neutral0
    },
    border: {
        enabled: Common_themes_themeContract_css.colorSchemeVars.border.enabled
    }
};
const collection = {
    header: {
        text: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.textIcon.primary),
        surface: {
            selected: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['190'], 0.12),
            partialSelected: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['190'], 0.04)
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
        enabled: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['190'], 0.16),
        disabled: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['190'], 0.16)
    },
    fill: {
        enabled: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['190']),
        disabled: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['190'], 0.2)
    },
    thumb: {
        surface: utils.fallbackVar(Common_themes_themeContract_css.globalVars.currentBackgroundColor, Common_themes_themeContract_css.colorSchemeVars.palette.neutral['10'])
    },
    reference: {
        line: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['190'], 0.8),
        lineContrast: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['20'], 0.7),
        area: utils.rgba(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['170'], 0.08)
    }
};
const dvt = {
    contrastLine: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral['20']),
    paletteQualitative: {
        '1': '36, 93, 99',
        '2': '215, 121, 15',
        '3': '49, 160, 156',
        '4': '78, 65, 55',
        '5': '105, 158, 97',
        '6': '180, 114, 130',
        '7': '131, 64, 30',
        '8': '158, 127, 204',
        '9': '168, 142, 0',
        '10': '88, 49, 110',
        '11': '89, 153, 181',
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
//# sourceMappingURL=theme.light.tokens.js.map
