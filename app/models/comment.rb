class Comment < ApplicationRecord
  belongs_to :photos
  belongs_to :user
end
