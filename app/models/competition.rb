class Competition < ApplicationRecord
  belongs_to :sport
  belongs_to :sport_complex
  has_many :requests
  has_many :participants, through: :requests
end
