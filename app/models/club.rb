class Club < ApplicationRecord
  belongs_to :sport_organization
  belongs_to :sport
  has_many :requests

  validates_presence_of :name

  enum club_type: { "Детский" => 0 , "Юношеский" => 1 , "Взрослый" => 2 }
end
