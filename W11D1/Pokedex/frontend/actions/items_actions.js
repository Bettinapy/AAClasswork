// import * as APIUtil from '../util/api_util';
export const RECEIVE_ALL_ITEMS = 'RECEIVE_ALL_ITEMS';

export const receiveAllItems = items => {
    debugger
    return {
        type: RECEIVE_ALL_ITEMS,
        items
    }
};