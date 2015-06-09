# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
question = Question.create(title: "What's up?", content: "I need an answer from you...")
question.answers.build(title: "All good", content: "You seem to be doing just fine...")
question.save
