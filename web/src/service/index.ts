import {
    createStoreE,
    flatInjectHookCreater,
    getActionTypeCreater,
    getDpChain,
} from "redux-eazy";
import { stores } from "./stores";


declare global {
    interface Window {
        reduxStore: ReturnType<typeof createStoreE<typeof stores>>;
    }
}

// 前置基本
export const getActionType = getActionTypeCreater(stores);

export const reduxStore =
    window.reduxStore ||
    createStoreE(stores, {
        middleware: {
            isLogger: false,
        },
    })
window.reduxStore = reduxStore;

// 后置
/* Hooks */
export const useFlat = flatInjectHookCreater(stores, reduxStore);
/* utils */
export const dpChain = getDpChain(reduxStore, stores);