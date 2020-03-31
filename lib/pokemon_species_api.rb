class PokemonSpeciesApi
  attr_accessor :name
  URL = "https://pokeapi.co/api/v2/pokemon-species/"

  def initialize(name)
    @name = name
  end

  # Retreive a pokemon species from the PokeAPI for a given name of a pokemon
  def get_species
    HTTParty.get("#{URL}#{name}")
  end

  # Retrieve the first flavor text entry for a pokemon from the PokeApi for given language.
  # The language is defaulted to english and the language url is needed as the language codes are
  # not unique
  def flavor_text(language_code = "en", language_url = "https://pokeapi.co/api/v2/language/9/")
    get_species.parsed_response["flavor_text_entries"].detect{ |flavor_text|
      flavor_text["language"]["name"] == language_code && flavor_text["language"]["url"] == language_url
    }["flavor_text"]
  end
end
