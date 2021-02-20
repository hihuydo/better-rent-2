class PropertiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
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


    @property.save!
    redirect_to project_path(@project)
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    @property.update(property_params)
    redirect_to projects_path(@project)
  end


  private

  def property_params
    params.require(:property).permit!
  end
end
