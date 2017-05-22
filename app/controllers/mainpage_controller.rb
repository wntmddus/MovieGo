class MainpageController < ApplicationController
  helper_method :sort_direction
  def index
    total = 0
    @movies = Movie.order(params[:sort])
    @reviews = Review.all
    @movies.each do |x|
      if x.reviews.length != 0
        x.reviews.each do |y|
          total = total + y.score
        end
        x.rating = (total / x.reviews.length)
      end
      total = 0
    end
    @recent_movies = Movie.order('release_date DESC')
    @recent_movies.each do |x|
      if x.reviews.length != 0
        x.reviews.each do |y|
          total = total + y.score
        end
        x.rating = (total / x.reviews.length)
      end
      total = 0
    end
  end

  def about
  end

  private
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end
end
