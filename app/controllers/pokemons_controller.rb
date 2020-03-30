class PokemonsController < ApplicationController
  def show
    render json: { name: "Hello world" }
  end
end
