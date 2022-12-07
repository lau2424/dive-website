class Spot < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validate :max_2_photos, :min_1_photo
  validates :category, presence: true
  validates :difficulty, presence: true
  validates :address, presence: true
  validates :name, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { minimum: 50 }



  def max_2_photos
    errors.add(:photos, "maximum 2 pictures allowed") if photos.count > 2
  end

  def min_1_photo
    errors.add(:photos, "minimum 1 picture needed") if photos.count < 1
  end
end
