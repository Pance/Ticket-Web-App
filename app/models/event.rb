class Event < ActiveRecord::Base
  attr_accessible :eventid, :additionallistingtext, :attractionList, :dates, :description, :eventimages, :eventname, :eventurl, :facebookeventid, :prices, :status, :tags, :venue

	serialize :dates, JSON

	def eventid=(value)
		self.id = value
	end

	def eventid
		self.id
	end
end
