import React from 'react';
import ReactDOM from 'react-dom';
import { fetchAllPokemon } from './util/api_util';
import { receiveAllPokemon, requestAllPokemon } from './actions/pokemon_actions';
import configureStore from './store/store';
import { selectAllPokemon } from './reducers/selectors';
import Root from './components/root';
import { HashRouter, Route } from "react-router-dom";

document.addEventListener('DOMContentLoaded', ()=> {
    window.fetchAllPokemon = fetchAllPokemon;
    window.receiveAllPokemon = receiveAllPokemon;
    window.requestAllPokemon = requestAllPokemon;
    window.selectAllPokemon = selectAllPokemon;

    debugger
    const store = configureStore();
    window.getState = store.getState;
    window.dispatch = store.dispatch;

    const root = document.getElementById('root');
    // ReactDOM.render(<h1>Pokedex</h1>, root);
    ReactDOM.render(<Root store={store}/>, root);
})