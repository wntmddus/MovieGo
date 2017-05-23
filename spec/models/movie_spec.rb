require 'rails_helper'

RSpec.describe Movie, type: :model do
  let(:movie) { create(:movie) }

  it { is_expected.to have_many(:reviews) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:release_date) }
  it { is_expected.to validate_presence_of(:genre)}
  it { is_expected.to validate_presence_of(:image_url)}
  it { is_expected.to validate_presence_of(:rating)}

  describe "attributes" do
    it "has title, release_date, genre, image_url and rating" do
      expect(movie).to have_attributes(title: movie.title, release_date: movie.release_date, genre: movie.genre, image_url: movie.image_url, rating: movie.rating)
    end
  end
end
