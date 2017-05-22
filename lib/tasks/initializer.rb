require 'themoviedb'
require 'date'
Tmdb::Api.key("591eaa6d9de2fc5026f6c5af27ebc766")
str = ""
poster_str = ""
release_date_str = ""
namespace :bootstrap do
desc "Create the default comment"
task :default_movies => :environment do
  # populate Movie
  for i in (15..20)
    if Tmdb::Movie.detail(i)["status_code"] != 34
      #if Tmdb::Movie.detail(i)["genres"] != nil
      if Tmdb::Movie.detail(i)["genres"] != nil
        for j in (0..Tmdb::Movie.detail(i)["genres"].length-1)
          puts i
          if j == Tmdb::Movie.detail(i)["genres"].length-1
            str = str + Tmdb::Movie.detail(i)["genres"][j]["name"]
          else
            str = str + Tmdb::Movie.detail(i)["genres"][j]["name"] + ", "
          end
        end
      end

      if Tmdb::Movie.detail(i)["poster_path"] != nil
        poster_str = "http://image.tmdb.org/t/p/w185" + Tmdb::Movie.detail(i)["poster_path"] + "?api_key=591eaa6d9de2fc5026f6c5af27ebc766"
      else
        poster_str = ""
      end

      Movie.create!(
        title: Tmdb::Movie.detail(i)["title"],
        release_date: Date.strptime(Tmdb::Movie.detail(i)["release_date"]),
        image_url: poster_str,
        genre: str,
        rating: 0
      )
    end
    str = ""
    poster_str = ""
   end

   movies = Movie.all
end
  puts "Seed finished"
  puts "#{Movie.count} movies created"
  task :all => [:default_movies]

end
