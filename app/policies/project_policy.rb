class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  def create? 
    return true
  end 

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end     

  def change_stage?
    return true
  end

  def stage?
    return true
  end 

end
