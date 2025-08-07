import { Coords } from '../../UNSAFE_Floating';
type ContextMenuEventDetail = ({
    gesture: 'mouse' | 'touch';
    anchor: Coords;
} | {
    gesture: 'keyboard';
    anchor: Element;
}) & {
    currentTarget: Element;
    target: Element;
};
type ContextMenuHandler = (detail: ContextMenuEventDetail) => void;
type ContextMenuOptions = {
    isDisabled?: boolean;
};
/**
 * `useContextMenuGesture` hook to handle contextMenuGesture. Pure onContextMenu event is not enough to handle this since:
   1.- onContextMenu event is not supported on mobile safari.
   2.- onContextMenu can't be triggered using keyboard natively on Mac

   What event is running depends on the gesture:
   -> Mouse
      We use native onContextMenu event to support it. Nothing fancy about it, prevent default event to suppress the default browser context menu.
   -> Keyboard
      We rely on onKeyDown event, since mac doesn't run onContextMenu when pressing Shift-F10. We preventDefault
      if Shift-F10 is pressed so onContextMenu native event is not run in platforms that support it.
   -> Touching
      This is platform specific.
      On machines that supports onContextMenu event and also touching (android, hybrid laptops) the native context menu
      is used.
      On platforms where onContextMenu doesn't exist(IOS), the steps are the next:
      1.- We check if only one finger was used and also if the platform is IOS.
      2.- If there is a touch move we clear the timeout.
      3.- If user doesn't move its finger and user holds enough we trigger contextMenu handler.
      4.- We clearTimeout on touchEnd.
 *
 */
export declare const useContextMenuGesture: (onContextMenuHandler: ContextMenuHandler, contextMenuOptions?: ContextMenuOptions) => {
    triggerProps: Record<string, any>;
};
export {};
