import { RECEIVE_TODO, RECEIVE_TODOS, REMOVE_TODO} from '../actions/todo_actions';

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
    let newState = Object.assign({},state);
    debugger
    switch (action.type) {
        case RECEIVE_TODOS:
            const {todos} = action;
            todos.forEach(todo => {
                newState = Object.assign({}, newState, { [todo.id]: todo}); 
            })
            return newState;
        case RECEIVE_TODO:
            const {todo} = action;
            newState[todo.id] = todo;
            return newState;
        case REMOVE_TODO:
            let removeState = {};
            Object.keys(state).map((id)=>{
                if(parseInt(id) !== action.todo.id){
                    removeState[id] = state[id];
                }
            })
            return removeState;
        default:
            return state;
    }
};

export default todosReducer;