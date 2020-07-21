import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';
debugger
const configureStore = createStore(rootReducer);

export default configureStore;