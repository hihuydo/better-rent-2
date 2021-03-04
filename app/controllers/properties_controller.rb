class PropertiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @project = Project.find(params[:project_id])
    @properties = @project.properties

    # skipping pundit for now
    skip_policy_scope

    @participants = Participant.where(project_id: @project.id)

    @all_votes = vote_count_stage(@properties, @project)

    @markers = @properties.geocoded.map do |prop|
      {
        lat: prop.latitude,
        lng: prop.longitude
      }
    end
  end

  def show
    @property = Property.find(params[:id])
    authorize @property

    @project = Project.find(params[:project_id])
    @vote = Vote.new

    @chatroom = Chatroom.find(@property.chatroom.id)
    @message = Message.new

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

    # function checked and needed
    # every member can create a property in the project
    authorize @property
  end

  def create
    @property = Property.new(property_params)
    @project = Project.find(params[:project_id])

    # function checked and needed
    # only the user who created the project can add team members
    authorize @property

    @property.project_id = @project.id
    @property.user = current_user


    if @property.save
      # p = Property.find(@property.id)
      # @chatroom = Chatroom.create(property_id: p.id)
      redirect_to project_properties_path(@project)
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @property = Property.find(params[:id])
    authorize @property
  end

  def update
    @project = Project.find(params[:project_id])
    @property = Property.find(params[:id])
    authorize @property
    
    @property.update(property_params)
    redirect_to project_properties_path(@project)
  end

  def destroy
    @project = Project.find(params[:project_id])
    @property = Property.find(params[:id])
    @property.destroy
    authorize @property

    redirect_to project_properties_path(@project)
  end

  private

  def property_params
    params.require(:property).permit!
  end

      
  def vote_count_stage(properties, project)
    vote_array = []
    properties.each do |property| 
      vote_array << Vote.where(property_id: property.id, stage: project.stage).count
    end
    return vote_array.nil? ? 0 : vote_array.sum 
  end
end
