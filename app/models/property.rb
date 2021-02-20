class Property < ApplicationRecord
  belongs_to :user
  has_many :votes
  has_many_attached :photos
end
