class Property < ApplicationRecord
  belongs_to :user
  has_many :votes
  has_many_attached :photos
  has_one :chatroom, dependent: :destroy
  has_many :messages, through: :chatroom, dependent: :destroy
  after_create :create_chatroom

  def address
    [street, number, zipcode, city].compact.join(', ')
  end

  def self.create_chatroom
    self.chatroom.create!
  end

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_zipcode?
end
