import {
    createBrowserRouter,
    RouterProvider,
} from "react-router-dom";
import NetworkMonitorPage from "./pages/network_monitor/NetworkMonitorPage.tsx";
import LoginPage from "./pages/login/LoginPage.tsx";
import React from "react";
import ErrorPage from "./pages/error/ErrorPage.tsx";
import {networkStatisticLoader} from "./pages/loaders/network_statistic_loader.ts";

const router = createBrowserRouter([
    {
        path: "/",
        element: <NetworkMonitorPage/>,
        errorElement: <ErrorPage />,
        loader: networkStatisticLoader
    },
    {
        path: "/login",
        element: <LoginPage/>,
        errorElement: <ErrorPage />,
    },
]);


function App() {
    return (
        <React.StrictMode>
            <RouterProvider router={router}/>
        </React.StrictMode>
    )
}

export default App
