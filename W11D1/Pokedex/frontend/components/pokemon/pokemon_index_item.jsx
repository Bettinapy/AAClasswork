import React from 'react';
import { Link } from "react-router-dom";

class PokemonIndexItem extends React.Component {
    render () {
        return (
        <Link to={`/pokemon/${this.props.pokemon.id}`}>
            <li>
                {this.props.pokemon.name}
                <img src={this.props.pokemon.image_url} />
            </li>
        </Link>
        )
    }
};

export default PokemonIndexItem;