require 'random_data'
FactoryGirl.define do
  factory :movie do
    title 'moviename'
    release_date '2017-01-01'
    genre 'Action'
    image_url 'http://sss.com'
    rating 4
  end
end
