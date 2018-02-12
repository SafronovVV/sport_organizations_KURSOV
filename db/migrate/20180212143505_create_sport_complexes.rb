class CreateSportComplexes < ActiveRecord::Migration[5.1]
  def change
    create_table :sport_complexes do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.integer :capacity, default: 100
      t.timestamps
    end
  end
end
