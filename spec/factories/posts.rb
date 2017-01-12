FactoryGirl.define do
  factory :post do
    title "MyPost"
    body "My Text"
    post_ip_value "127.0.0.1"
    user_login "User"
    rating 0
    count_rating 0
  end
end
