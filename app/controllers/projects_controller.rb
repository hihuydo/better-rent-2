class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    # function checked and needed
    @projects = policy_scope(Project).order(created_at: :desc)
    @user = current_user
  end

  # Do we use this? 
  
  # def show
  #   @project = Project.find(params[:id])
  #   @properties = @project.properties # probably needs to be refactored to get all properties of that project
  #   @markers = @properties.geocoded.map do |prop|
  #     {
  #       lat: prop.latitude,
  #       lng: prop.longitude
  #     }
  #   end
  # end

  def new
    # function checked and needed
    # everyone can create a project
    @project = Project.new
    @user = current_user
    authorize @project
  end

  def create
    # function checked and needed
    # everyone can create a project
    @project = Project.new(project_params)
    authorize @project
    @project.user = current_user

    if @project.save
      redirect_to projects_path
    else
      redirect_to projects_path(@project)
    end
  end

  def edit
    # function checked and needed
    # only person who create can edit 
    @project = Project.find(params[:id])
    @user = current_user
    authorize @project
  end

  def update
    # function checked and needed
    # only person who create can update
    @project = Project.find(params[:id])
    authorize @project
    @project.update(project_params)
    redirect_to projects_path
  end

  def destroy
    @project = Project.find(params[:id])
    authorize @project
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :stage, :description)
  end
end
