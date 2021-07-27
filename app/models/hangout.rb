class Hangout < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  has_one :review
  # validates :date, comparison: { greater_than: Date.today }
  validates :time, presence: true




  validates :date, presence: true
  validate :release_date_future?

  private

  def release_date_future?
    if release_date < Date.today
      errors.add(:release_date, "can't be in the past")
    end
  end
end
