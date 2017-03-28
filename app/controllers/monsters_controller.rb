class MonstersController < ApplicationController

  def index
    @title = "Monsters - D&D 5e SRD"
    if params[:search]
      @monsters = Monster.where("name ilike ?", '%' + params[:search] + '%')
    else
      @monsters = Monster.all
    end
  end

  def show
    @monster = Monster.
      includes(:monster_abilities).
      find(params[:id])
    @title = @monster.name + " - D&D 5e SRD"
  end
end
