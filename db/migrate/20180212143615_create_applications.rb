class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.boolean :is_ill, default: false
      t.boolean :appeared, default: true
      t.timestamps
    end
    add_reference :requests, :competition, index: true
    add_reference :requests, :participant, index: true
  end
end
