class Comment < ActiveRecord::Base
  validates :comment, :user_id, :status_id, presence: true
  belongs_to :status
  belongs_to :user
end
