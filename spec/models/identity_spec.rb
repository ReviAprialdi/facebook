require 'rails_helper'

RSpec.describe Identity, :type => :model do
  it "should be return identity" do
    auth = OpenStruct.new({provider:"facebook",uid:"1234"})
    identity = Identity.find_for_oauth(auth)
    expect(identity).not_to eq(nil)
  end
end
