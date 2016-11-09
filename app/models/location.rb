class Location < ApplicationRecord
  has_many :events
  has_many :comments, as: :commentable

  validates :name, length: { minimum: 3 }
  validates :address, presence: true

end
