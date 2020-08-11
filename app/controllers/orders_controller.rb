class OrdersController < ApplicationController
  before_action :move_to_index, :find_item

  def index
    authenticate_user!
    
    #出品者が直接購入ページに遷移してくるとトップページに飛ぶ
    if current_user.id == @item.user_id
      return redirect_to root_path
    end
    #購入済みの商品の購入ページに直接遷移してくるとトップページに飛ぶ
    if Purchase.where(user_id: current_user.id ) != []
      return redirect_to root_path
    end
    @user_pay = UserPay.new
  end

  def create
    @user_pay = UserPay.new(order_params)

    if current_user.card.present?

      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      customer_token = current_user.card.customer_token
      Payjp::Charge.create(
        amount: @item.price,
        customer: customer_token,
        currency: 'jpy' 
        )

        if @user_pay.valid?
          @user_pay.save
          return redirect_to root_path
        else
          render :index
        end
    else

      if @user_pay.valid?
        pay_item
        @user_pay.save
        return redirect_to root_path
      else
        render :index
      end
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
