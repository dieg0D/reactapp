# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(name: "Diego barbosa", email: "diegocardoso@cjr.org.br", password: "12345678", password_confirmation:"12345678", is_logged: "false")

Place.create(name: "SobraDisney", rating: "5.0", url:"https://protestofacil.com/wp-content/uploads/2017/03/Sobradinho2.png");