class Location < ApplicationRecord
  validates :name, length: { minimum: 3 }
  validates :address, presence: true

end
