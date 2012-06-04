class RemoveAttractionlistFromEvents < ActiveRecord::Migration
  def up
		remove_column :events, :attractionList
  end

  def down
		add_column :events, :attractionList, :string
  end
end
