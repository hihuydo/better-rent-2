class ParticipantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def destroy?
    return true
  end

  def change_stage
    return true
  end

  def progress
    return true
  end 

end
