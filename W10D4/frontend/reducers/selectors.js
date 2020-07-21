export const allTodos = (state)=>{
    return Object.keys(state.todos).map(id=>{
        return state.todos[id];
    })
}

export const allSteps = (state) => {
    return Object.keys(state.steps).map(id => {
        return state.steps[id];
    })
}

export const stepsByTodoId = (state, todoId) => {
    let correctstep;
    Object.keys(state.steps).forEach(id=>{
        if(state.steps[id].todo_id === todoId){
            correctstep = state.steps[id];
        }
    })
    return correctstep;
}

