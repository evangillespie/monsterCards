class CreateMonsterSets < ActiveRecord::Migration[5.0]
  def change
    create_table :monster_sets do |t|
      t.string :system
      t.string :source
      t.text :desc

      t.timestamps
    end
  end
end
