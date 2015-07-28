# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ingredients = [
  { name: "Betty's Bacardi", image:  File.open(File.join('app/assets/images/ingredients/betty.jpg')) }, #1
  { name: "Grace's Grenadine", image: File.open(File.join('app/assets/images/ingredients/grace.jpg')) }, #2
  { name: "Serena's Simple Syrup", image: File.open(File.join('app/assets/images/ingredients/serena.jpg')) }, #3
  { name: "Malala's Maraschino Cherries", image: File.open(File.join('app/assets/images/ingredients/malala.jpg')) }, #4
  { name: "Oprah's Skinny Bitters", image: File.open(File.join('app/assets/images/ingredients/oprah.jpg')) }, #5
  { name: "Gloria's Gin", image: File.open(File.join('app/assets/images/ingredients/gloria.jpeg')) }, #6
  { name: "Ada's Aquavit", image: File.open(File.join('app/assets/images/ingredients/jk.jpg')) }, #7
  { name: "J.K.'s Jack Daniels'", image: File.open(File.join('app/assets/images/ingredients/betty.jpg')) }, #8
  { name: "Zerlina's Lemon Zest ", image: File.open(File.join('app/assets/images/ingredients/zerlina.jpg')) }, #9
  { name: "Hillary's Hooch", image: File.open(File.join('app/assets/images/ingredients/hillary.jpg')) }, #10,
  { name: "Rosario's Rye Whisky", image: File.open(File.join('app/assets/images/ingredients/rosario.jpeg')) } #11
]

ingredients.each do |ingredient|
  Ingredient.create(ingredient)
end
