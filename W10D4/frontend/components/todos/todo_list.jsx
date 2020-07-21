import React from "react";
import TodoListContainer from './todo_list_container';
import TodoListItem from './todo_list_item';
import TodoForm from '../todo_list/todo_form';

class TodoList extends React.Component{
    constructor(props){
        super(props);
    }
    render(){
        debugger
        return(
        <>
            <TodoForm receiveTodo = {this.props.receiveTodo}/>
        <ul>
            {
                this.props.todos.map(todo => <TodoListItem key={todo.id} todo={todo} removeTodo={this.props.removeTodo} receiveTodo={this.props.receiveTodo} />)
            }
        </ul>
        </>
    )
    }
}
export default TodoList;