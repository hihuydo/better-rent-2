class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    # function checked and needed
    @projects = policy_scope(Project).order(created_at: :desc)
    @user = current_user
  end

  def new
    # function checked and needed
    # everyone can create a project
    @project = Project.new
    authorize @project
    
    # just needed for test purposes - can be deletet
    @user = current_user
  end

  def create
    # function checked and needed
    # everyone can create a project
    @project = Project.new(project_params)
    authorize @project
    @project.user = current_user

    if @project.save!
      current_project = Project.find(@project.id)
      Participant.create!(project_id: current_project.id, user_id: current_user.id)
      redirect_to projects_path
    else
      redirect_to projects_path(@project)
    end
  end

  def edit
    # function checked and needed
    # only person who create can edit 
    @project = Project.find(params[:id])
    authorize @project

    @user = current_user
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

  def set_project
    @project = Project.find(params[:id])
    authorize @project
  end

  def project_params
    params.require(:project).permit(:name, :stage, :description)
  end
end
