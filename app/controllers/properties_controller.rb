class PropertiesController < ApplicationController
  before_action :authenticate_user!

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user
    @property.project_id = request.path[10] # this needs to be refactored!
    @property.save
    redirect_to projects_path
  end

  private

  def property_params
    params.require(:property).permit!
  end
end
