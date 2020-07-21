import { RECEIVE_ALL_ITEMS } from '../actions/items_actions';
const itemsReducer = (state = {}, action) => {
    debugger
    Object.freeze(state);

    switch(action.type) {
        case RECEIVE_ALL_ITEMS:
            return Object.assign({}, state, action.items);
        default:
            return state;
    }
}

export default itemsReducer;