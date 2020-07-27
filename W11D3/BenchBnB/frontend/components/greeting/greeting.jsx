import React from 'react';
import { Link } from 'react-router-dom';

class Greeting extends React.Component{
    render(){
        debugger
        let greeting;
        if (this.props.currentUser){
            debugger
            greeting = (
                <div>
                    <h2>Welcome! {this.props.currentUser.username}</h2>
                    <button onClick={this.props.logout}>Log out</button>
                </div>
            );
            return greeting;
        }else{
            greeting = (
                // get "signup" & "/login" from HashRouter in root.jsx
                <div>                 
                    <Link to="/signup">Sign up</Link>
                    <Link to="/login">Log in</Link>
                </div>
            )
        }

        return(
            <div>
                {greeting}
            </div>
        )
    }
}

export default Greeting;