class PokemonsController < ApplicationController
  def show
    if get_pokemon_species.code == 200
      pokemon = Pokemon.find_or_create_by(name: params[:pokemon_name].downcase)
      if pokemon.description.nil?
        pokemon.update(description: shakespearen_translation)
      end
      render  json: { name: pokemon.name, description: pokemon.description },
              status: :ok
    else
      render  json: { message: get_pokemon_species.parsed_response },
              status: get_pokemon_species.code.to_i
    end
  end

  private

  def get_pokemon_description
    @get_pokemon_description ||= pokemon_species_api.flavor_text
  end

  def get_pokemon_species
    @get_pokemon_species ||= pokemon_species_api.get_species
  end

  def pokemon_species_api
    PokemonSpeciesApi.new(params[:pokemon_name])
  end

  def shakespearen_translation
    @shakespearen_translation ||= ShakespeareApi.translate(get_pokemon_description)
  end
end
