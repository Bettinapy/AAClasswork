import React from 'react';

class stepListItem extends React.Component{
    constructor(props){
        super(props);
    }

    render(){
        return(
            <>
            <li>{this.props.step.title}</li>
            <li>{this.props.step.body}</li>
            <button>{this.props.step.done ? "Done" :Undo}</button>
            </>
        )
    }
}

export default stepListItem;