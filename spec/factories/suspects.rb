# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :suspect do
    mission nil
    raw_info "MyText"
    facebook_id "MyString"
    name "MyString"
    photo "MyString"
  end
end
