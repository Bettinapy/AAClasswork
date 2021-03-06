import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';
import logger from 'redux-logger';
import thunk from '../middleware/thunk';

const configureStore = () => {
    debugger
    return (
    createStore(
        rootReducer, 
        applyMiddleware(thunk, logger)
        )
    )
}

// const configureStore = () => {
//     debugger
//     return (
//     createStore(
//         rootReducer (), 
//         applyMiddleware(thunk, logger)
//         )
//     )
// }

export default configureStore;

