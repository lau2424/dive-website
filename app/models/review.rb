class Review < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  has_one_attached :photo
end
