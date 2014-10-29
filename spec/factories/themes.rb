# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :theme do
    body "awesome food"
    sentiment_score 0.8
    sentiment_polarity "positive"
  end
end
