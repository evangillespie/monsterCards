class AddSlugToMonsters < ActiveRecord::Migration[5.0]
  def change
    add_column :monsters, :slug, :string
  end
end
