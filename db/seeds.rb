# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Search.destroy_all
Business.destroy_all
Favorite.destroy_all


anya = User.create(email: "anya@gmail.com", password: "1234")
brian = User.create(email: "brian@gmail.com", password: "1234")

search1 = Search.create(term: "sushi", user: anya)
search2 = Search.create(term: "italian", user: anya)

#result = search1.search("sushi")


puts 'search created'

 puts 'all seeded'
