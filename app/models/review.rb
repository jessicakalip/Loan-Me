class Review < ApplicationRecord
  belongs_to :hangout
  belongs_to :user
end
