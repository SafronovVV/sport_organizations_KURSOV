class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.integer :place, null: false
      t.string :height_result
      t.string :length_result
      t.string :score
      t.timestamps
    end
    add_reference :results, :request, index: true
  end
end
