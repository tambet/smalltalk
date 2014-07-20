require 'rails_helper'

RSpec.describe Api::V1::SessionsController, :type => :controller do
  let(:user) { FactoryGirl.create(:user) }

  describe "POST create" do
    describe "with no credentials" do
      it "returns unauthorized" do
        post :create
        expect(response.status).to eq 401
      end
    end

    describe "with invalid credentials" do
      it "returns unauthorized" do
        user.password = 'invalid'
        basic_auth(user)
        post :create
        expect(response.status).to eq 401
      end
    end

    describe "with valid credentials" do
      it "creates a new session" do
        basic_auth(user)
        post :create
        expect(response).to be_success
        expect(session['user_id']).to eq(user.id)
      end
    end
  end

  describe "DELETE destory" do
    it "clears user session" do
      basic_auth(user)
      post :create
      expect(session['user_id']).not_to eq nil
      delete :destroy
      expect(session['user_id']).to eq nil
    end
  end

end
