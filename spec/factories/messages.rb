# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    from "MyString"
    body "MyText"
  end
end
