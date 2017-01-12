FactoryGirl.define do
  factory :post do
    title 'MyPost'
    body 'My Text'
    post_ip_value '127.0.0.1'
    user_login 'User'
    user_pasword 'Password'
  end
  factory :post_new, class: 'Post' do
    title 'MyPost2'
    body 'My Text2'
    post_ip_value '127.0.0.2'
    user_login 'User'
    user_pasword 'Password'
  end
  factory :blank_login, class: 'Post' do
    title 'MyPost'
    body 'My Text'
    post_ip_value "127.0.0.1"
    user_login nil
    user_pasword 'Password'
  end
  factory :blank_passwword, class: 'Post' do
    title 'MyPost'
    body 'My Text'
    post_ip_value '127.0.0.1'
    user_login 'User'
    user_pasword nil
  end
  factory :wrong_rating, class: 'Post' do
    title 'MyPost'
    body 'My Text'
    post_ip_value '127.0.0.1'
    user_login 'User'
    user_pasword 'Password'
    rating 100
  end
  factory :wrong_count_rating, class: 'Post' do
    title 'MyPost'
    body 'My Text'
    post_ip_value '127.0.0.1'
    user_login 'User'
    user_pasword 'Password'
    count_rating 100
  end
  factory :wrong_ip, class: 'Post' do
    title 'MyPost'
    body 'My Text'
    post_ip_value 'ff.ff.ff.ff'
    user_login 'User'
    user_pasword 'Password'
  end
end
