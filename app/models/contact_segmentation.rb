class ContactSegmentation < ApplicationRecord
  validates_presence_of :description
  validates_uniqueness_of :description
  has_many :filter_conditions, inverse_of: :contact_segmentation

  accepts_nested_attributes_for :filter_conditions, allow_destroy: true, reject_if: proc { |attributes| attributes[:field].blank? || attributes[:comparator].blank? || attributes[:value].blank? }
end
