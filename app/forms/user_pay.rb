class UserPay

  include ActiveModel::Model
  attr_accessor :price, :post_number, :prefecture_id, :city, :address, :building, :phone_number, :item_id, :user_id

  post_num = "\A\d{3}[-]\d{4}\z"
  phone_num = "[0-9]{,11}"
  with_options presence: true do
    validates :prefecture_id, :city, :address
    validates :post_number, format: { with: /#{post_num}/, message: "is invalid. Include hyphen(-)" }
    validates :phone_number, format: { with: /#{phone_num}/, message: "is invalid. Max length is 11 numbers" }
    validates :price, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: "is out of setting range"}
  end

  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    Order.create(price: price)
    Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post_number: post_number, prefecture_id: prefecture_id, city: city, address: address, 
                   building: building, phone_number: phone_number, item_id: item_id)
  end
end