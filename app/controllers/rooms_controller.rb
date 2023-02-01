class RoomsController < ApplicationController
  
  def new
    @room = Room.new
  end

  def index
    @rooms = Room.all
  end

  def create
    @room = Room.new(room_params)
    binding.pry
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

end
