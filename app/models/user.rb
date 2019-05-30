class User < ApplicationRecord
  before_save { email.downcase! }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }, on: :create
  validate :image_size
  mount_uploader :image, PictureUploader
  enum role: [:user, :admin]

  private

  def image_size
    if image.size > 2.megabytes
      errors.add(:image, "Should be less than 2 MB !")
    end
  end
end
