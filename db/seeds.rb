# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"
Faker::Config.locale = :ja


user = User.create!(
  name: "テストアカウント",
  email: "user1@test.com",
  password: "testtest"
)

10.times do |n|

List.create!(
  user_id: user.id,
  title: Faker::Movie.unique.title
)
end
