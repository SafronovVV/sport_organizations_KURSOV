class Participant < ApplicationRecord
  belongs_to :club
  has_many :requests
  has_many :competitions, through: :requests
end
