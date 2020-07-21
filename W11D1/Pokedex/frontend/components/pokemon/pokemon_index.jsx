import React from 'react';
import PokemonIndexItem from './pokemon_index_item';


class PokemonIndex extends React.Component{
    constructor(props){
        super(props)
    }

    componentDidMount(){
        this.props.requestAllPokemon()
    }

    render() {
        const pokemon = this.props.pokemon.map(poke => {
        return (
            <PokemonIndexItem key={poke.id} pokemon={poke} />
        )
        });
        
        return(
            <>
                <section className="pokedex">
                    <ul>
                        {pokemon}
                    </ul>
                </section>
            </>
        )
    }
}

export default PokemonIndex;