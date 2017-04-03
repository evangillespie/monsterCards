class MonsterSetsController < ApplicationController

  # License page
  #
  # @url /:monster_set_slug/license
  #
  def show
    @monster_set = MonsterSet.
      find_by(slug: params[:monster_set_id])
    @title = "#{@monster_set.system} License"
  end
end

