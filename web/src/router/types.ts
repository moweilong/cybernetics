import React, { type JSX } from "react";
import type { RouteProps } from "react-router-dom";
import { pageList } from "src/pages";
import { MenuIconType, ACTION_DICT } from "src/static";
import { NAME } from "./name"

// 详情数据
export type RouteItem = RouteProps & ExtendRouteConfig

export type ROUTE_ID_KEY = keyof typeof NAME

export interface ExtendRouteConfig {
    id?: ROUTE_ID_KEY;// 节点id
    parentId?: ROUTE_ID_KEY;// 父节点id
    isMenu?: boolean;// 是否为菜单
    isTab?: boolean;// 是否为tab
    isPublish?: boolean;// 是否发布
    isNoAuth?: boolean;// 是否无权限
    depends?: ROUTE_ID_KEY[];// 依赖的节点id
    meta?: {
        title?: string;// 菜单名称
        icon?: MenuIconType;// 图标
    },
    children?: RouteItem[];// 子节点
    component?: keyof typeof pageList;// 路由组件
    page?: React.LazyExoticComponent<(props: unknown) => JSX.Element>;// 页面组件
    actionPermissions?: (keyof typeof ACTION_DICT)[];// 权限点
    keepAlive?: boolean;// 缓存页面
    segment?: string;// 路由分割符
}

// 结构数据
export interface RoutesStructDataItem {
    id: ROUTE_ID_KEY;
    children?: RoutesStructDataItem[];
}