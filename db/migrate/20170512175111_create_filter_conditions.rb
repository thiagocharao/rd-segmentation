class CreateFilterConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :filter_conditions do |t|
      t.string :field
      t.string :comparator
      t.string :value
      t.references :contact_segmentation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
