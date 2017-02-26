class Monster < ApplicationRecord
  has_many :monster_abilities
  belongs_to :monster_set
end
