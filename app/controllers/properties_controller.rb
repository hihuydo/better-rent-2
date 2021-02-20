class PropertiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
  end

  def show
    @property = Property.find(params[:id])
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user
    @property.save
    redirect_to projects_path(@project)
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
