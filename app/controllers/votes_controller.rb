class VotesController < ApplicationController
  def index
    @votes = Vote.all
  end
  
  def new
    @property = Property.find(params[:property_id])
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(vote_params)
    @property = Property.find(params[:property_id])
    @user = current_user
    @vote.property = @property
    @vote.user = @user
    @vote.save!
    redirect_to property_votes_path
  end

  private

  def vote_params
    params.require(:vote).permit(:vote_location)
  end
end
