# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

questions = Question.create([{text: 'Is the sky blue?', answer: true},{text: 'Does enrique want us to love rails?', answer: false},{text: 'Is mount everest a tall mountain?', answer: true}])
