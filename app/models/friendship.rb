class Friendship < ActiveRecord::Base
  belongs_to :requester, class_name: "User"
  belongs_to :responder, class_name: "User"
  validates :requester_id, presence: true
  validates :responder_id, presence: true
end
