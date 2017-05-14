class Contact < ApplicationRecord

  def self.comparable_fields
    fields = Contact.columns_hash.reject{
      |x| (not [:string, :integer].include? Contact.columns_hash[x].type) or (x == "id")}
    fields.map{ |key, value| [key, value.type] }.to_h
  end

  def self.filter(filter_conditions)
    fields = Contact.comparable_fields

    search_context = Ransack::Context.for(Contact)
    conditions = []
    for fc in filter_conditions do
      field_predicate = "%s_%s" % [fc.field, fc.comparator]
      condition = Contact.ransack({field_predicate => fc.value}, context: search_context)
      condition.combinator = if fc.mandatory then "and" else "or" end
      conditions << condition
    end
    conditions = conditions.map { |search| Ransack::Visitor.new.accept(search.base) }
    teste = Contact.joins(search_context.join_sources).where(conditions.reduce(&:or)).to_sql

  end
end
