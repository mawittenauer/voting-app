class AddVotesCountToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :votes_count, :integer, default: 0
  end
end
