class ParticipantsController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
    @participants = @project.participants
  end

  def new
    @project = Project.find(params[:project_id])
    @participant = Participant.new
  end

  def create
    @participant = Participant.new
    @project = Project.find(params[:project_id])
    @user = current_user
    @participant.project_id = @project.id
    @participant.user = @user
    @participant.save
    # redirect_to
  end

  def destroy
    @participant = Participant.find(params[:id])
    participant = Participant.find(params[:project_id])
    @participant.destroy
    # redirect_to
  end
end
