namespace :populate do
	desc "Populate database with data from first page of TicketWeb API"
	task :one_page => :environment do
		#require 'open-uri'
		#json_data = open("http://api.ticketweb.com/snl/EventAPI.action?key=OnTLfy5CJ7XX1mLwynRp&version=1&method=json&page=1").read
		#parsed_json = JSON.parse(json_data)
		
		# Without using open-uri
		require 'net/http'
		uri = URI('http://api.ticketweb.com/snl/EventAPI.action?key=OnTLfy5CJ7XX1mLwynRp&version=1&method=json&page=1')
		res = Net::HTTP.get(uri)
		parsed_json = JSON.parse(res)
		
		parsed_json["events"].each do |e|
			existing_event = Event.find_by_id(e["eventid"])
			if existing_event == nil
				new_event = Event.new(e)
				new_event.save
			else
				existing_event.update_attributes(e)
			end
		end

	end

end
