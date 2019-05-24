class Test < ApplicationRecord
  has_many :detail_tests
  has_many :questions, through: :detail_tests
end
