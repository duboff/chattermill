FactoryGirl.define do
  factory :user do
    first_name "James"
    last_name "Bond"
    email "test@example.com"
    password "please123"
    
    factory :user_with_posts do
      company
    end
  end
end
