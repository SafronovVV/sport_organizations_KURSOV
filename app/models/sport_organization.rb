class SportOrganization < ApplicationRecord
  has_many :clubs

  validates_presence_of :name
end
