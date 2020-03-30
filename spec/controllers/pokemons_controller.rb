
require "rails_helper"

RSpec.describe PokemonsController, type: :request do
  context "GET /pokemon/:pokemon_name" do
    it "returns a name a description given a pokemon name" do
      get pokemon_path(pokemon_name: "charizard")
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json["name"]).to eq "Hello world"
    end

    it "returns the same object whether the pokemon's name is uppercase or lowercase" do
      get pokemon_path(pokemon_name: "charizard")
      lower_case_response = response
      get pokemon_path(pokemon_name: "Charizard")
      upper_case_response = response
      expect(lower_case_response).to eq upper_case_response
    end

    it "returns a error message if the name isn't a pokemon name" do
    end

    it "creates a Pokemon record in the database if it is a pokemon's name but it doesn't exist in the database" do
    end

    it "doesn't creates a Pokemon record in the database if it exists in the database" do
    end
  end
end
