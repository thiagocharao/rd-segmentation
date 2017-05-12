class ContactSegmentation < ApplicationRecord
    validates_presence_of :description
    has_many :filter_conditions, inverse_of: :contact_segmentation

    accepts_nested_attributes_for :filter_conditions
end
