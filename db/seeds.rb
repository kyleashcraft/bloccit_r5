require 'random_data'

50.times do
  Post.create!(
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
posts = Post.all

Post.find_or_create_by!(title: "This post is unique!", body: "this body is unique too!")

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

Comment.find_or_create_by!(post: posts.first, body: "This is a unique comment body!")

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
