import { combineReducers } from 'redux';
import entitiesReducer from './entities_reducer';

const rootReducer = combineReducers ({
  entities: entitiesReducer
});

// const rootReducer = (state = {}, action) => {
//   // debugger
//   return {
//     entities: entitiesReducer(state.entities, action),
//   };
// };


export default rootReducer;