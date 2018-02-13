class SportComplex < ApplicationRecord
  has_many :competitions

  validates_presence_of :name, :address
end
