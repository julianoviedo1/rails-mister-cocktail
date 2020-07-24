# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
puts 'start seed'
user_serialized = open(url).read
user = JSON.parse(user_serialized)
user['drinks'].each do |drink|
  ingredient = Ingredient.new(name: drink.values[0])
  ingredient.save!
  p ingredient
end
cocktaila = Cocktail.new(name: 'Mint Julep')
cocktailb = Cocktail.new(name: 'Whiskey Sour')
cocktailc = Cocktail.new(name: 'Mojito')
cocktaila.save!
cocktailb.save!
cocktailc.save!
puts 'finish seed'
