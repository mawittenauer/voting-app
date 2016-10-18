class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :side_id, :user_id, :campaign_id
      t.timestamps
    end
  end
end
