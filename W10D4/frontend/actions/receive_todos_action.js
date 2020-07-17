export const RECEIVE_TODOS = "RECEIVE_TODOS";

export const receiveTodos = (todos) => {
    return {
        type: RECEIVE_TODOS,
        todos
    }
}