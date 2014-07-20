require 'rails_helper'

RSpec.describe Api::V1::PostsController, :type => :controller do

  let(:user) { FactoryGirl.create(:user) }

  it "with no authentication" do
    get :index, format: :json
    expect(response.status).to eq 401
  end

  it "with authentication" do
    authWithUser(user)
    get :index, format: :json
    expect(response).to be_success
  end

  describe "POST create" do
    before(:each) { authWithUser(user) }

    describe "with valid params" do
      it "creates a new Post" do
        post :create, {heading: 'Heading', body: 'Body'}
        expect(response).to be_success
      end
    end

    describe "with invalid params" do
      it "returns all errors" do
        post :create, {heading: 'Heading'}
        expect(response.body).to eq "[\"Body can't be blank\"]"
      end
    end
  end

  describe "DELETE destroy" do
    before(:each) { authWithUser(user) }
    it "deletes provided post" do
      post = FactoryGirl.create(:post, user: user)
      delete :destroy, {:id => post.id}
      expect(response).to be_success
    end

    it "should not delete another user's post" do
      admin = FactoryGirl.create(:admin)
      post  = FactoryGirl.create(:post, user: admin)
      delete :destroy, {:id => post.id}
      expect(response.status).to eq 403
    end
  end

end
