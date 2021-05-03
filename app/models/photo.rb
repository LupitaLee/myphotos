class Photo < ApplicationRecord
  belongs_to :user
  has_many :comments 
  has_many :users, through: :comments

  validates :title, presence: true
  scope :search, -> (params){where("LOWER(title)= ?", params)}
 
  

  # def self.search(params)
  #   where("LOWER(title)= ?", params)
  # end
end
