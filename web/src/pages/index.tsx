import { lazy } from "react";

const HomePage = lazy(() => import("./HomePage"));

export const pageList = {
    HomePage,
    LoginPage,
}