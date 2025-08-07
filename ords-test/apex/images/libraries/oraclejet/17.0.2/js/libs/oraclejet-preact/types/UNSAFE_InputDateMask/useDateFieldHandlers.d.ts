/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { ComponentProps } from 'preact';
import { Dispatch, MutableRef, Ref } from 'preact/hooks';
import { DateFieldAction } from './dateReducer';
import { DateFieldState } from './useDateField';
import { CalendarDate } from './types';
import { InputDateMask } from './InputDateMask';
type InputDateMaskProps = ComponentProps<typeof InputDateMask>;
type Props = {
    dateResetRef: MutableRef<boolean>;
    direction: 'ltr' | 'rtl';
    dispatch: Dispatch<DateFieldAction>;
    groupRef?: Ref<HTMLDivElement>;
    isDisabled?: boolean;
    isFocused?: boolean;
    isInputFocused?: boolean;
    onCommit: InputDateMaskProps['onCommit'];
    onInput: InputDateMaskProps['onInput'];
    state: DateFieldState;
    value?: CalendarDate;
};
/**
 * A hook that creates various handlers and manages effects for a DateField.
 */
declare const useDateFieldHandlers: ({ dateResetRef, direction, dispatch, groupRef, isDisabled, isFocused, isInputFocused, onCommit, onInput, state, value: currentValue }: Props) => {
    dateClearedRef: MutableRef<boolean>;
    dateFieldHandlers: {};
    segmentHandlers: {
        onChange?: undefined;
    } | {
        onChange: (action: DateFieldAction) => void;
    };
    tabIndex: number;
};
export { useDateFieldHandlers };
