class Location < ApplicationRecord
  has_many :events

  validates :name, length: { minimum: 3 }
  validates :address, presence: true

end
