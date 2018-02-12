class Request < ApplicationRecord
  belongs_to :participant
  belongs_to :competition
  has_one :result
end
