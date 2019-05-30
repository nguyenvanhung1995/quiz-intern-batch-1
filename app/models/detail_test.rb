class DetailTest < ApplicationRecord
  belongs_to :question
  belongs_to :test
  belongs_to :answer, optional: true

  delegate :is_correct, to: :answer, allow_nil: true
end
