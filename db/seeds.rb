# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
         {id: 1, username: "Joe", password: "password", password_confirmation: "password", image: "farmer.jpg"},
         {id: 2, username: "Moe", password: "password", password_confirmation: "password", image: "moe.png"},
         {id: 3, username: "Flo", password: "password", password_confirmation: "password", image: "flo.jpg"}
       ]

users.each do |user|
  User.create(user)
end