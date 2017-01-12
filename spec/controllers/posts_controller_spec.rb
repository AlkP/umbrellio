require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'user error validate' do
    it 'nil login: return status 422'
    #   FactoryGirl
    it 'nil password: return status 422'
    it 'wrong password: return status 422'
  end
  describe 'if all coorect return status 200 and attributes new post' do
    it 'user new: registrate user, return status 200 and return post'
    it 'user old: return status 200 and return post'
  end
end
