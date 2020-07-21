class Api::PokemonController < ApplicationController
    def index 
        debugger
        @pokemon = Pokemon.all
    end

    def show
        debugger
        @pokemon = Pokemon.includes(:items).find(params[:id])
    end


    private
    def pokemon_params
        params.require(:pokemon).permit(:name, :attack, :defense, :poke_type, :moves, :image_url)
    end

end
