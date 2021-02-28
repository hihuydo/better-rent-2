class VotesController < ApplicationController
  before_action :authenticate_user!

  # Do we need?
  # def index
  #   @votes = Vote.all
  # end

  def show
    @property = Property.find(params[:property_id])
    @project = Project.find(params[:project_id])
    @vote.user = current_user
<<<<<<< HEAD
    @vote = Vote.find(params[:id]) 
    authorize @vote

  end 
=======
    @vote = Vote.find(params[:id])
  end

>>>>>>> master

  def new
    @property = Property.find(params[:property_id])
    @project = Project.find(params[:project_id])
    @vote = Vote.new
    authorize @vote
    @vote.user = current_user
  end

  def create
    @vote = Vote.new(vote_params)
    authorize @vote
    @property = Property.find(params[:property_id])
    @project = Project.find(params[:project_id])
    @vote.property = @property
    @vote.user = current_user
    @vote.stage = @project.stage
    @vote.vote_average =  ((@vote.vote_price.to_f + @vote.vote_location.to_f + @vote.vote_size.to_f) / 3.to_f).round(1)

    if @vote.save!
      redirect_to project_property_path(@project, @property)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def destroy
    @vote = Vote.all
    # skiping pundit because you can only see the button if you are a participant
    # skip_policy_scope

    @vote.destroy_all

    authorize @vote

    @property = Property.find(params[:property_id])
    @project = Project.find(params[:project_id])


    redirect_to project_property_path(@project, @property)
  end

  private

  def vote_params
    params.require(:vote).permit(:vote_location, :vote_price, :vote_size)
  end
end
