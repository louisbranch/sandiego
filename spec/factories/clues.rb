FactoryGirl.define do
  factory :clue do
    description "MyText"
    association :location
  end
end

