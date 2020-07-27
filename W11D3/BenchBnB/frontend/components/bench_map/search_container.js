import { connect } from 'react-redux';
import Search from './search';
import { fetchAllBenches } from '../../actions/bench_actions';

const mapStateToProps = (state) => {
    return {
        benches: Object.values(state.entities.benches)
    }
}

const mapDispatchToProps = (dispatch) => {
    return {
        fetchAllBenches: () => dispatch(fetchAllBenches())
    }
}

export default connect(
    mapStateToProps,
    mapDispatchToProps
)(Search);