class Participation < ApplicationRecord
  belongs_to :event
  belongs_to :user

  enum status: [:no, :yes, :maybe]
end
