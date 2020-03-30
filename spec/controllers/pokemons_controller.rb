
require "rails_helper"

RSpec.describe PokemonsController, type: :request do
  context "GET /pokemon/:pokemon_name" do
    it "returns a name a description given a pokemon name" do
    
      get pokemon_path(pokemon_name: "Charizard")
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json["name"]).to eq "Hello world"
    end
  end
  
end
