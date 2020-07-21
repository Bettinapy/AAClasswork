import { combineReducers } from 'redux';
import entitiesReducer from './entities_reducer';

// debugger
const rootReducer = combineReducers({
  entities: entitiesReducer
});
export default rootReducer;