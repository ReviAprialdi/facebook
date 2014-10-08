class Status < ActiveRecord::Base
  validates :status, presence: true
  belongs_to :user
  has_many :comments
end
