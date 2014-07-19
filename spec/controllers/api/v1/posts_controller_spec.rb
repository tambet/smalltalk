require 'rails_helper'

RSpec.describe Api::V1::PostsController, :type => :controller do

  let(:user) { FactoryGirl.create(:user) }

  it "with no authentication" do
    get :index, format: :json
    expect(response.status).to eq(401)
  end

  it "with authentication" do
    authWithUser(user)
    get :index, format: :json
    expect(response).to be_success
  end

end
