class SportOrganization < ApplicationRecord
  has_many :clubs, dependent: :destroy

  validates_presence_of :name
end
