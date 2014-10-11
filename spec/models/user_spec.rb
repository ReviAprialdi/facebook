require 'rails_helper'
require 'spec_helper'

RSpec.describe User, :type => :model do

  context "create user" do

    it "should create new user" do
      usernew = User.new(last_name:"Pertiwi",email:"pertiwi@yahoo.com", user_name: 'testing123', password: 'testing12345', first_name: 'test')
      expect(usernew.save).to eq(true)
    end

    it "should not create user if not given valid parameters" do
      usernew = User.new()
      expect(usernew.save).to eq(false)
      expect(usernew.errors.messages.length).to eq(5)
    end

    it "should not create user if user_name has exist" do
      usernew1 = User.new(last_name:"Pertiwi",email:"pertiwi@yahoo.com", user_name: 'testing123', password: 'testing12345', first_name: 'test')
      usernew2 = User.new(last_name:"Pertiwi",email:"pertiwa@yahoo.com", user_name: 'testing123', password: 'testing12345', first_name: 'test')
      expect(usernew1.save).to eq(true)
      expect(usernew2.save).to eq(false)
      expect(usernew2.errors.messages.length).to eq(1)
    end
    
    it "should not create user if email has exist" do
      usernew1 = User.new(last_name:"Pertiwi",email:"pertiwi@yahoo.com", user_name: 'testing123', password: 'testing12345', first_name: 'test')
      usernew2 = User.new(last_name:"Pertiwi",email:"pertiwi@yahoo.com", user_name: 'testing234', password: 'testing12345', first_name: 'test')
      expect(usernew1.save).to eq(true)
      expect(usernew2.save).to eq(false)
      expect(usernew2.errors.messages.length).to eq(1)
    end
    
    it "should be sign_in where using login via facebook" do
      fb_response = OpenStruct.new({ provider: 'facebook', uid: '12354',
                      info: OpenStruct.new({
                        email: 'test@gmail.com',
                        first_name: 'test',
                        last_name: 'testing',
                        name: 'user.testing'
                      })
                    })
      user = User.from_omniauth(fb_response)
      expect(user).not_to eq(nil)
    end
    
    it "should be return user with correct email or user_name" do
      User.create(last_name:"Pertiwi",email:"testing@yahoo.com", user_name: 'testing123', password: 'testing12345', first_name: 'test')
      user = User.find_first_by_auth_conditions(email: 'testing@yahoo.com')
      expect(user).not_to eq(nil)
      user1 = User.find_first_by_auth_conditions(login: 'testing123')
      expect(user1).not_to eq(nil)
    end
    
    it "should create new session with valid params" do
      pSession = {"devise.facebook_data" => {"uid"=> "1111","provider"=> "facebook",
          "extra" => {"gender"=> "male",
              "raw_info"=> {
                    "name"=> "Revi",
                    "username"=> "Revialdi",
                    "email"=> "aa@yahoo.com"
                    }
          }
      }
      }
      user = User.new_with_session({},pSession)
      expect(user.email).to eq("aa@yahoo.com")
    end
  end
end
