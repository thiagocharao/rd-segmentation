class FilterCondition < ApplicationRecord
  belongs_to :contact_segmentation, required: true
  validates :attribute, presence: true
  validates :comparator, presence: true
  validates :value, presence: true
end
