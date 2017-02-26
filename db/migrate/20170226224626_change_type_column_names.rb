class ChangeTypeColumnNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :monsters, :type, :monster_type
    rename_column :monster_abilities, :type, :ability_type
  end
end
