class Attraction < ActiveRecord::Base
  attr_accessible :artist, :artistid, :billing, :links, :sequence, :genre
end
