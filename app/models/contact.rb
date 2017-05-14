class Contact < ApplicationRecord

  def self.comparable_fields
    fields = Contact.columns_hash.reject{
      |x| (not [:string, :integer].include? Contact.columns_hash[x].type) or (x == "id")}
    fields.map{ |key, value| [key, value.type] }.to_h
  end
end
