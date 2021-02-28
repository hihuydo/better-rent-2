class ChatroomsController < ApplicationController
  def show
    # @property = Property.find(params[:property_id])
    # @project = Project.find(params[:project_id])
    @chatroom = Chatroom.find(params[:id])
  end
end
