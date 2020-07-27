import {postUser, postSession, deleteSession} from '../utils/session';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';

const receiveCurrentUser = user => ({
    type: RECEIVE_CURRENT_USER,
    user,
});

const logoutCurrentUser = () => ({
    type: LOGOUT_CURRENT_USER
});

//thunk action creator:

export const createNewUser = formUser => dispatch => {
    debugger
    return(
        postUser(formUser).then(user=>dispatch(receiveCurrentUser(user)))
    )
}

export const login = formUser => dispatch => {
    debugger
    return(
        postSession(formUser).then(user => dispatch(receiveCurrentUser(user)))
    )
}

export const logout = () => dispatch => {
    debugger
    return(
        deleteSession().then(() => dispatch(logoutCurrentUser()))
    )
}
