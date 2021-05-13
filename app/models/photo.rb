class Photo < ApplicationRecord
  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :users, through: :comments
  has_many_attached :images

  validates :title, presence: true
  scope :search, -> (params){where("LOWER(title)= ?", params)}

 
  scope :desc_order, -> {order(created_at: :desc)}

  scope :most_commented, -> {joins(:comments).order( self.calculate(:count, :id))}



  
 
  
end
