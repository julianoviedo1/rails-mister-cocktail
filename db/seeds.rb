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

file = URI.open('https://res.cloudinary.com/julianoviedo1/image/upload/v1595618936/mintjulep_b4jbzh.png')
a = Cocktail.new(name: 'Mint Julep')
a.photo.attach(io: file, filename: 'mintjulep_b4jbzh.png', content_type: 'image/png')
a.save!
fileb = URI.open('https://res.cloudinary.com/julianoviedo1/image/upload/v1595619138/536914-PJIWWP-191_iwhn4b.jpg')
b = Cocktail.new(name: 'Tequila')
b.photo.attach(io: fileb, filename: '536914-PJIWWP-191_iwhn4b.jpg', content_type: 'image/jpg')
b.save!
filec = URI.open('https://res.cloudinary.com/julianoviedo1/image/upload/v1595618933/daiquiri.jpg')
c = Cocktail.new(name: 'Daiquiri')
c.photo.attach(io: filec, filename: 'daiquiri.jpg', content_type: 'image/png')
c.save!

puts 'finish seed'
