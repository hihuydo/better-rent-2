class Chatroom < ApplicationRecord
  belongs_to :property
  has_many :messages, dependent: :destroy
end
