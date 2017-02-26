class ChangeMonsterAbilityDamageFields < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      change_table :monster_abilities do |t|
        dir.up do
          t.change :attack_bonus, 'integer USING CAST(attack_bonus AS integer)'
          t.change :damage_bonus, 'integer USING CAST(damage_bonus AS integer)'
        end
        dir.down do
          t.change :attack_bonus, :string
          t.change :damage_bonus, :string
        end
      end
    end
  end
end
