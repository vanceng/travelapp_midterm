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
  Memory.delete_all
  Memory.create!(traveller_id: 1,city: "Vancouver", comment: "Best Coffee shop", category: "food", photo_url: "http://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/200px-Ruby_logo.svg.png", latitude: 49.2820567, longitude: -123.1082302)
  Memory.create!(traveller_id: 1,city: "Vancouver", comment: "Best Donair shop", category: "food", photo_url: "http://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/200px-Ruby_logo.svg.png", latitude: 49.300815, longitude: -123.130837)
  Memory.create!(traveller_id: 3,city: "Toronto",comment: "Best Burger shop", category: "food", photo_url: "http://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/200px-Ruby_logo.svg.png")
end

