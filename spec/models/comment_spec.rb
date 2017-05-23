require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:name) { "Hello" }
  let(:body) { "Helloworld" }
  let(:movie) { create(:movie) }
  let(:review) { create(:review) }
  let(:comment) { create(:comment, review: my_review ) }

  it { is_expected.to belong_to(:review) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:body) }

  describe "attributes" do
      it "has name and body attributes" do
          expect(comment).to have_attributes(name: "Hello", body: "Helloworld")
      end
  end
end
