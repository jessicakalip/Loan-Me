class Hangout < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  has_one :review
  # validates :date, comparison: { greater_than: Date.today }
  validates :time, presence: true





  validates :date, presence: true
  validate :date_future?

  private

  def date_future?
    if :date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end
end
