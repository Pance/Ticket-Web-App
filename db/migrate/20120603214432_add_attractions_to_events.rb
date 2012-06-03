class AddAttractionsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :attractions, :string
  end
end
