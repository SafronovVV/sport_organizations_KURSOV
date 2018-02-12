class Sport < ApplicationRecord
  has_many :clubs
  has_many :competitions
end
