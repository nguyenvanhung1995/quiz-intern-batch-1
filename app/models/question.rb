class Question < ApplicationRecord
  belongs_to :category
  has_many :answers, dependent: :destroy, inverse_of: :question
  accepts_nested_attributes_for :answers
  mount_uploader :image, PictureUploader

  # delegate :name, to: :category, allow_nil: true, prefix: true

  validates :content, presence: true
  validate :image_size
  validates :image, presence: true

  private

  def image_size
    if image.size > 1.megabytes
      errors.add(:image, "should be less than 1MB")
    end
  end
end
