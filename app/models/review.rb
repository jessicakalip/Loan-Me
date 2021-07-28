class Review < ApplicationRecord
  belongs_to :hangout
  belongs_to :user
  # belongs_to :profile, through: :hangouts
  validates :comment, length: { minimum: 10,
    too_short: "%{count} characters is the minimum allowed" }
  validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}

  after_create :calc_avg_profile

  def calc_avg_profile
    profile = self.hangout.profile
    sum = 0
    count = 0
    profile.hangouts.each do |hangout|
      unless hangout.review.nil?
        sum += hangout.review.rating
        count += 1
      end
    end
    profile.average_rating = (sum.to_f / count) unless count.zero?
    profile.save
  end
end
