require 'random_data'
FactoryGirl.define do
  factory :review do
    reviewer 'name'
    email '123@gmail.com'
    body 'body'
    score 2
    movie
  end
end
