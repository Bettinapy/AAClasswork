import { connect } from 'react-redux';
import {removeTodo} from '../actions/todo_actions';
import {receiveSteps} from '../actions/step_actions';
import TodoDetailView from './todo_detail_view';

const mapDispatchToProps = (dispatch) => {
    debugger
    return {
        removeTodo: (todo) => {
            dispatch(removeTodo(todo));
        },
        receiveSteps: (steps) => {
            dispatch(receiveSteps(steps))
        }
    }
}

const TodoListContainer = connect(null, mapDispatchToProps)(TodoDetailView);
export default TodoListContainer;