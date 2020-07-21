import { connect } from 'react-redux';
import {receiveStep} from '../../actions/step_actions';
import {allSteps} from '../../reducers/selectors'

const mapStateToProps = (state) => {
    debugger
    return {
        steps: allSteps(state),
        todo_id: state.todo_id
    }
}

const mapDispatchToProps = (dispatch) => {
    debugger
    return {
        receiveStep: (step) => {
            dispatch(receiveStep(step));
        },
    }
}

const StepListContainer = connect(mapStateToProps, mapDispatchToProps)(StepList);
export default StepListContainer;