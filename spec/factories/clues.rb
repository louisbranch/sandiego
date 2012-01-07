# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :clue do
    type ""
    description "MyText"
    suspect nil
  end
end
