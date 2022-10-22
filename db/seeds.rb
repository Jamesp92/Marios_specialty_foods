# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Product.destroy_all



  50.times do |i|
    product = Product.create!(name: Faker::Food.dish, country_of_origin: "United States Of America" , cost: Faker::Number.positive)
    250.times do |i|
      Review.create!(author: Faker::Games::Pokemon.name, content_body: Faker::Lorem.sentence(word_count: 23),  rating: rand(1..5), product_id: product.id)
    end
  end
