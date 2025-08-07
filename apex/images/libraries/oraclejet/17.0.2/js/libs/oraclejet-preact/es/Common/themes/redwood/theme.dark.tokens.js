/* @oracle/oraclejet-preact: undefined */
import { r as rgba, a as rgb, f as fallbackVar } from '../../../utils-6eab3a64.js';
import { colorSchemeVars, globalVars } from '../themeContract.css.js';
import '../../../colorUtils-16eb823f.js';
import '../../../_curry1-25297e59.js';

/**
 * These theme tokens are manually updated and are not generated from Figma tokens. These will eventually be generated.
 */
const palette = {
    neutral: {
        '0': '0, 0, 0',
        '10': '10, 10, 9',
        '20': '18, 17, 15',
        '30': '23, 22, 20',
        '40': '35, 33, 31',
        '50': '49, 46, 43',
        '60': '67, 63, 59',
        '70': '78, 73, 68',
        '80': '91, 85, 81',
        '90': '107, 101, 96',
        '100': '124, 117, 112',
        '110': '135, 129, 124',
        '120': '146, 139, 134',
        '130': '157, 150, 145',
        '140': '170, 163, 158',
        '150': '184, 178, 173',
        '160': '200, 195, 191',
        '170': '212, 207, 204',
        '180': '231, 227, 225',
        '190': '241, 238, 237',
        '200': '255, 255, 255'
    },
    danger: {
        '10': '18, 5, 3',
        '20': '32, 9, 5',
        '30': '41, 12, 7',
        '40': '64, 18, 11',
        '50': '89, 24, 15',
        '60': '119, 32, 20',
        '70': '138, 37, 24',
        '80': '160, 43, 28',
        '90': '188, 52, 33',
        '100': '216, 63, 42',
        '110': '224, 82, 62',
        '120': '231, 98, 80',
        '130': '238, 115, 98',
        '140': '245, 133, 118',
        '150': '253, 151, 138',
        '160': '255, 176, 166',
        '170': '255, 193, 185',
        '180': '255, 220, 216',
        '190': '255, 234, 232'
    },
    success: {
        '10': '7, 11, 3',
        '20': '11, 17, 4',
        '30': '16, 25, 7',
        '40': '24, 37, 10',
        '50': '33, 52, 14',
        '60': '44, 70, 19',
        '70': '51, 82, 22',
        '80': '60, 95, 26',
        '90': '70, 113, 31',
        '100': '81, 131, 36',
        '110': '91, 144, 43',
        '120': '100, 154, 50',
        '130': '110, 167, 58',
        '140': '121, 181, 66',
        '150': '134, 196, 76',
        '160': '159, 211, 109',
        '170': '179, 221, 140',
        '180': '211, 236, 187',
        '190': '228, 244, 212'
    },
    warning: {
        '10': '15, 8, 1',
        '20': '25, 14, 2',
        '30': '33, 18, 2',
        '40': '50, 28, 3',
        '50': '70, 39, 5',
        '60': '95, 53, 7',
        '70': '110, 62, 8',
        '80': '128, 72, 9',
        '90': '151, 86, 11',
        '100': '174, 101, 14',
        '110': '185, 113, 27',
        '120': '196, 124, 39',
        '130': '208, 136, 52',
        '140': '221, 149, 66',
        '150': '236, 164, 82',
        '160': '243, 185, 118',
        '170': '246, 201, 148',
        '180': '250, 224, 193',
        '190': '252, 237, 218'
    },
    info: {
        '10': '1, 11, 15',
        '20': '2, 19, 24',
        '30': '2, 24, 31',
        '40': '3, 37, 49',
        '50': '4, 51, 67',
        '60': '6, 69, 91',
        '70': '10, 80, 104',
        '80': '17, 93, 120',
        '90': '26, 110, 140',
        '100': '36, 127, 159',
        '110': '57, 139, 168',
        '120': '73, 149, 176',
        '130': '93, 161, 185',
        '140': '114, 173, 195',
        '150': '135, 186, 205',
        '160': '163, 202, 217',
        '170': '182, 213, 225',
        '180': '213, 231, 238',
        '190': '229, 241, 245'
    },
    brand: {
        '10': '10, 8, 4',
        '20': '19, 16, 9',
        '30': '26, 22, 12',
        '40': '38, 32, 18',
        '50': '54, 46, 25',
        '60': '73, 62, 34',
        '70': '85, 72, 40',
        '80': '99, 84, 47',
        '90': '118, 100, 56',
        '100': '137, 116, 65',
        '110': '150, 127, 71',
        '120': '162, 137, 76',
        '130': '175, 149, 83',
        '140': '190, 162, 90',
        '150': '206, 176, 97',
        '160': '226, 192, 107',
        '170': '240, 204, 114',
        '180': '247, 226, 176',
        '190': '250, 238, 209'
    }
};
const overlay = {
    hover: rgba(colorSchemeVars.palette.neutral['200'], 0.08),
    active: rgba(colorSchemeVars.palette.neutral['200'], 0.12),
    dangerHover: rgba(colorSchemeVars.palette.danger['60'], 0.32),
    dangerActive: rgba(colorSchemeVars.palette.danger['60'], 0.2),
    scrim: rgba(colorSchemeVars.palette.neutral['0'], 0.4),
    inverseHover: rgba(colorSchemeVars.palette.neutral['20'], 0.08),
    inverseActive: rgba(colorSchemeVars.palette.neutral['20'], 0.16)
};
const pageBackground = {
    neutral0: rgb(colorSchemeVars.palette.neutral['50']),
    neutral10: rgb(colorSchemeVars.palette.neutral['40']),
    neutral20: rgb(colorSchemeVars.palette.neutral['30']),
    neutral30: rgb(colorSchemeVars.palette.neutral['20']),
    neutral40: rgb(colorSchemeVars.palette.neutral['10'])
};
const surface = {
    neutral0: rgb(colorSchemeVars.palette.neutral['50']),
    neutral10: rgb(colorSchemeVars.palette.neutral['40']),
    neutral20: rgb(colorSchemeVars.palette.neutral['30']),
    neutral30: rgb(colorSchemeVars.palette.neutral['20']),
    selected: rgb(colorSchemeVars.palette.brand['70']),
    disabled: rgba(colorSchemeVars.palette.neutral['200'], 0.04),
    popup: rgb(colorSchemeVars.palette.neutral['50']),
    neutral: {
        low: rgb(colorSchemeVars.palette.neutral['40']),
        subtle: rgba(colorSchemeVars.palette.neutral['200'], 0.16),
        strong: rgb(colorSchemeVars.palette.neutral['120'])
    },
    success: {
        low: rgb(colorSchemeVars.palette.success['40']),
        subtle: rgba(colorSchemeVars.palette.success['80'], 0.76),
        strong: rgb(colorSchemeVars.palette.success['130'])
    },
    info: {
        low: rgb(colorSchemeVars.palette.info['40']),
        subtle: rgba(colorSchemeVars.palette.info['80'], 0.76),
        strong: rgb(colorSchemeVars.palette.info['130'])
    },
    warning: {
        low: rgb(colorSchemeVars.palette.warning['40']),
        subtle: rgba(colorSchemeVars.palette.warning['80'], 0.76),
        strong: rgb(colorSchemeVars.palette.warning['150'])
    },
    danger: {
        low: rgb(colorSchemeVars.palette.danger['40']),
        subtle: rgba(colorSchemeVars.palette.danger['80'], 0.76),
        strong: rgb(colorSchemeVars.palette.danger['130'])
    }
};
const border = {
    enabled: rgba(colorSchemeVars.palette.neutral['200'], 0.5),
    disabled: rgba(colorSchemeVars.palette.neutral['200'], 0.2),
    divider: rgba(colorSchemeVars.palette.neutral['200'], 0.12),
    selected: rgb(colorSchemeVars.palette.brand['170']),
    dropLine: rgb(colorSchemeVars.palette.brand['170']),
    selectedNeutral: rgb(colorSchemeVars.palette.neutral['200']),
    warning: rgb(colorSchemeVars.palette.warning['120']),
    danger: rgb(colorSchemeVars.palette.danger['120']),
    keyboardFocus: rgb(colorSchemeVars.palette.neutral['200'])
};
const boxshadow = {
    shadowcolor: colorSchemeVars.palette.neutral['0']
};
const textIcon = {
    primary: rgb(colorSchemeVars.palette.neutral['200']),
    secondary: rgba(colorSchemeVars.palette.neutral['200'], 0.7),
    disabled: rgba(colorSchemeVars.palette.neutral['200'], 0.4),
    inverse: rgb(colorSchemeVars.palette.neutral['10']),
    link: rgb(colorSchemeVars.palette.brand['170']),
    success: rgb(colorSchemeVars.palette.success['130']),
    info: rgb(colorSchemeVars.palette.info['130']),
    warning: rgb(colorSchemeVars.palette.warning['150']),
    danger: rgb(colorSchemeVars.palette.danger['130']),
    onColor: rgb(colorSchemeVars.palette.neutral['200'])
};
const textfield = {
    surface: {
        enabled: colorSchemeVars.surface.neutral20
    },
    border: {
        enabled: colorSchemeVars.border.enabled
    }
};
const collection = {
    header: {
        text: rgb(colorSchemeVars.textIcon.primary),
        surface: {
            selected: rgba(colorSchemeVars.palette.neutral['200'], 0.12),
            partialSelected: rgba(colorSchemeVars.palette.neutral['200'], 0.04)
        }
    }
};
const collectionGrid = {
    cell: {
        surfaceEdit: rgb(colorSchemeVars.palette.neutral['0'])
    }
};
const measure = {
    track: {
        enabled: rgba(colorSchemeVars.palette.neutral['200'], 0.16),
        disabled: rgba(colorSchemeVars.palette.neutral['200'], 0.16)
    },
    fill: {
        enabled: rgb(colorSchemeVars.palette.neutral['200']),
        disabled: rgba(colorSchemeVars.palette.neutral['200'], 0.3)
    },
    thumb: {
        surface: fallbackVar(globalVars.currentBackgroundColor, colorSchemeVars.palette.neutral['0'])
    },
    reference: {
        line: rgba(colorSchemeVars.palette.neutral['200'], 0.8),
        lineContrast: rgba(colorSchemeVars.palette.neutral['20'], 0.7),
        area: rgba(colorSchemeVars.palette.neutral['200'], 0.08)
    }
};
const dvt = {
    contrastLine: rgb(colorSchemeVars.palette.neutral['20']),
    paletteQualitative: {
        '1': '87, 184, 194',
        '2': '175, 97, 9',
        '3': '40, 129, 126',
        '4': '206, 195, 186',
        '5': '78, 124, 70',
        '6': '170, 95, 113',
        '7': '226, 160, 126',
        '8': '130, 91, 189',
        '9': '184, 156, 0',
        '10': '214, 191, 227',
        '11': '62, 115, 137',
        '12': '66, 164, 92'
    },
    threshold: {
        success: rgb(colorSchemeVars.palette.success['100']),
        warning: 'rgb(207, 124, 0)',
        danger: rgb(colorSchemeVars.palette.danger['100'])
    },
    marquee: {
        border: rgba(colorSchemeVars.palette.neutral['190'], 0.8),
        surface: rgba(colorSchemeVars.palette.neutral['20'], 0.1)
    },
    referenceObject: {
        area: rgba(colorSchemeVars.palette.neutral['170'], 0.08),
        line: rgba(colorSchemeVars.palette.neutral['190'], 0.8)
    },
    overview: {
        background: rgb(colorSchemeVars.palette.neutral['50']),
        windowBackground: rgb(colorSchemeVars.palette.neutral['0']),
        windowBorder: rgb(colorSchemeVars.palette.neutral['170'])
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

export { colorScheme };
//# sourceMappingURL=theme.dark.tokens.js.map
