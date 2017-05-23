class MoviesController < ApplicationController

  def index
    total = 0
    @movies = Movie.paginate(:page => params[:page], :per_page => 15)
    @movies.each do |x|
      if x.reviews.length != 0
        x.reviews.each do |y|
          if y.score != nil
            total = total + y.score
          end
        end
        x.rating = (total / x.reviews.length)
      end
      total = 0
    end
  end
  def show
    total = 0
    @movie = Movie.find(params[:id])
    if @movie.reviews.length != 0
      @movie.reviews.each do |y|
        if y.score != nil
          total = total + y.score
        end
      end
      @movie.rating = (total / @movie.reviews.length)
    end
  end
end
