# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :network do
    track nil
    location nil
    description "MyText"
    category "MyString"
  end
end
