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
  Memory.create!(traveller_id: 1,city: "Vancouver", comment: "The Steamclock rings on the hour. An icon of Gastown.", category: "landmark", photo_url: "./img/city/vancouver.jpg")
  Memory.create!(traveller_id: 1,city: "Vancouver", comment: "This Coffee was one of the best I ever had.", category: "food", photo_url: "./img/city/vancouver2.jpg")
  Memory.create!(traveller_id: 1,city: "Vancouver",comment: "Walking in Lynn canyon felt like I was in a land forgotten by time.", category: "nature", photo_url: "./img/city/paris.jpg")
  Memory.create!(traveller_id: 1,city: "Vancouver",comment: "The view from the float plane was incredible!", category: "view", photo_url: "./img/city/paris.jpg")
  Memory.create!(traveller_id: 1,city: "Goa",comment: "The beaches were unlike anything I have ever seen. Try a Mango Lassi from a local vendor!", category: "view", photo_url: "./img/city/goa.jpg")
  Memory.create!(traveller_id: 1,city: "Goa",comment: "Watching the sun set over the water sent chills through my body.", category: "view", photo_url: "./img/city/goa2.jpg")
  Memory.create!(traveller_id: 1,city: "Goa",comment: "These caves reminded me of something out of a movie.", category: "nature", photo_url: "./img/city/goa3.jpg")
  Memory.create!(traveller_id: 2,city: "Paris",comment: "I loved this view of the Tour Eiffel.", category: "landmark", photo_url: "./img/city/paris.jpg")
  Memory.create!(traveller_id: 2,city: "Paris",comment: "Magical memories created with my children riding this carousel.", category: "activity", photo_url: "./img/city/paris.jpg")
  Memory.create!(traveller_id: 2,city: "Paris",comment: "I couldn't believe the traffic around the Arc de Triompe!", category: "landmark", photo_url: "./img/city/paris.jpg")
  Memory.create!(traveller_id: 3,city: "Geneva",comment: "The Alps, what a view!", category: "view", photo_url: "./img/city/paris.jpg")
  Memory.create!(traveller_id: 3,city: "Geneva",comment: "This etching is such an amazing feat of engineering!", category: "landmark", photo_url: "./img/city/paris.jpg")
end

