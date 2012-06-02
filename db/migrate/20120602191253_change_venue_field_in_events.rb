class ChangeVenueFieldInEvents < ActiveRecord::Migration
  def up
		remove_column :events, :venue
		add_column :events, :venueid, :integer
  end

  def down
		remove_column :events, :venueid
		add_column :events, :venue, :integer
  end
end
