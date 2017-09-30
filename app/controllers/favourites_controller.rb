class FavouritesController < ApplicationController

  def index
  end

  def fetch
    render 'shared/_monsters',
      :layout => false,
      :locals => {:monsters => Monster.where(slug: params['favourite_monsters'])}
  end

end
