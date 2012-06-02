class Event < ActiveRecord::Base
  attr_accessible :eventid, :additionallistingtext, :attractionList, :dates, :description, :eventimages, :eventname, :eventurl, :facebookeventid, :prices, :status, :tags, :venueid, :venue

	serialize :dates, JSON

	def eventid=(value)
		self.id = value
	end

	def eventid
		self.id
	end

	def venue=(value)
		self.venueid = value["venueid"]
		loaded_venue = Venue.new(value)
		loaded_venue.save
	end

	def venue
		Venue.find(self.venueid)
	end
	
end
