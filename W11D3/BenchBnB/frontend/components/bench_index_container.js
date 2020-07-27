import {connect} from 'react-redux';
import BenchIndex from './bench_index';
import {fetchAllBenches} from '../actions/bench_actions';

const mapStateToProps = (state) => {
    return{
        benches: Object.values(state.entities.benches)
    }
}

const mapDispatchToProps = (dispatch) => {
    return{
        fetchAllBenches: ()=>dispatch(fetchAllBenches())
    }
}

export default connect(
    mapStateToProps,
    mapDispatchToProps
)(BenchIndex);