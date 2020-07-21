import React from 'react';
import { receiveStep, removeStep } from '../../actions/step_actions';
import StepListItem from './step_list_item'

const mapDispatchToProps = (dispatch) => {
    return{
        removeStep: (step) => {
            dispatch(removeStep(step));
        },
        receiveStep: (step) =>{
            dispatch(receiveStep(step));
        }
    }
}

const StepListItemContainer = connect(null, mapDispatchToProps)(StepListItem);
export default StepListItemContainer;
