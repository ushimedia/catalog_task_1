# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(name: 'test1', email: 'test1@yahoo.co.jp', password: 'test111', password_confirmation: 'test111', admin: true)
User.create(name: 'test2', email: 'test2@yahoo.co.jp', password: 'test222', password_confirmation: 'test222')
User.create(name: 'test3', email: 'test3@yahoo.co.jp', password: 'test333', password_confirmation: 'test333')
User.create(name: 'test4', email: 'test4@yahoo.co.jp', password: 'test444', password_confirmation: 'test444')
User.create(name: 'test5', email: 'test5@yahoo.co.jp', password: 'test555', password_confirmation: 'test555')

5.times do |n|
    Meeting.create!(
      name: "会議#{n + 1}",
      agenda: "①挨拶②話③締め#{n + 1}",
      goal: "結論を出す",
      status: 0,
      user_id: 1,
      start_meeting: '2022-05-18 12:33:44', 
      end_meeting: '2022-05-18 12:44:55'
    )
  end

  5.times do |n|
    Feedback.create!(
      score: '3',
      description: "なんか良かった。",
      user_id: 1,
      meeting_id: 1,
    )
  end
