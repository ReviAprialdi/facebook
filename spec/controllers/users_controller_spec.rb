require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    @user = User.create(last_name:"Pertiwi",email:"pertiwi@yahoo.com", user_name: 'testing123', password: 'testing12345', first_name: 'test')
    Status.create(status: "testing")
  end

  describe "GET 'view'" do
    it "should return current user statuses if sign in" do
      sign_in @user
      get :view
      expect(response.status).to eq(200)
      expect(assigns(:statuses)).not_to eq(nil)
    end
  end
  
  describe "GET 'edit'" do
    it "should return all iso codes" do
      sign_in @user
      get :edit
      expect(assigns(:codes)).not_to eq(nil)
    end
  end
  
  describe "PATCH 'update" do
    it "should update user" do
      sign_in @user
      patch :update, { user: { first_name: "test", last_name: "testing", contrycode:"+62", phone_number: "123456789123" } }
      expect(response.status).to eq(302)
    end
    it "should not update user" do
      sign_in @user
      patch :update, { user: {  last_name: "", contrycode:"", phone_number: "" } }
      expect(response.status).to eq(302)
    end
  end
end
