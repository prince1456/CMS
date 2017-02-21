# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# array = [1,2,3]
# moderator = Moderator.create(
#   fullname: "hamed",
#   username: "hamed@gmail.com",
#   password: "Princeh" )
# 100.times do |x|
# post = Post.create(
#   title: Faker::Lorem.sentence(23),
#   content: Faker::Lorem.paragraph,
#   publish: true,
#   moderator: moderator
#   )
#   tag = Tag.create(name: Faker::Lorem.word)
#   post_tag =PostTag.create(post: post, tag: tag)
# end

#  add 15 messages
# 15.times do
#   messages= Message.create(
#   content: Faker::Lorem.sentence(3),
#   visitor_id: [1,2,3,4,5,6,7,8,9,10].sample
#   )
# end

# 8.times do
#   tags = Tag.create(
#     name: Faker::Book.genre
#   )
# end
 # add 10 diffrent comment in diffrent posts
10.times do |x|
  comment = Comment.create(
  message: Faker::Lorem.sentence,
  status: [true, false].sample,
  visitor_id: x+1+1,
  post_id: x+15
  )
end
