FactoryGirl.define do
  factory :user do
    login 'User'
    password_digest 'Password'
  end
end
