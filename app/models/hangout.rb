class Hangout < ApplicationRecord
  attr_accessor :seed

  belongs_to :user
  belongs_to :profile
  has_one :review, dependent: :destroy
  # validates :date, comparison: { greater_than: Date.today }
  validates :time, presence: true

  validates :date, presence: true
  validate :date_future?

  private

  def date_future?
    return if seed

    errors.add(:date, "can't be in the past") if date < Date.today
  end
end
