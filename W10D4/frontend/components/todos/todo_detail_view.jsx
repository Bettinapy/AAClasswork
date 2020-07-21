import React from 'react';

class TodoDetailView extends React.Component{
    constructor(props){
        super(props);
        this.deleteTodo = this.deleteTodo.bind(this);
    }
    deleteTodo(e) {
        debugger
        e.preventDefault();
        this.props.removeTodo(this.props.todo);
    }
    render(){
        return(
            <>
                <li>body: {this.props.todo.body}</li>
                <button onClick={this.deleteTodo}>delete</button>
            </>
        )
    }
}

export default TodoDetailView;