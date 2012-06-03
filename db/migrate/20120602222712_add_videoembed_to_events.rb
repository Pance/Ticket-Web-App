class AddVideoembedToEvents < ActiveRecord::Migration
  def change
		add_column :events, :videoembed, :string
  end
end
