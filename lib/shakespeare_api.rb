class ShakespeareApi
  URL = "https://api.funtranslations.com/translate/shakespeare.json"

  # Retrieve a shakespearean translation of any text from an API
  def self.translate(text)
    HTTParty.post(
      URL,
      {
        body: {
          text: text
        }
      }
    ).parsed_response["contents"]["translated"]
  end
end
