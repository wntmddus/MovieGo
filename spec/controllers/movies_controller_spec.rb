require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let(:my_movie) { create(:movie) }
  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns my_movie to @movies" do
      get :index
      expect(assigns(:movies)).to eq([my_movie])
    end
  end
  describe "GET show" do
    it "returns http success" do
      get :show, {id: my_movie.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: my_movie.id}
      expect(response).to render_template :show
    end

    it "assigns my_movie to @movie" do
      get :show, {id: my_movie.id}
      expect(assigns(:movie)).to eq(my_movie)
    end
  end
end
