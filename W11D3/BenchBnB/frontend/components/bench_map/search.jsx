import React from 'react';
import BenchMap from './bench_map';
import BenchIndex from '../bench_index';

class Search extends React.Component {
    render() {
        return (
            <div>
                <BenchMap benches={this.props.benches}/>
                <BenchIndex fetchAllBenches={this.props.fetchAllBenches} benches={this.props.benches}/>
            </div>
        )
    }
}

export default Search;