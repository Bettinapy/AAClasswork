import React from "react";
import { Provider } from "react-redux";
import { HashRouter } from "react-router-dom";
import App from "./App";

const Root = ({ store }) => {
    // {store} = {store: store\ } why {store?}
    debugger
    return(
        <Provider store={store}>
            <HashRouter>
                <App />
            </HashRouter>
        </Provider>
    )   
};

export default Root;