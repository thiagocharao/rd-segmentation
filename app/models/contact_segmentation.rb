class ContactSegmentation < ApplicationRecord
  validates_presence_of :description
  validates_uniqueness_of :description
  has_many :filter_conditions, inverse_of: :contact_segmentation

  accepts_nested_attributes_for :filter_conditions, allow_destroy: true, reject_if: proc { |attributes| attributes[:field].blank? || attributes[:comparator].blank? || attributes[:value].blank? }

  def build_where_clause_conditions
    fields_and_types = Contact.comparable_fields
    values = []
    conditions = ""
    combinator = ""
    for fc in self.filter_conditions do
      if conditions != ""
        combinator = if fc.mandatory then "AND" else "OR" end
      end

      if fields_and_types[fc.field] == :integer
        conditions += "#{combinator} #{fc.field} #{fc.comparator} #{fc.value} "
      elsif fields_and_types[fc.field] == :string
        if fc.comparator == "="
          conditions += "#{combinator} #{fc.field} = ? "
          values << "#{fc.value}"
        else
          conditions += "#{combinator} #{fc.field} LIKE ? "
          left_symbol = if ["%%", "*="].include?(fc.comparator) then "%" else "" end
          right_symbol = if ["%%", "=*"].include?(fc.comparator) then "%" else "" end
          values <<  + "#{left_symbol}#{fc.value}#{right_symbol}"
        end
      end
    end
    values.insert(0, conditions)
  end
end
