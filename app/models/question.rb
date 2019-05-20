class Question < ApplicationRecord
  has_attached_file :image, styles: { medium: "400x400>", thumb: "100x100>" }, 
    default_url: "/images/:style/missing.png"
  has_many :answers, dependent: :destroy, inverse_of: :question

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment :image, presence: true,
    size: { in: 0..500.kilobytes }
  validates :content, presence: true

  accepts_nested_attributes_for :answers, reject_if: :reject_answers

  def reject_answers attributes
    attributes["content"].blank?
  end
end
