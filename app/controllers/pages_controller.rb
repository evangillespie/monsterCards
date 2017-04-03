class PagesController < ApplicationController

  # Load static page
  #
  # @url /:page
  #
  def show
    if valid_page?
      @title = params[:page].titleize
      render template: "pages/#{params[:page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private

  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.erb"))
  end
end

