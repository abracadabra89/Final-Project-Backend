# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.destroy_all
# Search.destroy_all
# Restaurant.destroy_all
# Favorite.destroy_all
# CartItem.destroy_all
# Item.destroy_all
# CartItem.destroy_all

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


 bakeri = Business.create(name:'Bakeri', image_url: 'https://gourmadela.com/wp-content/uploads/2015/09/Bakeri-brooklyn-vue-de-haut-e1457826978929.jpg', address: '150 Wythe Ave', latitude: '40.720040', longitude: '-73.960130', search_id: search1.id)
 ovenly = Business.create(name:'Ovenly', image_url: 'https://afar-production.imgix.net/uploads/images/post_images/images/np1BLUEheh/original_open-uri20130718-32684-clij2f?1383819329?ixlib=rails-0.3.0&auto=format%2Ccompress&crop=entropy&fit=crop&h=719&q=80&w=954', address: '43 N 5th St', latitude: '35.611330', longitude: '-77.373870', search_id: search2.id)
 puts 'restaurants created'

 Favorite.create(user: anya, place: bakeri)

 puts 'all seeded'
