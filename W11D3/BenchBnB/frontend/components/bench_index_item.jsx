import React from 'react';

class BenchIndexItem extends React.Component {
    render(){
        return(
            <>
            <li>Description: {this.props.bench.description}</li>
            </>
        )
    }
}

export default BenchIndexItem;