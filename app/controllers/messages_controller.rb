class MessagesController < ApplicationController

  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @rooms = Room.all
    @messages = @room.messages.includes(:user).order("created_at DESC")
  end


  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      redirect_to room_messages_path(@room)
    end
  end

  def destroy
    message = Message.find_by(id: params[:id], room_id: params[:room_id])
    message.destroy
    redirect_to room_messages_path
  end


  private

    def message_params
      params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
    end

end
