class Event < ActiveRecord::Base
  attr_accessible :videoembed, :eventid, :additionallistingtext, :attractionList, :dates, :description, :eventimages, :eventname, :eventurl, :facebookeventid, :prices, :status, :tags, :venueid, :venue

	serialize :dates, JSON
	serialize :attractionList, JSON
	serialize :attractions, JSON

	def after_initialize
		self.attractions = []
	end

	def eventid=(value)
		self.id = value
	end

	def eventid
		self.id
	end

	def venue=(value)
		self.venueid = value["venueid"]
		existing_venue = Venue.find_by_id(self.venueid)
		if existing_venue == nil
			new_venue = Venue.new(value)
			new_venue.save
		else
			existing_venue.update_attributes(value)
		end
	end

	def venue
		Venue.find_by_id(self.venueid)
	end

	def attractionList=(value)
		if attractions == nil
			self.attractions = []
		end
		value.each do |v|
			new_attraction = Attraction.new(v)
			new_attraction.save
			self.attractions[new_attraction["sequence"]] = new_attraction.id
		end
	end

	def attractionList
		returned_list = []
		self.attractions.each do |a|
			loaded_attraction = Attraction.find_by_id(a)
			returned_list[loaded_attraction["sequence"]] = loaded_attraction
		end
		returned_list
	end

	private

		attr_accessible :attractions
end
