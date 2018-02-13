class Competition < ApplicationRecord
  belongs_to :sport
  belongs_to :sport_complex
  has_many :requests, dependent: :destroy
  has_many :participants, through: :requests

  validates_presence_of :name
end
