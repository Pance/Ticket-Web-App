require 'spec_helper'

describe Venue do

	before do
		require 'open-uri'
		json_data = open("http://api.ticketweb.com/snl/EventAPI.action?key=OnTLfy5CJ7XX1mLwynRp&version=1&method=json&page=1").read
		parsed_json = JSON.parse(json_data)
		@venue = Venue.new(parsed_json["events"][0]["venue"])
	end

	subject { @venue }

	it { should respond_to(:venueid) }
	it { should respond_to(:name) }
	it { should respond_to(:venueurl) }
	it { should respond_to(:city) }
	it { should respond_to(:state) }
	it { should respond_to(:postalcode) }
	it { should respond_to(:country) }
	it { should respond_to(:address) }
	it { should respond_to(:twitterid) }
	it { should respond_to(:venueimages) }

end
