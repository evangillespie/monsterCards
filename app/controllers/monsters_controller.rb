class MonstersController < ApplicationController

  def index
    if params[:search]
      @monsters = Monster.where("name like ?", '%' + params[:search] + '%')
    else
      @monsters = Monster.all
    end
  end

  def show
    @monster = Monster.
      includes(:monster_abilities).
      find(params[:id])
  end
end
