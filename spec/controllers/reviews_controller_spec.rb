require 'rails_helper'
require 'random_data'

RSpec.describe ReviewsController, type: :controller do
  let(:my_movie) { create(:movie) }
  let(:my_review) { create(:review, movie: my_movie) }
  describe "GET show" do
    it "returns http success" do
      get :show, movie_id: my_movie.id, id: my_review.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, movie_id: my_movie.id, id: my_review.id
      expect(response).to render_template :show
    end

    it "assigns my_review to @review" do
      get :show, movie_id: my_movie.id, id: my_review.id
      expect(assigns(:review)).to eq(my_review)
    end
  end
  describe "GET new" do
    it "returns http success" do
      get :new, {movie_id: my_movie.id}
      expect(response).to have_http_status(:success)
    end
    it "renders the #new view" do
      get :new, {movie_id: my_movie.id}
      expect(response).to render_template :new
    end

    it "instantiates @review" do
      get :new, {movie_id: my_movie.id}
      expect(assigns(:review)).not_to be_nil
    end
  end
  describe "POST create" do
    it "increases the number of Review by 1" do
      expect{review :create, {movie_id: my_movie.id, review: {email: "hello@gmail.com", body: "Hello World", score: 2}}}.to change(Review,:count).by(1)
    end

    it "assigns the new review to @review" do
      post :create, {movie_id: my_movie.id, review: {email: "hello@gmail.com", body: "Hello World", score: 2}}
      expect(assigns(:review)).to eq Review.last
    end

    it "redirects to the new review" do
      post :create, {movie_id: my_movie.id, review: {email: "hello@gmail.com", body: "Hello World", score: 2}}
      expect(response).to redirect_to [my_movie, Review.last]
    end
  end
  describe "GET edit" do
    it "returns http redirect" do
      get :edit, movie_id: my_movie.id, id: my_review.id
      expect(response).to redirect_to(new_movie_path)
    end
  end
end
