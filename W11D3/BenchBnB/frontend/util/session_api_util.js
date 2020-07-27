export const signUp = user => {
    debugger
    return $.ajax({
        method: 'POST',
        url: '/api/users',
        data: { user }
    })
};

export const logIn = user => {
    debugger
    return $.ajax({
        method: 'POST',
        url: '/api/session',
        data: { user }
    })
};

export const logOut = () => {
    debugger
    return $.ajax({
        method: 'DELETE',
        url: '/api/session',
    })
};

