namespace :populate do
	desc "Populate database with data from first page of TicketWeb API"
	task :one_page => :environment do
		require 'open-uri'
		json_data = open("http://api.ticketweb.com/snl/EventAPI.action?key=OnTLfy5CJ7XX1mLwynRp&version=1&method=json&page=1").read
		parsed_json = JSON.parse(json_data)

		parsed_json["events"].each do |e|
			new_event = Event.new(e)
			new_event.save
		end
	end

end

