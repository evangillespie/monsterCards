class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_monster_set

  def not_found
    render file: "public/404.html", status: :not_found
  end

  def set_monster_set
    @monster_set = MonsterSet.first
  end
end
