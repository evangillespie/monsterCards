class MonstersController < ApplicationController

  before_action :set_monster_set

  def index
    @title = "Monsters - #{@monster_set.system}"
    if params[:search]
      @monsters = Monster.where("name ilike ?", '%' + params[:search] + '%')
    else
      @monsters = Monster.all
    end
  end

  def show
    @monster = Monster.
      includes(:monster_abilities).
      find_by(name: params[:id].gsub('-', ' ').titleize)
    @title = "#{@monster.name} - #{@monster_set.system}"
  end

  private
  
  def set_monster_set
    @monster_set = MonsterSet.first
  end
end
