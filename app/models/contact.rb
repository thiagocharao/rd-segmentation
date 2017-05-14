class Contact < ApplicationRecord

  def self.comparable_fields
    fields = Contact.columns_hash.reject{
      |x| (not [:string, :integer].include? Contact.columns_hash[x].type) or (x == "id")}
    fields.map{ |key, value| [key, value.type] }.to_h
  end

  def self.filter(filter_conditions)
    fields_and_types = self.comparable_fields
    values = []
    conditions = ""
    combinator = ""
    for fc in filter_conditions do
      if conditions != ""
        combinator = if fc.mandatory then "AND" else "OR" end
      end

      if fields_and_types[fc.field] == :integer
        conditions += "#{combinator} #{fc.field} #{fc.comparator} #{fc.value} "
      elsif fields_and_types[fc.field] == :string
        if fc.comparator != "=="
          conditions += "#{combinator} #{fc.field} LIKE ? "
          left_symbol = if ["%%", "*="].include?(fc.comparator) then "%" else "" end
          right_symbol = if ["%%", "=*"].include?(fc.comparator) then "%" else "" end
          values << left_symbol + "#{fc.value}" + right_symbol
        else
          conditions += "#{combinator} #{fc.field} = ? "
          values << "#{fc.value}"
        end
      end
    end
    Contact.where(values.insert(0, conditions))
  end
end
