class Attraction < ActiveRecord::Base
  attr_accessible :image, :video, :artist, :artistid, :billing, :links, :sequence, :genre
end
