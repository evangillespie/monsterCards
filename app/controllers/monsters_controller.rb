class MonstersController < ApplicationController

  def index
    @title = "Monsters - #{@monster_set.system}"
    @monsters = Monster.where(monster_set_id: @monster_set.id)
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
end
