class Event < ApplicationRecord
  belongs_to :user
  belongs_to :location

  has_many :participations
  has_many :participants, :through => :participations, :source => :user

  has_many :comments, as: :commentable

  validates :name, length: { minimum: 3 }
  validates :description, length: { maximum: 500 }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :location_id, presence: true
  validates :user_id, presence: true

  def is_ended
    self.end_time < DateTime.now
  end
end
