class Comment < ApplicationRecord
  belongs_to :photo
  belongs_to :user
  validates :content, presence: true

  scope :comment_order, -> {order(created_at: :desc)}

 
end
