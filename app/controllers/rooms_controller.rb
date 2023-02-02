class RoomsController < ApplicationController
  before_action :move_to_new, only: :new
  def new
    @room = Room.new
  end

  def index
    @rooms = Room.all
  end

  def create
    @room = Room.new(room_params)
    @room.user = current_user
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end

  private

  def room_params
    params.require(:room).permit (:name)
  end

  def move_to_new
    unless user_signed_in? && current_user.admin?
      redirect_to root_path
    end
  end

end
