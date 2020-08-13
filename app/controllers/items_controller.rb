class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :find_item, only: [:show, :destroy, :edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
    @addresses = Address.all
    @purchases = Purchase.all
  end

  def search
    return nil if params[:input] == ""
    tag = Tag.where(['name LIKE ?', "%#{params[:input]}%"] )
    render json:{ keyword: tag }
   end

  def new
    @item = Item.new
    @tag = Tag.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      tag_name = Tag.new(tag_params)
      tag = Tag.where(tag_name: params[:item][:tag][:tag_name]).first_or_initialize
      if tag.save
        ItemsTag.create(item_id: @item.id, tag_id: tag.id)
      else
        render template: 'items/new'
      end
      redirect_to root_path
    else
      render template: 'items/new'
    end
  end

  def show
    @addresses = Address.all
    @purchases = Purchase.all
  end

  def destroy
    if @item.destroy
      redirect_to action: :index
    else
      render :show
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :category_id, :item_status_id,
                                      :delivery_burden_id, :prefecture_id, :send_date_id, images: []).merge(user_id: current_user.id)
  end

  def tag_params
    params[:item][:tag].permit(:tag_name)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
