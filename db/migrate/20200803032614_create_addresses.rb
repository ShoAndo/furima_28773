class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.timestamps
      t.string :post_number,    null: false
      t.integer :prefecture_id, null: false
      t.string :city,           null: false
      t.string :address,        null: false 
      t.string :building,       null: true
      t.string :phone_number,   null: false
      t.integer :item_id,       null: false, foreign_key: true
    end
  end
end
