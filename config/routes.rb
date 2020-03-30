Rails.application.routes.draw do
  get "/pokemon/:pokemon_name", to: "pokemons#show", as: :pokemon
end
