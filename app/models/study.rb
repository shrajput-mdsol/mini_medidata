class Study < ApplicationRecord
  # validate data before it gets stored to database, preffered than database level validation
  # db level validation are only done when we are very sure about the validation.

  # Assignment
  # drug should be present
  # phase can't be greater than 5
  # age_limit > 7

  # model level validations
  validates :name, :drug, presence: true
  validates :phase, numericality: { less_than_or_equal_to: 5 }
  validates :age_limit, numericality: { greater_than: 7 }

  #belongs_to :study_group
  has_many :enrollments
  has_many :subjects, through: :enrollments

  #can be anything
  has_one_attached :my_image
end
