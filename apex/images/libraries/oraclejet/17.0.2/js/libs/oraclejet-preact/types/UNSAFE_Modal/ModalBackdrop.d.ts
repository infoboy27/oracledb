import { HTMLAttributesSignalExcluded } from '../utils/UNSAFE_attributeUtils';
type IntrinsicProps = Pick<HTMLAttributesSignalExcluded<HTMLDivElement>, 'children'>;
type Props = IntrinsicProps & {
    /**
     * Specifies the backdrop is visible or transparent. Default is 'scrim' (visible).
     */
    variant?: 'scrim' | 'transparent';
};
declare const ModalBackdrop: import("preact").FunctionalComponent<import("preact/compat").PropsWithoutRef<Props> & {
    ref?: import("preact").Ref<HTMLDivElement> | undefined;
}>;
export default ModalBackdrop;
