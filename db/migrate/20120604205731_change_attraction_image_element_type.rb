class ChangeAttractionImageElementType < ActiveRecord::Migration
  def up
		remove_column :attractions, :image
		add_column :attractions, :image, :text
  end

  def down
		remove_column :attractions, :image
		add_column :attractions, :image, :string
  end
end
