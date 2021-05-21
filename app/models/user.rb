class User < ApplicationRecord
    has_many :photos
    has_many :comments
    has_many :commented_photos, through: :comments, source: :photo
    has_secure_password
    has_one_attached :avatar
    

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true 

    validates :username, presence: true
    scope :search, -> (params){where("LOWER(username)= ?", params)}

  
end
