class RoomsController < ApplicationController
  before_action :find_item, only: [:new, :create, :destroy]

  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to item_room_messages_path(item_id: @item.id, room_id: @room.id)
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to item_rooms_path(@item.id)
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def room_params
    params.require(:room).permit(:name, :item_id, user_ids: []).merge(item_id: @item.id)
  end
end
