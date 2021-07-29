class Profile < ApplicationRecord
  GENRES = %w[male female other]
  INTERESTS = ["Business", "Film", "Family", "Fitness", "Food", "Art", "Music", "Shopping", "Sports", "Tech",
               "Banana Bread"]

  has_one_attached :photo
  belongs_to :user
  validates :name, :age, :gender, :interest, presence: true
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 18 }
  validates :gender, inclusion: {
    in: GENRES,
    message: "%{value} is not a valid gender. (Male, female, other.)"
  }
  validates :interest, inclusion: {
    in: INTERESTS,
    message: "%{value} is not a valid interest."
  }
  has_many :hangouts, dependent: :destroy
  has_many :reviews, through: :hangouts
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

# add bio + interests
