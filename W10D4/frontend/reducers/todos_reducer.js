import { RECEIVE_TODOS } from '../actions/receive_todos_action';
import {RECEIVE_TODO} from '../actions/receive_todo_action';
const initialState = {
    1: {
        id: 1,
        title: "wash car",
        body: "with soap",
        done: false
    },
    2: {
        id: 2,
        title: "wash dog",
        body: "with shampoo",
        done: true
    }
};

const todosReducer = (state = initialState, action) => {
    Object.freeze(state);
    switch (action.type) {
        case RECEIVE_TODOS:
            const {todos} = action;
            const newTodos = todos.map((todo,idx)=>{

            })

        // case RECEIVE_TODO:

        default:
            return state;
    }
};

export default todosReducer;