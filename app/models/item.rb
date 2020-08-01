class Item < ApplicationRecord
  extend Activehash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :delivery_burden
  belongs_to_active_hash :sent_area
  belongs_to_active_hash :send_date
  has_one_attached :image

  with_options presence: true do
    validates name, length: { maxmum: 40 }
    validates text, length: { maxmum: 1000 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                                      message: 'is out of setting range' }
  end

  validates :image, :category, :item_status, :delivery_burden, :sent_area, :send_date, presence: true
  validates :category_id, :item_status_id, :delivery_burden_id, :sent_area_id, :send_date_id, numericality: { other_than: 1 }
end
