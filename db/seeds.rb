# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Andres Valderrama",
             email: "andvalderrama@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             created_at: Time.zone.now-1.month)

5.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              created_at: Time.zone.now-1.month)
end

users = User.all
400.times do |n|
  calories_earned = rand(0..500)
  calories_lost = rand(0..500)
  text = Faker::Lorem.sentence(5)
  created_at = Time.now - 8*n.hours
  users.each do |user| 
    user.posts.create!(calories_earned: calories_earned,
                            calories_lost: calories_lost,
                            text: text,
                            created_at: created_at)
  end
end