# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

account = [
  {name: "ebay", user_login: ""},
  {name: "Amazon", user_login: ""},
  {name: "Craigslist", user_login: ""},
]

account.each do |seed|
  Account.create(seed)
end
