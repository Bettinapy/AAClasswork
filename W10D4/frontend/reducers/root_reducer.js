import { combineReducers } from 'redux';
import todosReducer from './todos_reducer';
import stepsReducer from './steps_reducer';
debugger
export default combineReducers({
    todos: todosReducer,
    steps: stepsReducer
})

