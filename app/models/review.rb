class Review < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  has_one_attached :photo

  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
