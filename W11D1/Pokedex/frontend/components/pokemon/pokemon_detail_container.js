import { connect } from 'react-redux';
import PokemonDetail from './pokemon_detail';
import { requestSinglePokemon } from '../../actions/pokemon_actions';

const mapStateToProps = (state, ownProps) => {
    debugger
    const pokemonId = ownProps.match.params.pokemonId;
    const pokemon = state.entities.pokemon[pokemonId] || {};

    return {
        pokemon,
        pokemonId
    }
};

const mapDispatchToProps = dispatch => {
    debugger
    return {
        requestSinglePokemon: (id) => dispatch(requestSinglePokemon(id))
    }
};

export default connect(
    mapStateToProps,
    mapDispatchToProps
)(PokemonDetail);