class AddMandatoryToFilterCondition < ActiveRecord::Migration[5.1]
  def change
    add_column :filter_conditions, :mandatory, :boolean, default: true
  end
end
