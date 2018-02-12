class CreateParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :participants do |t|
      t.string :name, null: false
      t.integer :age, default: 5
      t.integer :growth, default: 100
      t.integer :weight, default: 25
      t.timestamps
    end
    add_reference :participants, :club, index: true
  end
end
