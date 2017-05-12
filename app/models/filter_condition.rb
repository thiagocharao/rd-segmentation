class FilterCondition < ApplicationRecord
  belongs_to :contact_segmentation, required: true, inverse_of: :filter_conditions
  validates :field, presence: true
  validates :comparator, presence: true
  validates :value, presence: true
end
