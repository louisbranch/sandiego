# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :track do
    mission nil
    location nil
    level 1
    correct false
    initial false
    final false
  end
end
