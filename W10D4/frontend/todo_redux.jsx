import store from './store/store';
import { receiveTodo, receiveTodos } from './actions/todo_actions';
import React from 'react';
import ReactDOM from 'react-dom';
import Root from "./components/root"
import {allTodos} from "./reducers/selectors"

debugger
document.addEventListener("DOMContentLoaded", ()=>{
    const root = document.getElementById("root");
    window.store = store;
    window.receiveTodos = receiveTodos;
    window.receiveTodo = receiveTodo;
    window.allTodos = allTodos; 
    ReactDOM.render(<Root store = {store} />, root);
})