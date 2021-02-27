class ParticipantsController < ApplicationController
  before_action :authenticate_user!

  def index
    @project = Project.find(params[:project_id])
    @participants = Participant.where(project_id: @project.id)
    skip_policy_scope
    # @participants = policy_scope(Participant)
    # just needed for test purposes - can be dele@tet
    @user = current_user

  end

  def new
    @project = Project.find(params[:project_id])
    @participant = Participant.new
    # function checked and needed
    # only the user who created the project can add team members
    authorize @participant

    @user = current_user
  end

  def create
    @participant = Participant.new(participant_params)
    # function checked and needed
    # only the user who created the project can add team members
    authorize @participant

    @project = Project.find(params[:project_id])
    @participant.project_id = @project.id

    # just needed for test purposes - can be deletet
    @user = current_user

    if @participant.save!
      redirect_to project_participants_path
    else
      redirect_to projects_path(@project)
    end
  end

  def destroy
    @participant = Participant.find(params[:id])
    # only the user who created the project can add team members
    authorize @participant

    @participant.destroy
    redirect_to project_participants_path
  end

  private

  def participant_params
    params.require(:participant).permit(:project_id, :user_id)
  end
end
