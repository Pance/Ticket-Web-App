# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120604013414) do

  create_table "attractions", :force => true do |t|
    t.integer  "sequence"
    t.string   "artist"
    t.integer  "artistid"
    t.string   "billing"
    t.string   "links"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "genre"
    t.string   "image"
    t.string   "video"
  end

  create_table "events", :force => true do |t|
    t.integer  "facebookeventid"
    t.string   "eventname"
    t.string   "eventurl"
    t.string   "additionallistingtext"
    t.string   "status"
    t.string   "tags"
    t.string   "dates"
    t.string   "eventimages"
    t.string   "prices"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "venueid"
    t.string   "videoembed"
    t.string   "attractions"
    t.text     "description"
  end

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "venueurl"
    t.string   "city"
    t.string   "state"
    t.integer  "postalcode"
    t.string   "country"
    t.string   "address"
    t.string   "twitterid"
    t.string   "venueimages"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
