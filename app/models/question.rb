class Question < ApplicationRecord
  belongs_to :category
  has_many :answers, dependent: :destroy, inverse_of: :question
  accepts_nested_attributes_for :answers
  validates :content, presence: true

  # delegate :name, to: :category, allow_nil: true, prefix: true
end
