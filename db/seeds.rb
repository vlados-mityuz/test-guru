# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([ { title: 'Ruby' }, 
                                { title: 'Ruby on Rails' }, 
                                { title: 'HTML' }, 
                                { title: 'SQL' }])

users = User.create!([{ username: 'test_user', password: 'vbnasd123', role: 'author' },
                      { username: 'admin', password: 'superadmin', role: 'admin' },
                      { username: 'supervisor', password: 'superpuperviser', role: 'supervisor' }])

tests = Test.create!([{ title: 'Ruby Basics', level: 1, category_id: categories[0].id, creator_id: users[0].id },
                      { title: 'Ruby on Rails Basics', level: 2, category_id: categories[1].id, creator_id: users[1].id },
                      { title: 'HTML Basics', level: 3, category_id: categories[2].id, creator_id: users[0].id },
                      { title: 'SQL Basics', level: 4, category_id: categories[3].id, creator_id: users[1].id },
                      { title: 'Ruby Advanced', level: 1, category_id: categories[0].id, creator_id: users[0].id }])

questions = Question.create!([{ body: 'What does puts function mean?', test_id: tests[0].id },
                              { body: 'What function helps to quit the loop?', test_id: tests[4].id },
                              { body: 'Whats the decryption for MVC?', test_id: tests[1].id },
                              { body: 'Which function stands for selecting values?', test_id: tests[3].id },
                              { body: 'What section head means?', test_id: tests[2].id }])

answers = Answer.create!([{ body: 'It gets values putted by user', question_id: questions[0].id},
                          { body: 'It outputs values', question_id: questions[0].id, correct: true },
                          { body: 'exit', question_id: questions[1].id },
                          { body: 'quit', question_id: questions[1].id },
                          { body: 'break', question_id: questions[1].id, correct: true },
                          { body: 'Model View Controller', question_id: questions[2].id, correct: true },
                          { body: 'Microsoft Visual Console', question_id: questions[2].id },
                          { body: 'SELECT', question_id: questions[3].id, correct: true },
                          { body: 'INSERT', question_id: questions[3].id },
                          { body: 'Header of the HTML page', question_id: questions[4].id, correct: true },
                          { body: 'Bold text in HTML page', question_id: questions[4].id }])
