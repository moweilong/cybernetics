import { enumToObject } from "src/common/utils";

export enum NAME {
    HomePage,
    LoginPage,
}

export const ROUTE_NAME = { ...NAME };
export const ROUTE_ID = enumToObject(ROUTE_NAME);