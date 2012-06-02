class Venue < ActiveRecord::Base
  attr_accessible :venueid, :address, :city, :country, :name, :postalcode, :state, :twitterid, :venueimages, :venueurl

	serialize :venueimages, JSON

	def venueid=(value)
		self.id = value
	end

	def venueid
		self.id
	end
end
