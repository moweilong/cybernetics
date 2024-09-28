import { ROUTE_ID_KEY, RouteItem } from './types';

export const ROUTE_CONFIG_MAP: {
    [key in ROUTE_ID_KEY]: RouteItem;
} = {
    HomePage: {
        id: 'HomePage',
        meta: {
            title: 'common:HomePageTile',
        },
        component: "HomePage",
        actionPermissions: ["ADD", "EDIT"],
        isNoAuth: true,
        keepAlive: true,
        isTab: false,
    },
    LoginPage: {
        id: 'LoginPage',
        component: "LoginPage",
        isNoAuth: true,
        path: "/",
    },
};