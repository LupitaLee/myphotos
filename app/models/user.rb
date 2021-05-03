class User < ApplicationRecord
    has_many :photos
    has_many :comments
    has_many :commented_photos, through: :comments, source: :photo
    has_secure_password

    validates :username, presence: true
    validates :email, presence: true, uniqueness: true 

  
end
