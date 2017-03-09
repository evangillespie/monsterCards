class MonstersController < ApplicationController

  def index
    @monsters = Monster.all
  end

  def show
    @monster = Monster.
      includes(:monster_abilities).
      find(params[:id])
  end
end
