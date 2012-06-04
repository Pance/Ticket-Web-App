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

	task :all_pages => :environment do
		require 'net/http'
		ticketweb_api = "http://api.ticketweb.com/snl/EventAPI.action?key=OnTLfy5CJ7XX1mLwynRp&version=1&method=json&page="
		page = 1

		uri = URI(ticketweb_api + page.to_s)
		res = Net::HTTP.get(uri)
		parsed_json = JSON.parse(res)

		totalEvents = parsed_json["totalHits"].to_i
		eventsPerPage = parsed_json["resultsPerPage"].to_i

		while (eventsPerPage * page) < totalEvents do
			if page != 1
				uri = URI(ticketweb_api + page.to_s)
				res = Net::HTTP.get(uri)
				parsed_json = JSON.parse(res)
			end

			parsed_json["events"].each do |e|
				existing_event = Event.find_by_id(e["eventid"])
				if existing_event == nil
					new_event = Event.new(e)
					new_event.save
				else
					existing_event.update_attributes(e)
				end
			end

			page+=1
			#puts "***PAGE " + page.to_s
			sleep 5
			
		end #end of while loop

	end #end of task :all_pages

end
