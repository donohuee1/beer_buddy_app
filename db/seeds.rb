# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([
    {user_name: "Betsy", email: "betsy.r.donohue@gmail.com", password: "moped", age: 27},
    {user_name: "Mike", email: "mike@gmail.com", password: "moped123", age: 25},
    {user_name: "Tim", email: "tim@gmail.com", password: "moped!", age: 30},
    {user_name: "Karen", email: "karen@yahoo.com", password: "moped!!!", age: 10},
    {user_name: "Lucy", email: "lucy@yahoo.com", password: "moped888", age: 51},
    {user_name: "Howard", email: "howard@gmail.com", password: "moped999", age: 72},
  ])

bars = Bar.create([
    {bar_name: "Misfit", location:"225 Santa Monica Blvd, Santa Monica, CA 90401", phone_number: "310-656-9800"},
    {bar_name: "Craftsman", location:"119 Broadway, Santa Monica, CA 90401", phone_number: "310-573-8426"},
    {bar_name: "West 4th & Jane", location:"1432 4th St, Santa Monica, CA 90402", phone_number: "310-395-6765"},
  ])
