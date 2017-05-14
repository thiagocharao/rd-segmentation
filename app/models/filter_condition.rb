class FilterCondition < ApplicationRecord
  COMPARATORS = {"equals to" => "=",
                 "contains" => "%%",
                 "starts with" => "=*",
                 "ends with" => "*=",
                 "greater than" => ">",
                 "less than" => "<",
                 "greater than or equals to" => ">=",
                 "less than or equals to" => "<="}
  belongs_to :contact_segmentation, required: true, inverse_of: :filter_conditions
  validates :field,
            presence: true,
            inclusion: {
              in: Contact.comparable_fields.keys,
              message: "%{value} is not a valid field, possible values are #{Contact.comparable_fields.map{|k,v| "'#{k}'"}.join(', ')}" }
  validates :comparator,
            presence: true,
            inclusion: {
              in: COMPARATORS.values,
              message: "%{value} is not a valid comparator, possible values are #{COMPARATORS.map{|k,v| "'#{v}'"}.join(', ')}" }
  validates :value, presence: true

end
