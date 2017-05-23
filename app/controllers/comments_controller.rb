class CommentsController < ApplicationController
  def destroy
    @review = Review.find(params[:review_id])
    comment = @review.comments.find(params[:id])

    if comment.destroy
      flash[:notice] = "Comment was deleted."
      redirect_to edit_movie_review_path(@review.movie, @review)
    else
      flash[:alert] = "Comment couldn't be deleted. Try again."
      redirect_to edit_movie_review_path(@review.movie, @review)
    end
  end

  def create
# #11
    @review = Review.find(params[:review_id])
    comment = @review.comments.new(comment_params)

    if comment.save
      flash[:notice] = "Comment saved successfully."
      redirect_to edit_movie_review_path(@review.movie, @review)
    else
      flash[:alert] = "Comment failed to save."
      redirect_to edit_movie_review_path(@review.movie, @review)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :name)
  end
end
