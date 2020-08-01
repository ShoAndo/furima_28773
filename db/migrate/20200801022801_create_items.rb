class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string :image, null: false
      t.string :name ,null:false
      t.text :text, null: false
      t.integer :price, null: false
      #t.integer :user_id, null: false
      t.integer :category_id , null: false
      t.integer :item_status_id , null: false
      t.integer :delivery_burden_id, null: false
      t.integer :sent_area_id, null: false
      t.integer :send_date_id, null: false
    end
  end
end
