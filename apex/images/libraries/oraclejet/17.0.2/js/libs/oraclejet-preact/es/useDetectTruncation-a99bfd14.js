/* @oracle/oraclejet-preact: undefined */
import { u as useResizeObserver } from './useResizeObserver-260ee12b.js';
import { useRef, useState, useCallback } from 'preact/hooks';

const useDetectTruncation = () => {
    const rootRef = useRef(null);
    const [isTextTruncated, setIsTextTruncated] = useState(false);
    const detectTruncation = useCallback(() => {
        if (rootRef.current) {
            setIsTextTruncated(rootRef.current.scrollWidth > rootRef.current.offsetWidth);
        }
    }, []);
    useResizeObserver(rootRef, detectTruncation);
    const detectTruncationProps = {
        ref: rootRef
    };
    return { detectTruncationProps, isTextTruncated };
};

export { useDetectTruncation as u };
//# sourceMappingURL=useDetectTruncation-a99bfd14.js.map
