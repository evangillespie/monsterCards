class FavouritesController < ApplicationController

  def index
  end

  def fetch
    puts params.inspect
    # @TODO: get the real monster
    render 'shared/_monsters', :layout => false, :locals => {:monsters => Monster.all[0..5]}
  end

end
