require 'pry'
require 'spec_helper'
require_relative '../config/environment'

describe CommandLineInterface do
  it "accepts a valid cuisine input" do
    new_cli = CommandLineInterface.new
    expect(new_cli.get_preference_input.class).to be Integer
end
  it "accepts a valid neighborhood input" do
    new_cli = CommandLineInterface.new
      price_tag = ["$", "$$", "$$$", "$$$$"]
    expect(price_tag.include?(new_cli.get_price_input)).to eq true
  end
end

describe Restaurant do
  it "belongs to a neighborhood" do
  expect(Restaurant.first.neighborhood.id).to eq 1
  end
end

describe Neighborhood do
  it "has an id" do
  expect(Neighborhood.first.id).to eq 1
end
end

describe Cuisine do
  it "has a name" do
  expect(Cuisine.first.name).to eq "American"
end
end
