class Result < ApplicationRecord
  belongs_to :request

  validates_presence_of :place
end
