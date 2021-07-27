class Hangout < ApplicationRecord
  attr_accessor :seed

  belongs_to :user
  belongs_to :profile
  has_one :review
  # validates :date, comparison: { greater_than: Date.today }
  validates :time, presence: true


  validates :date, presence: true
  validate :date_future?
  before_create :set_default_status
  private

  def set_default_status
    self.status = 'pending'
  end

  def date_future?
    return if seed
    return if !date.present?
    errors.add(:date, "can't be in the past") if date < Date.today
  end
end
