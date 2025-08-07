/* @oracle/oraclejet-preact: undefined */
/**
 * Utility function that mocks the `FontFaceSet` interface of the document.
 * This is returned by 'document.fonts'.
 */
const setupDocumentFontsMock = () => {
    // document.fonts isn't available in test environment
    Object.defineProperty(global.document, 'fonts', {
        writable: true,
        configurable: true,
        value: {
            ready: Promise.resolve()
        }
    });
};
/**
 * Utility function that mocks the `FontFaceSet` interface of the document.
 * This is returned by 'document.fonts'.
 *
 * TODO: See if we can avoid passing the SVGElement reference.
 * For whatever reason, global.SVGElement is not defined until test runtime (global.HTMLElement is available though).
 */
const setupSVGTextElementMethodsMock = (SVGElement) => {
    SVGElement.prototype.getBBox = jest.fn().mockReturnValue({
        x: 0,
        y: -15,
        width: 18,
        height: 18
    });
};
/**
 * Utility function that mocks the dependencies of the useTextDimensions hook.
 *
 * Recommended to execute inside `beforeEach` of tests of components that consume useTextDimensions.
 * @param window The window object at test runtime.
 */
const setupUseTextDimensionsDependenciesMock = (window) => {
    if (!window.document.fonts) {
        setupDocumentFontsMock();
    }
    // If headless, SVGTextElement is not defined and all svg elements are
    // instances of SVGElement
    if (!window.SVGTextElement) {
        setupSVGTextElementMethodsMock(window.SVGElement);
    }
};

export { setupUseTextDimensionsDependenciesMock as s };
//# sourceMappingURL=mockUseTextDimensionsDependencies-83fdfb98.js.map
