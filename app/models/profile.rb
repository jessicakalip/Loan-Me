class Profile < ApplicationRecord
  GENRES = %w[male female other]
  belongs_to :user
  validates :name, :age, :gender, :interest, presence: true
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 18 }
  validates :gender, inclusion: {
    in: GENRES,
    message: "%{value} is not a valid gender. (Male, female, other.)"
  }
  has_many :hangouts
  has_many :reviews, through: :hangouts
end
