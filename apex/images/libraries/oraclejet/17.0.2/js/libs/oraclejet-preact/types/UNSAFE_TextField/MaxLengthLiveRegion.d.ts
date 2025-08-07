import { TestIdProps } from "../hooks/UNSAFE_useTestId";
type Props = TestIdProps & {
    maxLength: number;
    valueLength?: number;
};
export declare function MaxLengthLiveRegion({ maxLength, testId, valueLength }: Props): import("preact").JSX.Element;
export {};
