/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
import { JSX } from 'preact';
/**
 * A type that filters JSX.SignalLike<any> type from the given type
 */
export type ExcludeSignalLike<Type> = {
    [Property in keyof Type]: JSX.UnpackSignal<Type[Property]>;
};
/**
 * A set of JSX.HTMLAttributes without SignalLike<any> type
 */
export type HTMLAttributesSignalExcluded<RefType extends EventTarget = EventTarget> = ExcludeSignalLike<JSX.HTMLAttributes<RefType>>;
/**
 * A set of JSX.AriaAttributes without SignalLike<any> type
 */
export type AriaAttributesSignalExcluded = ExcludeSignalLike<JSX.AriaAttributes>;
