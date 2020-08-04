class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|

      t.timestamps
      t.integer :user_id, foreign_key: true
      t.integer :item_id, foreign_key: true
    end
  end
end
