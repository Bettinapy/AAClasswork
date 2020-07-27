import {connect} from 'react-redux';
import SessionForm from './session_form';
import {login} from '../../actions/session_actions';

const mapStateToProps = (state, ownProps) => {
    debugger
    return{
        errors: state.errors.session.session,
        formType: 'login',
    }
}

const mapDispatchToProps = (dispatch, ownProps) => {
    debugger 
    return{
        processForm: (user) => dispatch(login(user))
    }
};

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);