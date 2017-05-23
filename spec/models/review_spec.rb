require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:reviewer) { "Hello" }
  let(:body) { "Helloworld" }
  let(:score) { 4 }
  let(:email) { "wnfld@gmail.com" }

  let(:movie) { create(:movie) }
  let(:review) { create(:review) }

  it { is_expected.to have_many(:comments) }

  it { is_expected.to belong_to(:movie) }

  it { is_expected.to validate_presence_of(:reviewer) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:movie) }
  it { is_expected.to validate_presence_of(:score) }
  it { is_expected.to validate_presence_of(:email) }

  describe "attributes" do
      it "has reviewer, body, score, and email attributes" do
          expect(review).to have_attributes(reviewer: review.reviewer, body: review.body, score: review.score, email: review.email )
      end
  end
end
