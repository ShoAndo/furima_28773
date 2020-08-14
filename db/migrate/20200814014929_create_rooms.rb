class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|

      t.timestamps
      t.string :name, null: false
      t.references :item, foreign_key: true
    end
  end
end
