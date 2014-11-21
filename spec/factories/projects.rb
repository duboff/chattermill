# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    name "MyString"
    body "Cool Project"

    factory :project_with_company do
      company
    end
  end
end
