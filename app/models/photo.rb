class Photo < ApplicationRecord
  belongs_to :user
  has_many :commets 
  has_many :users, through: :comments
end
