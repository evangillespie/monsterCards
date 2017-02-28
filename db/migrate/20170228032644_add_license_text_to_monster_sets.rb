class AddLicenseTextToMonsterSets < ActiveRecord::Migration[5.0]
  def change
  	add_column :monster_sets, :license_text, :text
  end
end
