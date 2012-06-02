class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.integer :sequence
      t.string :artist
      t.integer :artistid
      t.string :billing
      t.string :links

      t.timestamps
    end
  end
end
