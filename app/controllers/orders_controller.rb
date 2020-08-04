class OrdersController < ApplicationController
  before_action :move_to_index, :find_item

  def index
    authenticate_user!
    @user_pay = UserPay.new
  end

  def create
    @user_pay = UserPay.new(order_params)
   
    if @user_pay.valid?
      pay_item
      @user_pay.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:user_pay).permit(:post_number, :prefecture_id, :city, :address,
                                     :building, :phone_number).merge(price: @item.price, user_id: current_user.id, item_id: @item.id)
  end
 
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: params[:token],
      currency:'jpy'
    )
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def find_item
    @item = Item.find(params[:item_id])
  end
end
