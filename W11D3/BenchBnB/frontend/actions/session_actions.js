import {signUp, logIn, logOut} from "../util/session_api_util";

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";
export const RECEIVE_ERRORS = "RECEIVE_ERRORS";

export const receiveCurrentUser = (currentUser) => {
    debugger
    return{
        type: RECEIVE_CURRENT_USER,
        currentUser
    }
};

export const logoutCurrentUser = () => {
    debugger
    return{
        type: LOGOUT_CURRENT_USER
    }
}

export const receiveErrors = (errors) => {
    debugger
    return{
        type: RECEIVE_ERRORS,
        errors
    }
}

export const login = (user) => {
    debugger
    return (dispatch) => {
        debugger
        return(
            logIn(user).then(
                (user)=>dispatch(receiveCurrentUser(user)), 
                (response) => dispatch(receiveErrors(response.responseJSON))
            )
        )
}
};

export const logout = () => {
    debugger
    return (dispatch) => {
        debugger
        return(
            logOut().then(
                ()=>dispatch(logoutCurrentUser()),
                (response) => dispatch(receiveErrors(response.responseJSON))
            )
        )
    }
};

export const signup = (user) => {
    debugger
    return(dispatch) => {
        debugger
        return(
            signUp(user).then(
                (returnUser)=> {
                    debugger
                    return(
                        dispatch(receiveCurrentUser(returnUser))
                    )
                },
                (response)=>{
                    debugger
                    return(
                        dispatch(receiveErrors(response.responseJSON))
                    )
                    
                }
            )
        )
    }
}