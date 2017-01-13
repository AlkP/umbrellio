require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:post) { FactoryGirl.create(:post) }
  
  describe 'user error validate' do
    it 'nil login: return status 422' do
      xhr :post, :create, { post: { title: "MyPost", body: "Some text", user_password: 'Password', post_ip_value: '127.0.0.1' }, format: :json } 
      expect(response.status).to eq(422)
    end
    
    it 'nil password: return status 422' do
      xhr :post, :create, { post: { title: "MyPost", body: "Some text", user_login: 'User', post_ip_value: '127.0.0.1' }, format: :json } 
      expect(response.status).to eq(422)
    end
    
    it 'wrong password: return status 422' do
      xhr :post, :create, { post: { title: "MyPost", body: "Some text", user_login: 'User', user_password: 'WrongPassword', post_ip_value: '127.0.0.1' }, format: :json }
      expect(response.status).to eq(422)
    end
  end
  
  describe 'Post error' do
    it 'post new: registrate user, return status 422' do
      xhr :post, :create, { post: { title: "MyPost", body: "Some text", user_login: 'UserNew', user_password: 'NewPassword', post_ip_value: '127.0.0.1' }, format: :json }
      expect(response.status).to eq(422)
    end
    
    it 'user new: registrate user, return status 200 and return post' do
      xhr :post, :create, { post: { title: "MyPost", body: "Some text", user_login: 'UserNew', user_password: 'NewPassword', post_ip_value: '127.0.0.1' }, format: :json }
      expect(response.status).to eq(422)
    end
  end
  
  describe 'if all coorect return status 200 and attributes new post' do
    it 'user new: registrate user, return status 200 and return correct post, and create correct User' do
      xhr :post, :create, { post: { title: "MyPost", body: "Some text", user_login: 'UserNew', user_password: 'NewPassword', post_ip_value: '127.0.0.1' }, format: :json }
      expect(response.status).to eq(200)
      userNew = User.last
      postNew = Post.last
      expect(userNew.login).to eq('UserNew')
      expect(assigns(:post)).to be_a_new(Post)
      expect(postNew.rating).to eq(0)
      expect(postNew.count_rating).to eq(0)
    end
    
    it 'user old: return status 200 and return post' do
      xhr :post, :create, { post: { title: "MyPost", body: "Some text", user_login: 'User', user_password: 'Password', post_ip_value: '127.0.0.1' }, format: :json }
      expect(response.status).to eq(200)
      expect(assigns(:post)).to be_a_new(Post)
    end
  end
  
  describe 'add post evaluation' do
    it 'post id correct and valid rating: return status 200 and return new average value' do
      xhr :post, :create, { post: { id: post, rating: 4 }, format: :json }
      expect(response.status).to eq(200)
      expect(assigns(:average)).to eq(4)
      xhr :post, :create, { post: { id: post, rating: 5 }, format: :json }
      expect(response.status).to eq(200)
      expect(assigns(:average)).to eq(4.5)
    end
    
    it 'post id correct but invalid rating: return status 422 and return new average value' do
      xhr :post, :create, { post: { id: post, rating: 4 }, format: :json }
      expect(response.status).to eq(200)
      expect(assigns(:average)).to eq(4)
      xhr :post, :create, { post: { id: post, rating: 6 }, format: :json }
      expect(response.status).to eq(422)
      expect(assigns(:average)).to eq(4)
    end
  end
end
