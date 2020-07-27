import { connect } from 'react-redux';
import { createNewUser } from '../../actions/session';
import Signup from './signup';

const mapDispatchToProps = dispatch => {
    debugger
    return{
        createNewUser: formUser => dispatch(createNewUser(formUser))
    }
};

export default connect(null, mapDispatchToProps)(Signup);