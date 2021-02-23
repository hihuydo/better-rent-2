class PropertiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @project = Project.find(params[:project_id])
    @properties = @project.properties
  end

  def show
    @property = Property.find(params[:id])
    @vote_check = @property.id
    @project = Project.find(params[:project_id])
    @vote = Vote.new

  end

  def new
    @project = Project.find(params[:project_id])
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @project = Project.find(params[:project_id])
    @user = current_user
    @property.project_id = @project.id
    @property.user = @user
    @property.save
    redirect_to project_properties_path(@project)
  end

  def edit
    @property = Property.find(params[:id])
    @project = Project.find(params[:project_id])
  end

  def update
    @property = Property.find(params[:id])
    @project = Project.find(params[:project_id])
    @property.update(property_params)
    redirect_to project_properties_path(@project)
  end

  def destroy
    @property = Property.find(params[:id])
    project = Project.find(params[:project_id])
    @property.destroy
    redirect_to project_properties_path(project)
  end

  private

  def property_params
    params.require(:property).permit!
  end
end
