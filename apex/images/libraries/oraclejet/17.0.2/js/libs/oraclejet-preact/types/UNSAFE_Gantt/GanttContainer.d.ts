/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { Ref } from 'preact/hooks';
import { HTMLAttributesSignalExcluded } from '../utils/UNSAFE_attributeUtils';
import { Size } from '../utils/UNSAFE_size';
import { type TestIdProps } from '../hooks/UNSAFE_useTestId';
type IntrinsicProps = HTMLAttributesSignalExcluded<HTMLDivElement>;
type Props = IntrinsicProps & TestIdProps & {
    innerRef: Ref<HTMLDivElement>;
    width?: Size;
    height?: Size;
};
export declare function GanttContainer({ innerRef, width, height, testId, children, ...otherProps }: Props): import("preact").JSX.Element;
export {};
