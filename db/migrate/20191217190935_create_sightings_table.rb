class CreateSightingsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :sightings do |t|
      t.integer :user_id
      t.integer :bird_id
    end
  end
end
