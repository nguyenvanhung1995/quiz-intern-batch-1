class Answer < ApplicationRecord
  belongs_to :question, inverse_of: :answers
  validates :content, presence: true
  validates_presence_of :question
end
