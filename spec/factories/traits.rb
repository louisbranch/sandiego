FactoryGirl.define do
  factory :trait do
    category "MyString"
    description "MyText"
    association :suspect
  end
end

