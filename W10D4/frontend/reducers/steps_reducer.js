import { RECEIVE_STEP, RECEIVE_STEPS, REMOVE_STEP } from '../actions/step_actions';

const initialState = {
    1: { // this is the step with id = 1
        id: 1,
        title: 'walk to store',
        done: false,
        todo_id: 1
    },
    2: { // this is the step with id = 2
        id: 2,
        title: 'buy soap',
        done: false,
        todo_id: 1
    }
};

const stepsReducer = (state = initialState, action) => {
    Object.freeze(state);
    let newState = Object.assign({}, state);
    debugger
    switch (action.type) {
        case RECEIVE_STEPS:
            action.steps.forEach(step=>{
                newState[step.id] = step;
            })
            return newState;
        case RECEIVE_STEP:
            newState[action.step.id] = action.step;
            return newState;
        case REMOVE_STEP:
            let removeState = {};
            Object.keys(state).forEach((id)=>{
                if(id !== action.step.id){
                removeState[id] = state[id]
                }
            })
            return removeState;
        default:
            return state;
    }
};

export default stepsReducer;