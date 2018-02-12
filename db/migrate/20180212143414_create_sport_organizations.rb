class CreateSportOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :sport_organizations do |t|
      t.string :name, null: false
      t.string :director_name, default: ''
      t.timestamps
    end
  end
end
