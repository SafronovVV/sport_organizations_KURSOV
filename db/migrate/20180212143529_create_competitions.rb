class CreateCompetitions < ActiveRecord::Migration[5.1]
  def change
    create_table :competitions do |t|
      t.string :name, null: false
      t.string :organizator
      t.date :date
      t.timestamps
    end
    add_reference :competitions, :sport, index: true
    add_reference :competitions, :sport_complex, index: true
  end
end
