require 'rails_helper'

RSpec.describe Status, :type => :model do
  it "should create new status if status is presence" do
    status = Status.new(status: "testing")
    expect(status.save).to eq(true)
  end
end
