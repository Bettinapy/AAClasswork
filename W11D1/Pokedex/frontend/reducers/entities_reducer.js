import { combineReducers } from 'redux';
import pokemonReducer from './pokemon_reducer';

// debugger
const entitiesReducer = combineReducers({
  pokemon: pokemonReducer,
})

export default entitiesReducer;