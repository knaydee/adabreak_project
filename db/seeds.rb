# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

giftee = [
  {name: "Cortney", age: 35, likes: "", dislikes: ""},
  {name: "Lauri", age: 62, likes: "", dislikes: ""},
  {name: "Meighan", age: 37, likes: "", dislikes: ""},
]

giftee.each do |seed|
  Giftee.create(seed)
end

wishlist = [
  {item: "perfume", price: 5000, bought: false, giftee_id: 1},
  {item: "puppy", price: 150000, bought: false, giftee_id: 3},
  {item: "scarf", price: 2000, bought: false, giftee_id: 2},
  {item: "purse", price: 10000, bought: false, giftee_id: 1},
  {item: "kitty", price: 11500, bought: false, giftee_id: 2},
  {item: "gift card", price: 7500, bought: false, giftee_id: 3},
]

wishlist.each do |seed|
  Wishlist.create(seed)
end
