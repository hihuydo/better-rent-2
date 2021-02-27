class ParticipantsController < ApplicationController
  before_action :authenticate_user!

  def index
    @project = Project.find(params[:project_id])

    @participants = Participant.all
    # @participants = @project.participants
  end

  def new
    @project = Project.find(params[:project_id])
    @participant = Participant.new
  end

  def create
    @participant = Participant.new(participant_params)
    @project = Project.find(params[:project_id])
    @participant.project_id = @project.id

    if @participant.save!
      redirect_to project_participants_path
    else
      redirect_to projects_path(@project)
    end
  end

  def destroy
    @participant = Participant.find(params[:id])
    @participant.destroy
      redirect_to project_participants_path
  end

  private

  def participant_params
    params.require(:participant).permit(:project_id, :user_id)
  end
end
