# README

This is an API used to find shakespearean translations of pokemon descriptions.

## Installation

To install this repository please do the following:

  1. `git clone git@github.com:iferunsewe/pokemon_api.git`
  2. `cd pokemon_api`
  3. `bundle install` (this will install all the dependencies)
  4. `bundle rake db:create` (this will create the database)
  4. `bundle rake db:migrate`(this will run the database migrations needed)
  
This assumes you have ruby and postgres installed on your machine.

## Usage

In order to use the API locally, please do the following from your local pokemon_api respository:

  1. bundle exec rails s -p 3000(this will start a local server for you)
  2. Make requests to the following endpoints from `http://localhost:3000`:

  
  ### Endpoints

    GET /pokemon/charizard
    
    Example response


  ```
    { 
      "name": "charizard",
      "description": "Charizard flies 'round the sky in search of powerful opponents. 't breathes fire of such most wondrous heat yond 't melts aught. However,  't nev'r turns its fiery breath on any opponent weaker than itself."
    }
  ```

If you want to use the production API, the url for it is `https://pokemon-shakespeare.herokuapp.com`

## Testing

To run the tests for this project, please run the following from your local pokemon_api respository:

  `bundle exec rspec`
