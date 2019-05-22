class Question < ApplicationRecord
  belongs_to :category
  has_many :answers, dependent: :destroy, inverse_of: :question
  validates :content, presence: true
  accepts_nested_attributes_for :answers, reject_if: :reject_answers

  def reject_answers attributes
    attributes["content"].blank?
  end
end
