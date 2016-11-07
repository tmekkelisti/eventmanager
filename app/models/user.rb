class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :username, uniqueness: { case_sensitive: false }
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  has_many :events

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
