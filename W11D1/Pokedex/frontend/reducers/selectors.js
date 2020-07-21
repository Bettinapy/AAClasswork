export const selectAllPokemon = (state) => {
    return Object.values(state.entities.pokemon)
};

// a way to export logic we want to use in more than one place