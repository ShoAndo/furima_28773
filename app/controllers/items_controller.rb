class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :text, :price, :category_id, :item_status_id,
                                 :delivery_burden_id, :sent_area_id, :send_date_id)
  end
end