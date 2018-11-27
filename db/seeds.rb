# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.create(name: "dynamic website", description: "Expensive stuff!", image_url: "http://wwwcdn.howdesign.com/wp-content/uploads/online-port-628.jpg")
Product.create(name: "static website", description: "cheap stuff!", image_url: "http://wwwcdn.howdesign.com/wp-content/uploads/portfolio-628.jpg")
Product.create(name: "seed-generated product", description: "I also created this product without using the HTML form!", image_url: "http://catlintucker.com/wp-content/uploads/2013/07/Screen-shot-2013-07-06-at-9.24.31-AM.png")
