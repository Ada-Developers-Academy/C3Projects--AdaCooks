# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = [
  {username: "sherbet", password: "dairy", password_confirmation: "dairy"},
  {username: "sorbet", password: "sugar", password_confirmation: "sugar"},
  {username: "werehawke", password: "666", password_confirmation: "666"}
]
