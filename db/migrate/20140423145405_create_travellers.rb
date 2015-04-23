# require_relative '../../config'

# This is where you should use an ActiveRecord migration to
# HINT: checkout ActiveRecord::Migration.create_table

class CreateTravellers < ActiveRecord::Migration
  
  def up
    # Code to create the table here:
    create_table :travellers do |t|
      # column definitions go here
      # Use the AR migration guide for syntax reference
      t.string :email
      t.string :password
      t.datetime :created_at
      t.datetime :updated_at
    
    end
  end

  def down
    # Code to drop the table here
    # Use the AR migration guide for syntax reference
    drop_table :travellers
  end
  
end
