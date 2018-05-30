require 'random_data'

5.times do
  User.create!(
    name: RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_password,
    created_at: Faker::Date.between(5.days.ago, Date.today)
  )
end

User.create!(
  name: "Kyle",
  email: "kyle@fake.com",
  password: "password",
  created_at: Faker::Date.between(5.days.ago, Date.today)
)

users = User.all

20.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_sentence,
    created_at: Faker::Date.between(5.days.ago, Date.today)
  )
end

topics = Topic.all

50.times do
  Post.create!(
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    user: users.sample,
    created_at: Faker::Date.between(5.days.ago, Date.today)
  )
end
posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph,
    created_at: Faker::Date.between(5.days.ago, Date.today)
  )
end

puts "Seeds finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
