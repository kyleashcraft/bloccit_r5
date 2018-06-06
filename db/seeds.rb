require 'random_data'

5.times do
  User.create!(
    name: RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_password,
    created_at: rand(10.minutes .. 1.year).ago
  )
end

User.create!(
  name: "Kyle",
  email: "kyle@fake.com",
  password: "password",
  created_at: rand(10.minutes .. 1.year).ago
)
users = User.where(role: 'member')

User.create!(
  name: 'Admin',
  email: 'admin@bloccit.com',
  password: 'password',
  role: 'admin',
  created_at: rand(10.minutes .. 1.year).ago
)

admin = User.where(role: 'admin')

20.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_sentence,
    created_at: rand(10.minutes .. 1.year).ago
  )
end

topics = Topic.all

50.times do
  post = Post.create!(
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    user: users.sample,
    created_at: rand(10.minutes .. 1.year).ago
  )
  rand(1..5).times { post.votes.create!(value: [-1,1].sample, user: users.sample) }
end
posts = Post.all

100.times do
  Comment.create!(
    user: User.all.sample,
    post: posts.sample,
    body: RandomData.random_paragraph,
    created_at: rand(10.minutes .. 1.year).ago
  )
end

75.times do
  Favorite.create!(
    user: User.all.sample,
    post: posts.sample
  )
end 

puts "Seeds finished"
puts "#{users.count} members created"
puts "#{admin.count} admin created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Vote.count} votes created"
puts "#{Favorite.count} favorites created"
