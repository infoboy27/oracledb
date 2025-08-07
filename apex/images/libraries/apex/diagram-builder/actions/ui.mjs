import { sanitize } from '../utils/text.mjs';

const { ui } = joint;

export function showToast(msg, opt = {}) {
    const {
        width,
        closeButton = false,
        duration = 2000,
        target,
        foregroundContainerCls
    } = opt;
    const openAnimation = {
        duration: 0
    };
    const closeAnimation = {
        delay: duration,
        duration: 200,
        properties: {
            opacity: 0
        }
    };

    msg = sanitize(msg);

    ui.FlashMessage.close();
    const toast = new ui.FlashMessage({
        openAnimation,
        closeAnimation,
        closeButton,
        width,
        content: msg
    });
    toast.open(target);

    if (foregroundContainerCls?.length) {
        const cls = Array.isArray(foregroundContainerCls) ? foregroundContainerCls : foregroundContainerCls.split(' ');
        toast.el.querySelector('.fg').classList.add(...cls);
    }
}