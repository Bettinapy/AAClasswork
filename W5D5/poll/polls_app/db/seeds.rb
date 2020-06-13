# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
user1 = User.create!("Mac")
user2 = User.create!("Yuan")
user3 = User.create!("Peter")

Poll.destroy_all
poll1 = Poll.create!("Mac's Poll", user1.id)

Question.destroy_all
questions1 = Question.create!("what's your favorite color?", poll1.id)
questions2 = Question.create!("what's your favorite band?", poll1.id)

AnswerChoice.destroy_all
answerchoice1 = AnswerChoice.create!("blue", questions1.id)
answerchoice2 = AnswerChoice.create!("red", questions1.id)
answerchoice3 = AnswerChoice.create!("The Beatles", questions2.id)

Response.destroy_all
response1 = Response.create!(answerchoice1.id, user2.id)
response1 = Response.create!(answerchoice2.id, user3.id)
response1 = Response.create!(answerchoice3.id, user1.id)

