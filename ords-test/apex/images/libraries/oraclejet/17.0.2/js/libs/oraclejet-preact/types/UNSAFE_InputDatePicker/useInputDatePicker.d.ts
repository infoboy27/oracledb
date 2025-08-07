/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { ComponentProps, RefObject } from 'preact';
import type { CalendarDate } from "../utils/UNSAFE_calendarDateUtils";
import { CloseDetail } from './InputDatePickerDropdown';
import { InputDatePicker } from './InputDatePicker';
import type { ValueUpdateDetail } from "../utils/UNSAFE_valueUpdateDetail";
type InputDatePickerProps = ComponentProps<typeof InputDatePicker>;
type Props = {
    onCommit: InputDatePickerProps['onCommit'];
    onInput: InputDatePickerProps['onInput'];
    value: InputDatePickerProps['value'];
};
/**
 * Hook that provides handlers and other functionality for InputDatePicker.
 */
declare const useInputDatePicker: ({ onCommit, onInput, value: currentValue }: Props) => {
    calendarIconActionHandler: () => void | null;
    datePickerCommitHandler: (detail: ValueUpdateDetail<Required<CalendarDate>>) => void;
    dropdownCloseHandler: (detail: CloseDetail) => void;
    completeDateValue: Required<CalendarDate> | undefined;
    dateValue: CalendarDate | undefined;
    iconRef: RefObject<HTMLButtonElement>;
    isOpen: boolean;
    maskCommitHandler: (detail: ValueUpdateDetail<CalendarDate>) => void;
    maskInputHandler: (detail: ValueUpdateDetail<CalendarDate>) => void;
    maskRef: RefObject<HTMLElement>;
};
export { useInputDatePicker };
