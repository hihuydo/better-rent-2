class PropertiesController < ApplicationController
  before_action :authenticate_user!

  require 'open-uri'
  require 'nokogiri'

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
        lng: prop.longitude,
        infoWindow: render_to_string(partial: "infoWindow", locals: { prop: prop }),
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
    if property_params[:offer_url]
      manipulated_params = property_params
      document = Nokogiri::HTML.parse(open("#{property_params[:offer_url]}", 'user-agent' => 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36', 'accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9'))
      price = document.css("div.hardfact").text.to_f
      geo = document.css("div.location span.no_s").text
      location = geo.split
      zipcode = location[0]
      city = location[1]
      street = location[3]
      number = "#{location[4]}#{location[5]}"
      manipulated_params[:rent_per_sqm] = price
      manipulated_params[:city] = city
      manipulated_params[:zipcode] = zipcode
      manipulated_params[:street] = street
      manipulated_params[:number] = number
      @property = Property.new(manipulated_params)
      @project = Project.find(params[:project_id])
      authorize @property
      @user = current_user
      @property.project_id = @project.id
      @property.user = @user
    else
      @property = Property.new(property_params)
      @project = Project.find(params[:project_id])
      authorize @property
      @user = current_user
      @property.project_id = @project.id
      @property.user = @user
    end
    @property.save
    redirect_to project_properties_path(@project)
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
    return vote_array.sum
  end
end
