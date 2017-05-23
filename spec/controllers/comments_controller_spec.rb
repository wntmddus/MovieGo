require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:my_movie) { create(:movie) }
  let(:my_review) { create(:review, movie: my_movie) }
  let(:my_comment) { create(:comment, review: my_review) }
  describe "POST create" do
    it "increases the number of comments by 1" do
      expect{ post :create, review_id: my_review.id, comment: {body: "Hello world"} }.to change(Comment,:count).by(1)
    end

    it "redirects to the review show view" do
      post :create, review_id: my_review.id, comment: {body: "Hello World"}
      expect(response).to redirect_to [my_movie, my_review]
    end
  end

  describe "DELETE destroy" do
    it "deletes the comment" do
      delete :destroy, review_id: my_review.id, id: my_comment.id
      count = Comment.where({id: my_comment.id}).count
      expect(count).to eq 0
    end

    it "redirects to the review show view" do
      delete :destroy, review_id: my_review.id, id: my_comment.id
      expect(response).to redirect_to [my_movie, my_review]
    end
  end
end
