# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Search.destroy_all
Restaurant.destroy_all
Favorite.destroy_all
CartItem.destroy_all


anya = User.create(name: 'Anya', email: 'anya.s.litvinova@gmail.com', password: "123456" )
tania = User.create(name: 'Tania', email: 'tania@gmail.com', password: "112233")
brian = User.create(name: 'Brian', email: 'brian@gmail.com', password: "mypassword")

puts 'users seeded'

s1 = Search.create(term: 'pizza', user_id: anya.id)
s2 = Search.create(term: 'dognut', user_id: tania.id)
puts 'search created'

bakeri = Restaurant.create(name:'Bakeri', image_url: 'https://gourmadela.com/wp-content/uploads/2015/09/Bakeri-brooklyn-vue-de-haut-e1457826978929.jpg', address: '150 Wythe Ave', latitude: '40.720040', longtitude: '-73.960130', search_id: s2.id)
ovenly = Restaurant.create(name:'Ovenly', image_url: 'https://afar-production.imgix.net/uploads/images/post_images/images/np1BLUEheh/original_open-uri20130718-32684-clij2f?1383819329?ixlib=rails-0.3.0&auto=format%2Ccompress&crop=entropy&fit=crop&h=719&q=80&w=954', address: '43 N 5th St', latitude: '35.611330', longtitude: '-77.373870', search_id: s1.id )
puts 'restaurants created'

fav1 = Favorite.create(user_id: anya.id, place_id: bakeri.id)
puts 'fav created'

# ci1 = CartItem.create(user_id:tania.id, item_id:'')

