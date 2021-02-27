class Project < ApplicationRecord
  belongs_to :user
  has_many :properties, dependent: :destroy
  has_many :participants, dependent: :destroy
end
