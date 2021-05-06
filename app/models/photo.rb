class Photo < ApplicationRecord
  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :users, through: :comments

  validates :title, presence: true
  scope :search, -> (params){where("LOWER(title)= ?", params)}

 
  scope :desc_order, -> {order(created_at: :desc)}



  
 
  
end
