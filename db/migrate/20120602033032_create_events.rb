class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :facebookeventid
      t.string :eventname
      t.string :description
      t.string :eventurl
      t.string :additionallistingtext
      t.string :status
      t.string :tags
      t.string :dates
      t.integer :venue
      t.string :eventimages
      t.string :prices
      t.string :attractionList

      t.timestamps
    end
  end
end
