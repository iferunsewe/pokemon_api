require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  it "is valid with valid attributes" do
    expect(
      Pokemon.create(name: "Charizard", description: "Dragon type pokemon")
    ).to be_valid
  end
  it "is not valid without a name" do
    expect(Pokemon.create(description: "Dragon type pokemon")).not_to be_valid
  end
  it "is not valid without a description" do
    expect(Pokemon.create(name: "Charizard")).not_to be_valid
  end
end
