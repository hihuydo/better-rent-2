class Project < ApplicationRecord
  belongs_to :user
  has_many :properties, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :votes, through: :properties, dependent: :destroy


  # def property_sum
  #   properties.each do |property|
  #     property.votes do |vote|
  #       vote.vote_average
  #     end
  #   end
  # end

  # def project_total_stage_1
  #   vote_average = 0
  #   properties.each do |property|
  #     property.votes.where(stage: 1).each do |vote|
  #       vote_average += vote.vote_average
  #     end
  #   end
  #   return vote_average / participants.count / properties.count
  # end
end
