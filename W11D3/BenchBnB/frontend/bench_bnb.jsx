import React from 'react';
import ReactDOM from "react-dom";
import Root from './components/root';
//import { signUp, logIn, logOut } from './util/session_api_util';
//import {fetchBenches} from './util/bench_api_util';
import configureStore from './store/store'
import{fetchAllBenches} from './actions/bench_actions'

document.addEventListener("DOMContentLoaded", () => {
  debugger
  // window.signUp = signUp;
  // window.logIn = logIn;
  // window.logOut = logOut;
  // const store = configureStore();
  window.fetchAllBenches = fetchAllBenches;
  // keep the log in status after refreshing the page
  let store;
  if (window.currentUser) {
    const preloadedState = {
      entities: {
        users: { [window.currentUser.id]: window.currentUser }
      },
      session: { id: window.currentUser.id }
    };
    store = configureStore(preloadedState);
    delete window.currentUser;
  } else {
    store = configureStore();
  }
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  const root = document.getElementById("root");
  
  debugger
  ReactDOM.render(<Root store={store}/>, root);
});