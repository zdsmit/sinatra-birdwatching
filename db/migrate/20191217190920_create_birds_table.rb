class CreateBirdsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :birds do |t|
      t.string :type
    end
  end
end
