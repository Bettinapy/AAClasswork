export const RECEIVE_TODO = "RECEIVE_TODO";

export const receiveTodo = (todo) => {
    return {
        type: RECEIVE_TODO,
        todo
    }
}