# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(name: '桐生一馬', email: 'test1@yahoo.co.jp', password: 'test111', password_confirmation: 'test111', admin: true)
User.create(name: '堂島大吾', email: 'test2@yahoo.co.jp', password: 'test222', password_confirmation: 'test222')
User.create(name: '秋山駿', email: 'test3@yahoo.co.jp', password: 'test333', password_confirmation: 'test333')
User.create(name: '冴島大河', email: 'test4@yahoo.co.jp', password: 'test444', password_confirmation: 'test444')
User.create(name: '真島吾朗', email: 'test5@yahoo.co.jp', password: 'test555', password_confirmation: 'test555')
User.create(name: '西谷誉', email: 'test6@yahoo.co.jp', password: 'test666', password_confirmation: 'test666')
5.times do |n|
    Meeting.create!(
      name: "会議#{n + 1}",
      agenda: "本日のアジェンダ#{n + 1}",
      goal: "各支社の進捗確認",
      status: 1,
      user_id: 1,
      hold_time: 30,
      minutes: "スーパーセールのADマイルがYoY+20%"
      start_meeting: '2022-05-18 9:40:00', 
      end_meeting: '2022-05-18 10:00:00'
    )
  end

  5.times do |n|
    Meeting.create!(
      name: "会議#{n + 1}",
      agenda: "本日のアジェンダ#{n + 1}",
      goal: "各支社の進捗確認",
      status: 1,
      user_id: 2,
      hold_time: 30,
      start_meeting: '2022-05-18 9:40:00', 
      end_meeting: '2022-05-18 10:00:00'
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
