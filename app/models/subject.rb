class Subject < ApplicationRecord
  has_many :enrollments
  has_many :studies, through: :enrollments

  validates :age, presence: true, numericality: true
end