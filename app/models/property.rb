class Property < ApplicationRecord
  belongs_to :user
  has_many :votes, dependent: :destroy
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


  def all_votes_casted_1?
    project = Project.where(project_id: project_id)
    participants = Participant.where(project_id: project_id).count
    votes = Vote.where(stage: 1, property_id: id).count
    return votes == participants ? true : false
  end

  def made_stage_2?
    project = Project.where(project_id: project_id)
    properties = Property.count
    participants = Participant.where(project_id: project_id)
    votes = Vote.where(stage: 1, property_id: id).count
    property_average = vote_sum_stage_1
    project_average = (project_sum_stage_1 / participants.count / properties)

    property_average > project_average ? true : false
  end

  def vote_sum_stage_1
    participants = Participant.where(project_id: project_id)
    vote_sum = 0
    votes.where(stage: 1).each do |vote|
      vote_sum += vote.vote_average
    end
    return vote_sum / participants.count
  end

  def vote_sum_stage_2
    participants = Participant.where(project_id: project_id)
    vote_sum = 0
    votes.where(stage: 2).each do |vote|
      vote_sum += vote.vote_average
    end
    return vote_sum / participants.count
  end

private

  def project_sum_stage_1
    vote_average = 0
    Vote.where(stage: 1).each do |vote|
      vote_average += vote.vote_average
    end
    return vote_average 
  end



  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_zipcode?
end
