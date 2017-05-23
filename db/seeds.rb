# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'themoviedb'

require 'Faker'

Tmdb::Api.key("591eaa6d9de2fc5026f6c5af27ebc766")
str = ""
poster_str = ""
release_date_str = ""
movie = Tmdb::Movie.detail(1)
# populate Movie
for i in (1..200)
  movie = Tmdb::Movie.detail(i)
  if movie["status_code"] != 34
    #if Tmdb::Movie.detail(i)["genres"] != nil
      for i in (0..movie["genres"].length-1) do
        if i != movie["genres"].length-1
          str = str + movie["genres"][i]["name"] + ", "
        else
          str = str + movie["genres"][i]["name"]
        end
      end

    if movie["poster_path"] != nil
      poster_str = "http://image.tmdb.org/t/p/w185" + movie["poster_path"] + "?api_key=591eaa6d9de2fc5026f6c5af27ebc766"
    else
      poster_str = ""
    end

    Movie.create!(
      title: movie["title"],
      release_date: movie["release_date"],
      image_url: poster_str,
      genre: str,
      rating: 0
    )
  end
  str = ""
  poster_str = ""
  movie = ""
  if i % 10 == 0
    sleep 1.2
  end
 end

 movies = Movie.all
 1000.times do
   Review.create(
    reviewer: Faker::Name.name,
    body: Faker::Lorem.sentence,
    email: Faker::Internet.email,
    score: rand(1..5),
    movie: movies.sample
   )
 end
 reviews = Review.all
 10000.times do
   Comment.create(
    name: Faker::Name.name,
    body: Faker::Lorem.sentence,
    review: reviews.sample
   )
 end



puts "Seed finished"
puts "#{Movie.count} movies created"
puts "#{Review.count} reviews created"
puts "#{Comment.count} comments created"
