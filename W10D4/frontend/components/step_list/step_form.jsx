import React from "react";
import uniqueId from "../util/util";
class StepForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            id: 0,
            title: "",
            body: "",
            done: false,
            todo_id: 0
        };
        this.handleSubmit = this.handleSubmit.bind(this);
        this.update = this.update.bind(this);
    }

    handleSubmit(e) {
        debugger
        e.preventDefault();
        const newTodo = {
            id: uniqueId(),
            title: this.state.title,
            body: this.state.body,
            done: this.state.done
        }
        this.props.receiveTodo(newTodo);
        this.setState({ title: "", body: "", done: false })
    }

    update(field) {
        debugger
        return (e) => {
            this.setState({ [field]: e.target.value })
        }
    }

    render() {
        debugger
        return (
            <>
                <form onSubmit={this.handleSubmit}>
                    <h1>Step Form</h1>
                    <label htmlFor="title">Title</label>
                    <input type="text" id="title" onChange={this.update("title")} value={this.state.title} />
                    <br></br>
                    <br></br>
                    <label htmlFor="title">Body</label>
                    <input type="text" id="body" onChange={this.update("body")} value={this.state.body} />
                    <br></br>
                    <br></br>
                    <label htmlFor="done">Done</label>
                    <input type="checkbox" defaultChecked={this.state.done} onChange={this.update("done")} />
                    <br /><br />
                    <button>create new todo</button>
                </form>
            </>
        );
    }
}

export default StepForm;