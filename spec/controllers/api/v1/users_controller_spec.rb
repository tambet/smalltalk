require 'rails_helper'

RSpec.describe Api::V1::UsersController, :type => :controller do
  let(:user) { FactoryGirl.create(:user) }
  before(:each) { authWithUser(user) }

  describe "GET show" do
    it "returns current user" do
      get :show, format: :json
      expect(response).to be_success
      expect(json).to have_key 'email'
    end

    it "not return password_digest" do
      get :show, format: :json
      expect(response).to be_success
      expect(json).not_to have_key 'password_digest'
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new User" do
        new_user = FactoryGirl.build(:user)
        post :create, {email: new_user.email, password: new_user.password}
        expect(response).to be_success
        expect(session['user_id']).not_to eq nil
      end
    end

    describe "with invalid params" do
      it "returns all errors" do
        new_user = FactoryGirl.build(:user)
        post :create, {email: new_user.email}
        expect(response.body).to eq "[\"Password can't be blank\"]"
      end
    end
  end

end
