class VotesController < ApplicationController
  before_action :authenticate_user!

  def index
    @votes = Vote.all
  end

  def show
    @property = Property.find(params[:property_id])
    @project = Project.find(params[:project_id]) 
    @vote.user = current_user
    @vote = Vote.find(params[:id]) 
    @vote_user = Vote.where(user_id: current_user, property_id: @property.id)
    raise
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
    @vote.property = @property
    @vote.user = current_user
    @vote.vote_average =  ((@vote.vote_price.to_f + @vote.vote_location.to_f + @vote.vote_size.to_f) / 3.to_f).round(1)

    if @vote.save!
      redirect_to project_property_path(@project, @property)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def destroy
    @property = Property.find(params[:property_id])
    @project = Project.find(params[:project_id])
    @vote = Vote.all
    @vote.destroy_all
    redirect_to project_property_path(@project, @property)

  end

  private

  def vote_params
    params.require(:vote).permit(:vote_location, :vote_price, :vote_size)
  end
end
