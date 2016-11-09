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
  validate :start_time_before_end_time
  validate :start_time_in_past

  def start_time_before_end_time
    if self.start_time > self.end_time
      errors.add(:start_time, " should be before end time")
    end
  end

  def start_time_in_past
    if self.start_time < DateTime.now
      errors.add(:start_time, " can't be in the past")
    end
  end

  def is_ended
    self.end_time < DateTime.now
  end
end
