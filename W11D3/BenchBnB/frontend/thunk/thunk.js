const thunk = (store)=>{
    debugger 
    return (next) => {
        debugger 
        return(action) => {
            
            if (typeof action === "function"){
                debugger
                return action(store.dispatch, store.getState);
            }else{
                debugger
                return next(action);
            }
        }
    }
}

export default thunk;