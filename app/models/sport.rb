class Sport < ApplicationRecord
  has_many :clubs
  has_many :competitions

  validates_presence_of :name
end
