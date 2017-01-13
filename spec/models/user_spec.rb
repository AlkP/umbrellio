require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  it 'not validates dublicate login' do
    expect(User.new(login: 'User', password_digest: 'Password')).to be_valid
  end
  it 'not validates nil pasword' do
    expect(User.new(login: 'User2', password_digest: nil)).to be_valid
  end
end
