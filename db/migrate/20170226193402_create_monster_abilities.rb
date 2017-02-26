class CreateMonsterAbilities < ActiveRecord::Migration[5.0]
  def change
    create_table :monster_abilities do |t|
      t.integer :monster_id
      t.string :type
      t.string :name
      t.string :desc
      t.string :attack_bonus
      t.string :damage_dice
      t.string :damage_bonus

      t.timestamps
    end
  end
end
