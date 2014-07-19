require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should have_many(:posts) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }

  describe '.authenticate' do
    let(:user) { FactoryGirl.create(:user) }

    context 'with non existent' do
      it { expect(User.authenticate('no@example.com', 'test')).to be(nil) }
    end

    context 'with invalid password' do
      it { expect(User.authenticate(user.email, 'test')).to be(nil) }
    end

    context 'with valid credentials' do
      it { expect(User.authenticate(user.email, user.password)).to eq(user) }
    end

  end
end
