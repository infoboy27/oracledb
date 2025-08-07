/* eslint-disable no-console */
import { readFile, rm, writeFile } from "node:fs/promises";
import path from "node:path";
import { fileURLToPath } from "node:url";
import requirejs from "requirejs";

// Get the current directory name (images/libraries/apex)
const __dirname = fileURLToPath(new URL('.', import.meta.url));
const librariesPath = path.dirname(__dirname);
const tempDir = path.join(__dirname, "tempBundle");
const minDir = path.join(__dirname, "minified");

const deps = JSON.parse(await readFile("package.json", "utf8")).dependencies;
const ojVersion = deps["@apexthirdparty/oraclejet"];

const jetCommonBundleName = "jetCommonBundle.min";
const chartBundle = "chartBundle.min";

const config = {
    dir: tempDir,            // this is a temporary directory, deleted once bundling is done
    baseUrl: __dirname,
    skipDirOptimize: true,  // do not minify other files
    optimize: "none",       // we don't want to minify, because the files are already minified
    removeCombined: true,   // remove files that were combined
    paths: {                // the paths have to stay in sync with the paths from requirejs.jetConfig.js
                            // Note: "jetChart" must be included here, although it is absent from requirejs.jetConfig.js
        "@oracle/oraclejet-preact": `${librariesPath}/oraclejet/${ojVersion}/js/libs/oraclejet-preact/amd`,
        "css-builder":              `${librariesPath}/oraclejet/${ojVersion}/js/libs/require-css/css-builder`,
        "css":                      `${librariesPath}/oraclejet/${ojVersion}/js/libs/require-css/css.min`,
        "hammerjs":                 `empty:`,   // excludes it from bundling
        "jetChart":                 `${minDir}/widget.jetChart.min`,
        "jquery":                   `empty:`,   // excludes it from bundling
        "jqueryui-amd":             `empty:`,   // excludes it from bundling
        "knockout":                 `${librariesPath}/oraclejet/${ojVersion}/js/libs/knockout/knockout-3.5.1`,
        "normalize":                `${librariesPath}/oraclejet/${ojVersion}/js/libs/require-css/normalize`,
        "ojdnd":                    `${librariesPath}/oraclejet/${ojVersion}/js/libs/dnd-polyfill/dnd-polyfill-1.0.2.min`,
        "ojL10n":                   `${librariesPath}/oraclejet/${ojVersion}/js/libs/oj/${ojVersion}/ojL10n`,
        "ojs":                      `${librariesPath}/oraclejet/${ojVersion}/js/libs/oj/${ojVersion}/min`,
        "ojtranslations":           `${librariesPath}/oraclejet/${ojVersion}/js/libs/oj/${ojVersion}/resources`,
        "preact":                   `${librariesPath}/oraclejet/${ojVersion}/js/libs/preact/dist/preact.umd`,
        "preact/compat":            `${librariesPath}/oraclejet/${ojVersion}/js/libs/preact/compat/dist/compat.umd`,
        "preact/hooks":             `${librariesPath}/oraclejet/${ojVersion}/js/libs/preact/hooks/dist/hooks.umd`,
        "preact/jsx-runtime":       `${librariesPath}/oraclejet/${ojVersion}/js/libs/preact/jsx-runtime/dist/jsxRuntime.umd`,
        "proj4":                    `${librariesPath}/oraclejet/${ojVersion}/js/libs/proj4js/dist/proj4`,
        "signals":                  `${librariesPath}/oraclejet/${ojVersion}/js/libs/js-signals/signals.min`,
        "text":                     `${librariesPath}/oraclejet/${ojVersion}/js/libs/require/text`,
        "touchr":                   `${librariesPath}/oraclejet/${ojVersion}/js/libs/touchr/touchr`,
    },
    modules: [
        {
            name: jetCommonBundleName,
            create: true,
            include: [
                "ojs/ojcomponentcore",
                "ojs/ojvalidator-required",
                "ojs/ojconverterutils",
                "ojs/ojanimation",
                "ojs/ojvcomponent",
                "ojs/ojjquery-hammer",
                "ojs/ojpopupcore",
                "ojs/ojpopup",
                "ojs/ojlabel",
                "ojs/ojlabelledbyutils",
                "ojs/ojkeysetimpl"
            ]
        },
        {
            name: chartBundle,
            create: true,
            include: [
                "jetChart"
            ],
            exclude: [
                jetCommonBundleName
            ]
        }
    ],
};

console.log( "Creating RequireJS bundles...");

// cleanup tempDir before creating the bundle
await rm(tempDir, { recursive: true, force: true });

// copy a bundle from the temp directory, remove sourcemaps and write it to the minified directory
async function copyBundle(bundleName) {
    let content = await readFile(path.resolve(tempDir, `${bundleName}.js`), 'utf8');
    content = content.replace(/^.*\/\/# sourceMappingURL=.+\.map.*\r?\n/gm, '');
    await writeFile(path.resolve(minDir, `${bundleName}.js`), content, 'utf8');
    console.log(`${bundleName}.js created`);
}

// create the requirejs bundles
requirejs.optimize(config, async () => {
    // Move bundles to correct directory
    await copyBundle(jetCommonBundleName);
    await copyBundle(chartBundle);

    // Remove tempDir after bundling
    await rm(tempDir, { recursive: true, force: true });
}, console.error );
