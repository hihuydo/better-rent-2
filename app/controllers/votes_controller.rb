class VotesController < ApplicationController
  before_action :authenticate_user!

  def index
    @votes = Vote.all
  end
  
  def new
    @property = Property.find(params[:property_id])
    @project = Project.find(params[:project_id])
    @vote = Vote.new
    @vote.user = current_user
  end

  def create
    @vote = Vote.new(vote_params)
    @property = Property.find(params[:property_id])
    @project = Project.find(params[:project_id])

    # @user = current_user
    @vote.property = @property
    # @vote.property.project_id = @project.id
    @vote.user = current_user

    if @vote.save!
      redirect_to project_properties_path
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end


  private

  def vote_params
    params.require(:vote).permit(:vote_location, :vote_price, :vote_size)
  end
end
