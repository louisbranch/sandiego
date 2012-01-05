# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mission do
    user nil
    prize 1
    end_date "2012-01-05"
  end
end
