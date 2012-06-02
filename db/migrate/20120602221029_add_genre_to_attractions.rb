class AddGenreToAttractions < ActiveRecord::Migration
  def change
		add_column :attractions, :genre, :string
  end
end
