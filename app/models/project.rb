class Project < ApplicationRecord
  belongs_to :user
  has_many :properties, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :votes, through: :properties, dependent: :destroy


  def properties_in_stage_2
    properties = Property.where(project_id: id)
    properties_count = Property.where(project_id: id).size

    properties_stage_2 = 0 
    properties.each do |property|
      if property.made_stage_2? == true
        properties_stage_2 += 1
      end
    end
    return properties_stage_2
  end

  def highest_rating_stage_2
    properties = Property.where(project_id: id)
    result_array = []
    properties.each do |property|
      if property.made_stage_2? == true
        result_array << property.vote_average_stage_2
      end
    end
    return result_array.max
  end

  def stage_2_completet? 
    participants = Participant.where(project_id: self.id).count
    properties = Property.where(project_id: id)
    votes = Vote.where(stage: 2).count

    if properties_in_stage_2 == 0
      false
    else 
      votes / properties_in_stage_2 == participants ? true : false
    end
  end
end
