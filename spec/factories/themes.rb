# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :theme do
    body "MyString"
    sentiment_score 1.5
    sentiment_polarity "MyString"
  end
end
