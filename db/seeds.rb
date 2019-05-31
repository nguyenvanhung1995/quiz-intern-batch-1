User.create!(name:  "admin",
             email: "admin@gmail.com",
             password:              "password",
             password_confirmation: "password",
             role: "admin")
3.times do |n|
  name = Faker::Name.name
  Category.create!(name: name)
end

category_ids = Category.pluck(:id)
20.times do |n|
  content = Faker::Lorem.sentence
  category_id = category_ids.sample
  question = Question.create!(content:  content,
                              category_id: category_id)

  3.times do
    question.answers.create!(content: Faker::Lorem.sentence, is_correct: false)
  end
  question.answers.create!(content: Faker::Lorem.sentence, is_correct: true)
end

28.times do |n|
  password = "password"
  User.create!(
    name:  Faker::Name.name,
    birthday: Faker::Date.birthday(18, 65),
    address: Faker::Address.full_address,
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password)
end

user_ids = User.pluck(:id)
categories = Category.select{|category| category.questions.size >= 5}
10.times do |n|
  user_id = user_ids.sample
  test = Test.create!(user_id: user_id)

  category = categories.sample
  result = 0
  5.times do
    question = category.questions.sample
    answer = question.answers.sample
    if answer.is_correct then result += 1 end
    DetailTest.create!(question_id: question.id,
                       test_id: test.id,
                       answer_id: answer.id)
  end
  test.update!(result: result)
end
