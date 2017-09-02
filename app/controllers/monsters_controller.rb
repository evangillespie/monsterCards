class MonstersController < ApplicationController

  before_action :set_monster_set

  def index
    @title = "Monsters - #{@monster_set.system}"
    @monsters = Monster.all
  end

  def show
    @monster = Monster.
      includes(:monster_abilities).
      find_by(slug: params[:id])
    if @monster.nil?
      render file: "public/404.html", status: :not_found
    else
      @title = "#{@monster.name} - #{@monster_set.system}"
    end
  end

  private
  
  def set_monster_set
    @monster_set = MonsterSet.first
  end
end
