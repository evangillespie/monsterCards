class MonsterSet < ApplicationRecord
  has_many :monsters

  def to_param
    self.slug
  end
end
