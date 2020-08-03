class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :delivery_burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :send_date
  has_one_attached :image
  belongs_to :user
  has_one :address
  has_one :purchase

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :image, :category, :item_status, :delivery_burden, :prefecture, :send_date
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                                      message: 'is out of setting range' }
  end
  validates :category_id, :item_status_id, :delivery_burden_id, :prefecture_id, :send_date_id, numericality: { other_than: 1 }
end
