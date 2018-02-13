class Participant < ApplicationRecord
  belongs_to :club, optional: true
  has_many :requests, dependent: :destroy
  has_many :competitions, through: :requests

  validates_presence_of :name, :age, :growth, :weight
  validates :age, inclusion: 5..90
  validates :growth, inclusion: 90..400
  validates :weight, inclusion: 20..300
end
