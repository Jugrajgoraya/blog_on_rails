# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Post.destroy_all
Comment.destroy_all
User.destroy_all

PASSWORD = 'abcd'
SUPER_USER = User.create(
    name: "yuvi",
    email: "yuvi@goraya.com",
    password_digest: PASSWORD,
    is_admin: true
)
5.times do
    User.create(
        name: Faker::Hacker.name,
        email: "#{Faker::Hacker.name}@#{Faker::Hacker.name}.com",
        password: PASSWORD
    )
end
users = User.all

50.times do 

    p = Post.create(
        title: Faker::Hacker.say_something_smart,
        body: Faker::ChuckNorris.fact,
        created_at: Faker::Date.backward(days:365 * 5),
        updated_at: Faker::Date.backward(days:365 * 4),
        user: users.sample
    )
    if p.valid?
        rand(1..5).times do
            Comment.create(body: Faker::Hacker.say_something_smart,post: p, user: users.sample)
        end
    end
end
posts = Post.all
comments = Comment.all

puts Cowsay.say("Generated #{posts.count} posts ", :dragon)
puts Cowsay.say("Generated #{comments.count} comments ", :cow)
puts Cowsay.say("Generated #{users.count} comments ", :cow)
