# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'themoviedb'

require 'random_data'

Tmdb::Api.key("591eaa6d9de2fc5026f6c5af27ebc766")
str = ""
poster_str = ""
release_date_str = ""
movie = Tmdb::Movie.detail(1)
# populate Movie

for i in (1..100)
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
 5000.times do
   Review.create!(
    body: "Its good movie",
    score: rand(1..5),
    movie: movies.sample
   )
 end



puts "Seed finished"
puts "#{Movie.count} movies created"
puts "#{Review.count} reviews created"
