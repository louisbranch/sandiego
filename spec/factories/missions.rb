FactoryGirl.define do
  factory :mission do
    association :user
    association :rank
    end_date "2012-01-05"

    after_build { |mission| mission.class.skip_callback(:create, :after, :create_mission_suspect) }

  end
end

