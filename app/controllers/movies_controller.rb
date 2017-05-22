class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end
  def show
    total = 0
    @movie = Movie.find(params[:id])
    if @movie.reviews.length != 0
      @movie.reviews.each do |y|
        total = total + y.score
      end
      @movie.rating = (total / @movie.reviews.length)
    end
  end

end
