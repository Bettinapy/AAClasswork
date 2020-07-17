import store from './store/store';
import { receiveTodo } from './actions/receive_todo_action';
import { receiveTodos } from './actions/receive_todos_action';
window.store = store;
window.receiveTodos = receiveTodos;
window.receiveTodo = receiveTodo;