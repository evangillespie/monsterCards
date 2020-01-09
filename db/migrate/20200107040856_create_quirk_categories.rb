class CreateQuirkCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :quirk_categories do |t|
      t.string :monster_name
      t.string :category

      t.timestamps
    end
  end
end
