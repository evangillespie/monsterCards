class Monster < ApplicationRecord
  has_many :monster_abilities
  belongs_to :monster_set
  serialize :skills, Hash
  serialize :saving_throws, Hash

  # calculate the ability modifier for a given ability scote
  #
  # :param score: (int) the score for the abillity in question
  #
  # :return: the modifier for that score
  def ability_mod(score)
    return ((score - 10) / 2).floor
  end

  def to_param
    self.slug
  end
end
