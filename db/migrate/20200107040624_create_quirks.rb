class CreateQuirks < ActiveRecord::Migration[5.0]
  def change
    create_table :quirks do |t|
      t.integer :quirk_category_id
      t.string :desc

      t.timestamps
    end
  end
end
