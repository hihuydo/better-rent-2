class Property < ApplicationRecord
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many_attached :photos

  def address
    [street, number, zipcode, city].compact.join(', ')
  end

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_zipcode?
end
