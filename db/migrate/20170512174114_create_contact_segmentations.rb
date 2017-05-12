class CreateContactSegmentations < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_segmentations do |t|
      t.text :description

      t.timestamps
    end
  end
end
