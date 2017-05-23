class ReviewsController < ApplicationController
  def index

  end

  def new
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.new

  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build(review_params)

    if @review.save
      flash[:notice] = "Review was saved."
      redirect_to index_path
    else
      flash.now[:alert] = "There was an error saving the review. Please try again."
      render :new
    end

  end
  def edit
    @review = Review.find(params[:id])
  end

  def show
    @reviews = Review.paginate(:page => params[:page], :per_page => 30).order('created_at DESC')
  end
  private

  def review_params
    params.require(:review).permit(:score, :body, :reviewer, :email)
  end

end
