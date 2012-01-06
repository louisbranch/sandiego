FactoryGirl.define do
  factory :mission do
    association :user
    association :rank
    prize 10
    end_date "2012-01-05"
  end
end

