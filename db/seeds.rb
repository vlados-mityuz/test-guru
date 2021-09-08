# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = [ 'Ruby', 'Ruby on Rails', 'HTML', 'SQL' ]

users = [[ 'test_user', 'vbnasd123', 'author' ],
         [ 'admin', 'superadmin', 'admin' ],
         [ 'supervisor', 'superpuperviser', 'supervisor' ]]

tests = [[ 'Ruby Basics', 1, 1],
         [ 'Ruby on Rails Basics', 2, 2],
         [ 'HTML Basics', 3, 2],
         [ 'SQL Basics', 4, 1],
         [ 'Ruby Advanced', 1, 2 ]]

questions = [[ 'What does puts function mean?', 1 ],
             [ 'What function helps to quit the loop?', 5 ],
             [ 'Whats the decryption for MVC?', 2 ],
             [ 'Which function stands for selecting values?', 4 ],
             [ 'What section head means?', 3 ]]

answers = [[ 'It gets values putted by user', 1, false ],
           [ 'It outputs values', 1, true ],
           [ 'exit', 2, false ],
           [ 'quit', 2, false ],
           [ 'break', 2, true ],
           [ 'Model View Controller', 3, true ],
           [ 'Microsoft Visual Console', 3, false ],
           [ 'SELECT', 4, true ],
           [ 'INSERT', 4, false ],
           [ 'Header of the HTML page', 5, true ],
           [ 'Bold text in HTML page', 5, false ]]

categories.each do |title|
  Category.create( title: title )
end

users.each do |username, password, role|
  User.create( username: username, password: password, role: role )
end

tests.each do |title, level, categoriy_id|
  Test.create( title: title, level: level, category_id: categoriy_id )
end

questions.each do |body, test_id|
  Question.create( body: body, test_id: test_id )
end

answers.each do |body, question_id, correct|
  Answer.create( body: body, question_id: question_id, correct: correct )
end