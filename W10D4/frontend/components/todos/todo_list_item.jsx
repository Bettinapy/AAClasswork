import React from "react";
import TodoDetailView from "./todo_detail_view";

class TodoListItem extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            detail: false
        }
        this.deleteTodo = this.deleteTodo.bind(this);
        this.updateDone = this.updateDone.bind(this);
        this.handleOnClick = this.handleOnClick.bind(this);
    }
    deleteTodo(e){
        debugger
        e.preventDefault();
        this.props.removeTodo(this.props.todo);
    }
    updateDone(e){
        debugger
        e.preventDefault();
        this.props.todo.done = !this.props.todo.done;
        this.props.receiveTodo(this.props.todo);
    }

    handleOnClick(e){
        this.setState({detail: true})
    }
    render(){
        debugger
        let detailView;
        if(this.state.detail){
            detailView = <TodoDetailView todo={this.props.todo} removeTodo={this.props.removeTodo}/>
        }
        return(
            <>
                <li onClick={this.handleOnClick}>{this.props.todo.title}</li>
                {detailView}
                <br/>
                <button onClick={this.updateDone}>{this.props.todo.done ? "Done" : "Undo"}</button>
            </>
    )
    }
}

export default TodoListItem;