class FavouritesController < ApplicationController

  def index
  end

  def fetch
    @monsters = Monster.
      where(slug: params['favourite_monsters']).
      order(:name)
    if @monsters.present?
      render 'shared/_monsters',
        :layout => false,
        :locals => {:monsters => @monsters}
    else
      render '_empty_state', layout: false
    end
  end

end
