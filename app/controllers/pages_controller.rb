class PagesController < ApplicationController
	def show
		if valid_page?
			@title = get_page_title(params[:page])
			render template: "pages/#{params[:page]}"
		else
			render file: "public/404.html", status: :not_found
		end
	end

	private 
	def valid_page?
		File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.erb"))
	end
	def get_page_title path
		custom_names = {
			"license/5e_SRD" => "D&D 5e SRD License" 
		}

		if custom_names.keys.include?(path)
			return custom_names[path]
		else
			return path.titleize
		end
	end
end
