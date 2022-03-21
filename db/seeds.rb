# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Post.destroy_all

50.times do 

    p = Post.create(
        title: Faker::Hacker.say_something_smart,
        body: Faker::ChuckNorris.fact,
        created_at: Faker::Date.backward(days:365 * 5),
        updated_at: Faker::Date.backward(days:365 * 4)
    )
    if p.valid?
        rand(1..5).times do
            Comment.create(body: Faker::Hacker.say_something_smart,post: p)
        end
    end
end
posts = Post.all
comments = Comment.all

puts Cowsay.say("Generated #{posts.count} posts ", :dragon)
puts Cowsay.say("Generated #{comments.count} comments ", :cow)
