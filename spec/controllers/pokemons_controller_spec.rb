
require "rails_helper"

RSpec.describe PokemonsController, type: :request do
  context "GET /pokemon/:pokemon_name" do
    let(:pokemon_species_json) { File.open('./spec/support/fixtures/pokemon_species.json').read }
    let(:shakespeare_json) { File.open('./spec/support/fixtures/shakespeare_translation.json').read }
    let(:pokemon_name) { "charizard" }

    before do
      stub_request(:any, /pokeapi.co/).to_return(
        status: 200,
        body: pokemon_species_json,
        headers: {"Content-Type"=> "application/json"}
      )

      stub_request(:post, /api.funtranslations.com/).to_return(
        status: 200,
        body: shakespeare_json,
        headers: {"Content-Type"=> "application/json"}
      )
    end

    it "returns a name a description given a pokemon name" do
      expected_description = JSON.parse(shakespeare_json)["contents"]["translated"]
      get pokemon_path(pokemon_name: pokemon_name)
      json = JSON.parse(response.body)
      expect(json["name"]).to eq pokemon_name
      expect(json["description"]).to eq expected_description
    end

    it "returns a error message if the name isn't a pokemon name" do
      get pokemon_path(pokemon_name: "foobar")
      json = JSON.parse(response.body)
      expect(json["message"]).to eq "Not Found"
    end

    it "creates a Pokemon record in the database if it is a pokemon's name but it doesn't exist in the database" do
      expect{
        get pokemon_path(pokemon_name: pokemon_name)
      }.to change{ Pokemon.count }.by(1)
    end

    it "doesn't creates a Pokemon record in the database if it exists in the database" do
      expect{
        get pokemon_path(pokemon_name: pokemon_name)
        get pokemon_path(pokemon_name: pokemon_name)
      }.to change{ Pokemon.count }.by(1)
    end
  end
end
