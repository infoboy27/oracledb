import { HTMLAttributesSignalExcluded } from '../utils/UNSAFE_attributeUtils';
type IntrinsicProps = Pick<HTMLAttributesSignalExcluded<HTMLDivElement>, 'id' | 'children'>;
type HeaderProps = IntrinsicProps & {
    id: string;
    contentId: string;
    isDisabled: boolean;
    isExpanded: boolean;
    iconPosition?: 'start' | 'end';
    variant?: 'basic' | 'horizontal-rule';
    toggleHandler: (target: EventTarget | null) => void;
    accessibleLabel?: string;
    accessibleLabelId?: string;
};
/**
 * Header subcomponent
 */
export declare const CollapsibleHeader: ({ children, id, contentId, isDisabled, isExpanded, iconPosition, variant, toggleHandler, accessibleLabel, accessibleLabelId }: HeaderProps) => import("preact").JSX.Element;
export {};
