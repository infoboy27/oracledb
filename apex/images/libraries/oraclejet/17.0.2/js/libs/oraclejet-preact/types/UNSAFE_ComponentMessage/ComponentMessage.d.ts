/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { type TestIdProps } from "../hooks/UNSAFE_useTestId";
/**
 * A type for a single component message
 */
export type ComponentMessageItem = {
    summary?: string;
    detail?: string;
    severity?: 'confirmation' | 'error' | 'info' | 'warning';
};
/**
 * Props for the Message Component
 */
type Props = TestIdProps & {
    /**
     * The error detail text for the component message
     */
    detail?: ComponentMessageItem['detail'];
    /**
     * The label of the field which is showing this error
     */
    fieldLabel?: string;
    /**
     * The severity of the component message
     */
    severity?: ComponentMessageItem['severity'];
};
/**
 * The component that renders an individual message for inline component messaging.
 */
export declare function ComponentMessage({ detail, fieldLabel, severity, testId }: Props): import("preact").JSX.Element;
export {};
