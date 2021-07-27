class Profile < ApplicationRecord
  GENRES = %w[male female other]
  has_one_attached :photo
  belongs_to :user
  validates :name, :age, :gender, :interest, presence: true
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 18 }
  validates :gender, inclusion: {
    in: GENRES,
    message: "%{value} is not a valid gender. (Male, female, other.)"
  }
  has_many :hangouts, dependent: :destroy
  has_many :reviews, through: :hangouts
end
