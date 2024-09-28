import { type RouterProps } from "react-router-dom";

const RouterProvider = (
    props: Omit<RouterProps, "location" | "navigationType" | "navigator">
) => {
    const { language } = useFlat("appStore");
}