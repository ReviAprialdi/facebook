require 'rails_helper'

RSpec.describe Comment, :type => :model do  
  it "should create new comment if comment is presece" do
    comment = Comment.new(comment: "testing", user_id: 1, status_id: 1)
    expect(comment.save).to eq(true)
  end
end
