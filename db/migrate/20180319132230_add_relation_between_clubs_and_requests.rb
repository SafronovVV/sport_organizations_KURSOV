class AddRelationBetweenClubsAndRequests < ActiveRecord::Migration[5.1]
  def change
    add_reference :requests, :club, index: true
  end
end
