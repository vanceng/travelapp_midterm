# require_relative '../../config'

# This is where you should use an ActiveRecord migration to
# HINT: checkout ActiveRecord::Migration.create_table

class CreateMemories < ActiveRecord::Migration
  
  def up
    # Code to create the table here:
    create_table :memories do |t|
      t.integer :traveller_id
      t.string :title
      t.string :photo_url
      t.string :comment
      t.string :category
      t.string :latitude
      t.string :longitude
      t.string :city
      t.string :address
      t.datetime :created_at
      t.datetime :updated_at
      # column definitions go here
      # Use the AR migration guide for syntax reference
    end
  end

  def down
    # Code to drop the table here
    # Use the AR migration guide for syntax reference
    drop_table :memories
  end
  
end
