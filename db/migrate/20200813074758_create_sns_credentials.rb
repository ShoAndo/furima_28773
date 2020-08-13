class CreateSnsCredentials < ActiveRecord::Migration[6.0]
  def change
    create_table :sns_credentials do |t|

      t.timestamps
      t.string :provider
      t.string :uid
      t.references :user,  foreign_key: true
    end
  end
end
