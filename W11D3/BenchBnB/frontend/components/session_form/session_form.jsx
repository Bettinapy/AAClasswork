import React from 'react';

class SessionForm extends React.Component{
    constructor(props) {
        super(props);
        this.state = {
            username: "",
            password: ""
        };
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    handleSubmit(e) {
        e.preventDefault();
        debugger
        const user = Object.assign({}, this.state);
        // why can't I use this.state?  //yes, you can
        // chain on Promise? 
        debugger
        this.props.processForm(user).then(()=>this.props.history.push('/'), ()=>{});
        this.setState({username:'', password:''})
    }

    handleInput(type){
        return(e) => {
            debugger
            //why use bracket?
            this.setState({[type]: e.target.value})
        }
    }

    render(){
        const header = (this.props.formType === "signup" ? (
            <h1>Sign up</h1>
        ) : (
            <h1>Log in</h1>
        ));
        debugger
        const errors = ((this.props.errors.length !== 0) ? (
            this.props.errors.map((error,idx)=>{
            return(
            <li key={idx}>{error}</li>
            )
        })
        ) : (
            <></>
        ));
        debugger
        return(
            <div className = "session-form">
                {header}
                {errors}
                <label htmlFor="username">Username</label>
                <input type="text" onChange={this.handleInput("username")} value={this.state.username}/>
                <label htmlFor="password">Password</label>
                <input type="password" onChange={this.handleInput("password")} value={this.state.password} />
                <button onClick={this.handleSubmit}>Submit</button>
            </div >
        )
    }
}

export default SessionForm;