class Review < ApplicationRecord
  belongs_to :hangout
  belongs_to :user
  # belongs_to :profile, through: :hangouts
  validates :comment, length: { minimum: 10,
    too_short: "%{count} characters is the minimum allowed" }
  validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
end
