class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    @property = @chatroom.property
    @project = @property.project_id
    if @message.save
      redirect_to project_property_path(@project, @property, anchor: "message-#{@message.id}")
    else
      render "chatrooms/show"
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @property = Property.find(params[:property_id])
    @message.destroy
    redirect_to project_property_path(@project, @property)
  end

  def message_params
    params.require(:message).permit(:content)
  end
end