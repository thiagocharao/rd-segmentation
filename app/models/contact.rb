class Contact < ApplicationRecord
  def comparable_fields
    fields = Contact.columns_hash.reject{
      |x| (not [:string, :integer].include? Contact.columns_hash[x].type) or (x == "id")}
    fields.map{ |key, value| [key, value.type] }
  end
end
