FactoryGirl.define do
  factory :user do
    first_name "Luiz"
    last_name "Branco"
    email "artfikan@gmail.com"
    facebook_id "1031365345"

    after_build { |user| user.class.skip_callback(:create, :after, :create_first_missions) }

    factory :user_with_create_first_missions do
      after_create { |user| user.send(:create_first_missions) }
    end
  end
end

