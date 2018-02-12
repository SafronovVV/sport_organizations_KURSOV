class CreateClubs < ActiveRecord::Migration[5.1]
  def change
    create_table :clubs do |t|
      t.string :name, null: false
      t.integer :club_type, default: 0
      t.timestamps
    end
    add_reference :clubs, :sport_organization, index: true
    add_reference :clubs, :sport, index: true
  end
end
