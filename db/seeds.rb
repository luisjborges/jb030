# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all

60.times do
  Product.create(
    title: Faker::Commerce.product_name,
    color: Faker::Commerce.color,
    description: Faker::TvShows::Seinfeld.quote,
    price: rand(10..40),
    delivery: rand(1..5),
    fabric: Faker::Commerce.material,
    size: rand(30..40),
    photo: 'https://source.unsplash.com/random?sig=123'
    )
end
