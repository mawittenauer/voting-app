class CreateSides < ActiveRecord::Migration
  def change
    create_table :sides do |t|
      t.string :title
      t.integer :campaign_id
      t.timestamps
    end
  end
end
