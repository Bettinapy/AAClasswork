import React from "react";
import GreetingContainer from './greeting/greeting_container';
import SignupFormContainer from './session_form/signup_form_container';
import LoginFormContainer from './session_form/login_form_container';
import { Route } from 'react-router-dom';
import {AuthRoute} from '../util/route_util';
import BenchIndexContainer from './bench_index_container';
import SearchContainer from './bench_map/search_container';
const App = () => {
    debugger
    return(
    <div>
        <header>
            <h1>Bench BnB</h1>
            <GreetingContainer />
        </header>
            <AuthRoute exact path="/login" component={LoginFormContainer} />
            <AuthRoute exact path="/signup" component={SignupFormContainer} />
            <Route exact path="/" component={SearchContainer} />
    </div>
    )
};

export default App;