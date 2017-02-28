class AddLicenseToMonsterSets < ActiveRecord::Migration[5.0]
  def change
    add_column :monster_sets, :title, :string
    add_column :monster_sets, :license, :string
  end
end
