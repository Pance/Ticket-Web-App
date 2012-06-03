class AddImageAndVideoToAttractions < ActiveRecord::Migration
  def change
    add_column :attractions, :image, :string
    add_column :attractions, :video, :string
  end
end
