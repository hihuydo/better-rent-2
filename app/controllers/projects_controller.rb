class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @booking = Project.new
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    # @project.user = current_user
    if @project.save
      redirect_to projects_path
    else
      redirect_to projects_path(@project)
    end
  end

  def edit
    @projects = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to projects_path
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  def project_params
    params.require(:project).permit(:name, :stage)
  end
end
