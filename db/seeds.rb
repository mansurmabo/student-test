# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name: 'teacher', email: 'teacher@example.com', password: '1234', password_confirmation: '1234')
Test.create!(name: 'Math', description: 'Algebra')
Question.create!(title: 'How much 2 + 2', test_id: '1')
Question.create!(title: 'How much 2 + 5', test_id: '1')
Answer.create!(title: '4', is_correct: 'true', question_id: '1')
Answer.create!(title: '1', is_correct: 'false', question_id: '1')
Answer.create!(title: '2', is_correct: 'false', question_id: '1')
Answer.create!(title: '3', is_correct: 'false', question_id: '2')
Answer.create!(title: '5', is_correct: 'false', question_id: '2')
Answer.create!(title: '7', is_correct: 'true', question_id: '2')