class PropertiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @project = Project.find(params[:project_id])
    @properties = @project.properties
    @participants = Participant.where(project_id: @project.id)

    # Stage one Vote count
    @vote_array_1 = []
    @properties.each do |property| 
      @vote_array_1 <<  Vote.where(property_id: property.id, stage: 1).count
    end
    @all_votes_stage_1 =  @vote_array_1.nil? ? 0 : @vote_array_1.sum 

    # Stage two Vote count
    @vote_array_2 = []
    @properties.each do |property| 
      @vote_array_2 <<  Vote.where(property_id: property.id, stage: 2).count
    end
    @all_votes_stage_2 = @vote_array_2.nil? ? 0 : @vote_array_1.sum 

    # Stage one Vote average
    @vote_array_average_1 = []
    @average_1 = 0
    @properties.each do |property| 
      @vote_array_average_1 << Vote.find_by(property_id: property.id, stage: 1)
      @vote_array_average_1.each do |vote|
        @average_1 += vote.vote_average
      end
    end

    raise




    @markers = @properties.geocoded.map do |prop|
      {
        lat: prop.latitude,
        lng: prop.longitude
      }
    end
  end

  def show
    @property = Property.find(params[:id])
    @project = Project.find(params[:project_id])
    @vote = Vote.new

    @chatroom = Chatroom.find(@property.chatroom.id)
    @message = Message.new

    @user = current_user
    @vote.user = current_user
    # @vote_check = Vote.where(user_id: current_user, property_id: @property.id)
    @vote_check = Vote.find_by(user_id: current_user, property_id: @property.id, stage: @project.stage )

    # Find all Votes in the stage for the team
    @votes_all_team = Vote.where(property_id: @property.id, stage: @project.stage)
    # Finde all votes of the collaborators in the team without the current user votes
    @votes_collaborators = @votes_all_team.where.not(user_id: current_user)
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
    if @property.save
      p = Property.find(@property.id)
      @chatroom = Chatroom.create(property_id: p.id)
      redirect_to project_properties_path(@project)
    end
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
