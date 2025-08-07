/* @oracle/oraclejet-preact: undefined */
import { useRef, useCallback, useEffect } from 'preact/hooks';
import { g as getClientHints } from './clientHints-c76a913b.js';
import { g as getIsSelectionPending } from './textSelectionUtils-a6554a42.js';

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
const useContextMenuGesture = (onContextMenuHandler, contextMenuOptions = {
    isDisabled: false
}) => {
    const isIos = getClientHints().platform === 'ios';
    /*Use this ref to avoid triggering contextMenuHandler twice. This could happen due to Shift-F10 combination of keys.
     On firefox preventDefault inside keyDown event does not prevent contextMenu native event to be triggered. That's why
     we use this ref instead. */
    const ignoreNativeContextMenuEvent = useRef(false);
    //Info that we need to track when handling context menu for ios
    const iosAdditionalInfo = useRef({});
    // We track if there is any selection pending so we don't trigger the context menu if that's the case
    const isSelectionPending = useRef(false);
    // TODO: We need to confirm if this type is correct or has to be changed. JET-59244
    const timerId = useRef();
    const getIsSelectionPending$1 = useCallback(() => {
        if (isSelectionPending.current) {
            return true;
        }
        return getIsSelectionPending();
    }, []);
    const resetUserSelect = useCallback(() => {
        document.body.style.userSelect = iosAdditionalInfo.current.bodyUserSelectValue;
        // Implemented with the vendor prefix: -webkit- on safari
        document.body.style.webkitUserSelect = iosAdditionalInfo.current
            .webkitBodyUserSelectValue;
        iosAdditionalInfo.current.iosOpenedContextMenu = false;
    }, []);
    useEffect(() => {
        const onSelectionChange = () => {
            const { timeNeededForSelection, iosStartTime } = iosAdditionalInfo.current;
            if (iosStartTime && !timeNeededForSelection && document.getSelection()?.type === 'Range') {
                clearTimeout(timerId.current);
                iosAdditionalInfo.current.timeNeededForSelection = Date.now() - iosStartTime;
                iosAdditionalInfo.current.launchIosContextMenu?.(PRESS_HOLD_TIME);
            }
        };
        const onSelectStart = (event) => {
            if ((event?.target).nodeName === '#text') {
                isSelectionPending.current = true;
                // we want to reset isSelectionPending if we don't get a contextmenu event. 10ms seems to be enough time tweak as needed.
                setTimeout(() => {
                    isSelectionPending.current = false;
                }, 10);
            }
            else {
                isSelectionPending.current = false;
            }
        };
        if (isIos) {
            document.addEventListener('selectionchange', onSelectionChange, true);
        }
        else {
            document.addEventListener('selectstart', onSelectStart, true);
        }
        return () => {
            document.removeEventListener('selectionchange', onSelectionChange, true);
            document.removeEventListener('selectstart', onSelectStart, true);
        };
    }, [isIos]);
    const onContextMenu = useCallback((event) => {
        if (!getIsSelectionPending$1()) {
            //Prevent default so we don't open browser context menu
            event.preventDefault();
            if (ignoreNativeContextMenuEvent.current) {
                ignoreNativeContextMenuEvent.current = false;
            }
            else {
                onContextMenuHandler({
                    /*Pointer type can be touch/pen/mouse if its touch we passed touch if any other value we consider it a mouse
                    gesture */
                    gesture: event.pointerType === 'touch' ? 'touch' : 'mouse',
                    anchor: {
                        x: event.clientX,
                        y: event.clientY,
                        contextElement: event.currentTarget
                    },
                    currentTarget: event.currentTarget,
                    target: event.target
                });
            }
        }
    }, [onContextMenuHandler, getIsSelectionPending$1]);
    const onKeyDown = useCallback((event) => {
        if (!getIsSelectionPending$1()) {
            if (event.key === 'F10' && event.shiftKey) {
                ignoreNativeContextMenuEvent.current = true;
                const currentTarget = event.currentTarget;
                onContextMenuHandler({
                    gesture: 'keyboard',
                    anchor: currentTarget,
                    currentTarget,
                    target: event.target
                });
            }
        }
    }, [onContextMenuHandler, getIsSelectionPending$1]);
    const onTouchStart = useCallback((event) => {
        //We check if the touch was using a single finger
        if (event.touches.length === 1) {
            const timeNeededForSelection = iosAdditionalInfo.current.timeNeededForSelection;
            // By default delay to launch context menu is 1500 ms
            let delay = PRESS_HOLD_TIME * 2;
            if (timeNeededForSelection === undefined) {
                // We get start time to get timeNeeded for selection inside selection change event
                iosAdditionalInfo.current.iosStartTime = Date.now();
            }
            else {
                // If timeNeededForSelection was already obtained we use that time + press hold time
                delay = timeNeededForSelection + PRESS_HOLD_TIME;
            }
            const touchobj = event.touches[0];
            iosAdditionalInfo.current.touchPageCoords = { x: touchobj.pageX, y: touchobj.pageY };
            //According to mozilla docs: "The value of event.currentTarget is only available while the event is being handled"
            //Due to this we need to save this element on a const
            const currentTarget = event.currentTarget;
            const launchIosContextMenu = (delay) => {
                timerId.current = setTimeout(() => {
                    iosAdditionalInfo.current.bodyUserSelectValue = document.body.style.userSelect;
                    iosAdditionalInfo.current.webkitBodyUserSelectValue =
                        document.body.style.webkitUserSelect;
                    //We have to clean selections and don't permit any until a touchEnd/touchCancel
                    document.body.style.userSelect = 'none';
                    document.body.style.webkitUserSelect = 'none';
                    document.getSelection()?.empty();
                    iosAdditionalInfo.current.iosOpenedContextMenu = true;
                    onContextMenuHandler({
                        gesture: 'touch',
                        anchor: { x: touchobj.clientX, y: touchobj.clientY, contextElement: currentTarget },
                        currentTarget: currentTarget,
                        target: event.target
                    });
                }, delay);
            };
            iosAdditionalInfo.current.launchIosContextMenu = launchIosContextMenu;
            launchIosContextMenu(delay);
        }
    }, [onContextMenuHandler]);
    const onTouchMove = useCallback((e) => {
        const firstTouch = e.touches[0];
        if (Math.abs(iosAdditionalInfo.current.touchPageCoords?.x - firstTouch.pageX) >
            MAX_ALLOWED_MOVEMENT ||
            Math.abs(iosAdditionalInfo.current.touchPageCoords?.y - firstTouch.pageY) >
                MAX_ALLOWED_MOVEMENT) {
            clearTimeout(timerId.current);
        }
    }, []);
    const onTouchEnd = useCallback((e) => {
        clearTimeout(timerId.current);
        if (iosAdditionalInfo.current.iosOpenedContextMenu) {
            //Prevent default so we don't open browser context menu
            e.preventDefault();
            // 500 comes from testing behavior on real devices, seems like enough time to allow user to lift finger. UX approved.
            setTimeout(() => {
                resetUserSelect();
            }, 500);
        }
    }, [resetUserSelect]);
    const onTouchCancel = useCallback(() => {
        clearTimeout(timerId.current);
        if (iosAdditionalInfo.current.iosOpenedContextMenu) {
            resetUserSelect();
        }
    }, [resetUserSelect]);
    const triggerProps = contextMenuOptions.isDisabled
        ? {}
        : {
            onContextMenu,
            onKeyDown,
            ...{
                ...(isIos ? { onTouchStart, onTouchMove, onTouchEnd, onTouchCancel } : {})
            }
        };
    return { triggerProps };
};
//Time needed to hold touch to be considered context menu triggering
const PRESS_HOLD_TIME = 750;
const MAX_ALLOWED_MOVEMENT = 5;

export { useContextMenuGesture as u };
//# sourceMappingURL=useContextMenuGesture-e8f99ce3.js.map
