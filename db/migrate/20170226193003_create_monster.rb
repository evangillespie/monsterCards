class CreateMonster < ActiveRecord::Migration[5.0]
  def change
    create_table :monsters do |t|
      t.string :name
      t.string :size
      t.string :type
      t.string :subtype
      t.string :alignment

      t.integer :hp
      t.string :hit_dice
      t.integer :ac
      t.integer :xp
      t.string :cr

      t.integer :str
      t.integer :dex
      t.integer :con
      t.integer :int
      t.integer :wis
      t.integer :cha

      t.string :speed
      t.string :languages
      t.string :senses
      t.string :skills

      t.string :saving_throws
      t.string :damage_vulnerabilities
      t.string :damage_resistances
      t.string :damage_immunities
      t.string :condition_immunities

      t.integer :monster_set_id
    end
  end
end
