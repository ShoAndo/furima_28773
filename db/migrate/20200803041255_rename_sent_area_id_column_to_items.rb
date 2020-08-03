class RenameSentAreaIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :sent_area_id, :prefecture_id
  end
end
