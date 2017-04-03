class AddSlugToMonsterSets < ActiveRecord::Migration[5.0]
  def change
    add_column :monster_sets, :slug, :string
  end
end
