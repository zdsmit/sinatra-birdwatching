class CreateBirdsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :birds do |t|
      t.string :species
    end
  end
end
