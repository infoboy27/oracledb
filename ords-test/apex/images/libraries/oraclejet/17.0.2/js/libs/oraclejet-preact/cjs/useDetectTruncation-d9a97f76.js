/* @oracle/oraclejet-preact: undefined */
'use strict';

var useResizeObserver = require('./useResizeObserver-819b1236.js');
var hooks = require('preact/hooks');

const useDetectTruncation = () => {
    const rootRef = hooks.useRef(null);
    const [isTextTruncated, setIsTextTruncated] = hooks.useState(false);
    const detectTruncation = hooks.useCallback(() => {
        if (rootRef.current) {
            setIsTextTruncated(rootRef.current.scrollWidth > rootRef.current.offsetWidth);
        }
    }, []);
    useResizeObserver.useResizeObserver(rootRef, detectTruncation);
    const detectTruncationProps = {
        ref: rootRef
    };
    return { detectTruncationProps, isTextTruncated };
};

exports.useDetectTruncation = useDetectTruncation;
//# sourceMappingURL=useDetectTruncation-d9a97f76.js.map
