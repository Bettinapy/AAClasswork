import { connect } from 'react-redux';
import SessionForm from './session_form';
import { signup } from '../../actions/session_actions';

// get ownProps from Route in App.jsx?? and pass ownProps to session_form?
const mapStateToProps = (state, ownProps) => {
    debugger
    return {
        errors: state.errors.session.session,
        formType: 'signup',
    }
}

const mapDispatchToProps = (dispatch, ownProps) => {
    debugger
    return {
        processForm: (user) => dispatch(signup(user))
    }
};

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);