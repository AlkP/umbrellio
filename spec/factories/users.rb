FactoryGirl.define do
  factory :user do
    login "User"
    password "Password"
    password_confirmation  "Password"
  end
end
