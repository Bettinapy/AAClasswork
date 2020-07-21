import * as APIUtil from '../util/api_util';
export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const RECEIVE_SINGLE_POKEMON = 'RECEIVE_SINGLE_POKEMON';

export const receiveAllPokemon = pokemon => {
    debugger
    return {
        type: RECEIVE_ALL_POKEMON,
        pokemon
    }
};

export const receiveSinglePokemon = pokemon => {
    debugger
    return{
        type: RECEIVE_SINGLE_POKEMON,
        pokemon
    }
};

export const requestAllPokemon = () => (dispatch) => {
    debugger
    return (
        APIUtil.fetchAllPokemon()
        .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
        //dispatch the pojo 
    )
};

export const requestSinglePokemon = (id) => (dispatch) => {
    debugger
    return (
        APIUtil.fetchSinglePokemon(id)
        .then(pokemon => dispatch(receiveSinglePokemon(pokemon)))
        //dispatch the pojo 
    )
};
