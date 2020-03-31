# README

This is an API used to find shakespearean translations of pokemon descriptions.

## Installation

To install this repository please do the following:

  1. git clone git@github.com:iferunsewe/pokemon_api.git
  2. cd pokemon_api
  3. bundle install (this will install all the dependencies)
  4. bundle rake db:migrate
  

## Usage

In order to use the API, please do the following from your local pokemon_api respository:

  1. bundle exec rails s -p 3000(this will start a local server for you)
  2. Make requests to the following endpoints

### Endpoints
  | Endpoint  | Example response |
  | GET /pokemon/charizard | {"name": "charizard", "description": "Charizard flies 'round the sky in search of powerful opponents. 't breathes fire of such most wondrous heat yond 't melts aught. However,  't nev'r turns its fiery breath on any opponent weaker than itself."} |


## Testing

To run the tests for this project, please run the following from your local pokemon_api respository:

  `bundle exec rspec`
  