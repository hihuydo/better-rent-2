class Project < ApplicationRecord
  belongs_to :user
  has_many :properties, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :votes, through: :properties, dependent: :destroy
end
