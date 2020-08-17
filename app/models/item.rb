class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :delivery_burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :send_date
  has_many_attached :images
  belongs_to :user
  has_one :address
  has_one :purchase
  has_many :items_tags
  has_many :tags, through: :items_tags
  has_one :room
  has_many :messages

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :images, :category, :item_status, :delivery_burden, :prefecture, :send_date
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                                      message: 'が可能な範囲を超えています' }
  end
  validates :category_id, :item_status_id, :delivery_burden_id, :prefecture_id, :send_date_id, numericality: { other_than: 1 }
  
end
