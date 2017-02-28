class Monster < ApplicationRecord
  has_many :monster_abilities
  belongs_to :monster_set
  serialize :skills, Hash
  serialize :saving_throws, Hash
end
