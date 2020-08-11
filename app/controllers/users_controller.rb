class UsersController < ApplicationController
  def show
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.find_by(user_id: current_user.id)

    redirect_to new_card_path and return unless card.present?

    customer = Payjp::Customer.retrieve(card.customer_token)
    @card = customer.cards.first
  end

  def update
    if current_user.update(user_params) # 更新出来たかを条件分岐する
      redirect_to root_path # 更新できたらrootパスへ
    else
      redirect_to "show" # 失敗すれば再度マイページへ
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :first_name, :last_name, :kana_first_name, :kana_last_name, :birth_date) # 編集出来る情報を制限
  end
end
