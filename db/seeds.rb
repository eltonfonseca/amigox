# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user1 = User.create(name: "Elton", email: "eltonjuniorfonseca@gmail.com", password: "123456")
@user2 = User.create(name: "Lucas", email: "lucas@gmail.com", password: "123456")
@user3 = User.create(name: "Joao", email: "joao@gmail.com", password: "123456")
@user4 = User.create(name: "Amanda", email: "amanda@gmail.com", password: "123456")
@user5 = User.create(name: "Leticia", email: "leticia@gmail.com", password: "123456")
@user6 = User.create(name: "Debora", email: "debora@gmail.com", password: "123456")

@group = Group.create(name: "Natal 2019", id_created: 1)

@group.users = [@user1, @user2, @user3, @user4, @user5, @user6]