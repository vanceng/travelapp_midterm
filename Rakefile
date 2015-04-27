require 'rake'
require "sinatra/activerecord/rake"
require ::File.expand_path('../config/environment', __FILE__)

Rake::Task["db:create"].clear
Rake::Task["db:drop"].clear

# NOTE: Assumes SQLite3 DB
desc "create the database"
task "db:create" do
  touch 'db/db.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/db.sqlite3'
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc 'adds dummy data'
task "db:populate" do

  Traveller.delete_all
  Traveller.create!(email: "sarah@sarah.com", password: "password")
  Traveller.create!(email: "vance@vance.com", password: "password")
  Traveller.create!(email: "sakthi@sakthi.com", password: "password")
  
  Memory.delete_all
  Memory.create!(traveller_id: 1,city: "Vancouver", comment: "The Steamclock rings on the hour. An icon of Gastown.", category: "landmark", photo_url: "/img/city/vancouver.jpg", latitude: 49.284436, longitude: -123.108896)
  Memory.create!(traveller_id: 1,city: "Vancouver", comment: "This Coffee was one of the best I ever had.", category: "food", photo_url: "/img/city/vancouver2.jpg", latitude: 49.283915, longitude: -123.109554)
  Memory.create!(traveller_id: 1,city: "Vancouver",comment: "Walking in Lynn canyon felt like I was in a land forgotten by time.", category: "nature", photo_url: "/img/city/vancouver3.jpg", latitude: 49.339074, longitude: -123.018063)
  Memory.create!(traveller_id: 1,city: "Vancouver",comment: "The view from the float plane was incredible!", category: "view", latitude: 49.2890192, longitude: -123.1239276)
  Memory.create!(traveller_id: 1,city: "Goa",comment: "The beaches were unlike anything I have ever seen. Try a Mango Lassi from a local vendor!", category: "view", photo_url: "/img/city/goa.jpg", latitude: 15.221003, longitude: 73.936534)
  Memory.create!(traveller_id: 1,city: "Goa",comment: "Watching the sun set over the water sent chills through my body.", category: "view", photo_url: "/img/city/goa2.jpg", latitude: 15.2185497, longitude: 73.9309366)
  Memory.create!(traveller_id: 1,city: "Goa",comment: "These caves reminded me of something out of a movie.", category: "nature", photo_url: "/img/city/goa3.jpg", latitude: 15.551828, longitude: 74.024991)
  Memory.create!(traveller_id: 2,city: "Paris",comment: "I loved this view of the Tour Eiffel.", category: "landmark", photo_url: "/img/city/paris.jpg", latitude: 48.85837, longitude: 2.294481)
  Memory.create!(traveller_id: 2,city: "Paris",comment: "Magical memories created with my children riding this carousel.", category: "activity", photo_url: "/img/city/paris2.jpg", latitude: 48.846204, longitude: 2.334198)
  Memory.create!(traveller_id: 2,city: "Paris",comment: "I couldn't believe the traffic around the Arc de Triompe!", category: "landmark", photo_url: "/img/city/paris3.jpg", latitude: 48.873792, longitude: 2.295028)
  Memory.create!(traveller_id: 3,city: "Geneva",comment: "The Alps, what a view!", category: "view", photo_url: "/img/city/switzerland.jpg", latitude: 46.203105, longitude: 6.14308)
  Memory.create!(traveller_id: 3,city: "Geneva",comment: "This etching is such an amazing feat of engineering!", category: "landmark", photo_url: "/img/city/switzerland2.jpg", latitude: 46.2050295, longitude: 6.1440885)
end
