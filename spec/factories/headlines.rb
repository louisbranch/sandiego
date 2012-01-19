# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :headline do
    name "MyString"
    description "MyText"
    photo_path "MyString"
  end
end
