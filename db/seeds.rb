# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(email: "admin@dev.com", role: :admin, fullname: "John Doe", password: "Password1!", password_confirmation: "Password1!")
User.create!(email: "jdcruz@dev.com", role: :admin, fullname: "Juan Dela Cruz", password: "Password1!", password_confirmation: "Password1!")
User.create!(email: "mmakiling@dev.com", role: :admin, fullname: "Maria Makiling", password: "Password1!", password_confirmation: "Password1!")
