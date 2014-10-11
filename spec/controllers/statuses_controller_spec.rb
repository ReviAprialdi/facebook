require 'rails_helper'

RSpec.describe StatusesController, :type => :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    @user = User.create(last_name:"Pertiwi",email:"pertiwi@yahoo.com", user_name: 'testing123', password: 'testing12345', first_name: 'test')
    Status.create(status: "testing")
  end
  
  describe "GET 'index'" do
    it "should retrun all statutses" do
      sign_in @user
      get :index
      expect(assigns(:statuses)).not_to eq(nil)
    end
  end
  
  describe "POST 'create'" do
    it "should create new statuses" do
      sign_in @user
      post :create,{ status: {status: "test"}},formats: "js"
      assigns(:status.user_id=>1)
      expect(assigns(:status.save)).to eq(true)
    end
  end
end
