class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :venueurl
      t.string :city
      t.string :state
      t.integer :postalcode
      t.string :country
      t.string :address
      t.string :twitterid
      t.string :venueimages

      t.timestamps
    end
  end
end
