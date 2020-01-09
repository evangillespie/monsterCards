class QuirksController < ApplicationController
  
  def index
    @category = QuirkCategory.find(rand(QuirkCategory.count)+1)
  end

  def create
    Quirk.create!(
      quirk_category_id: params[:quirk_category_id],
      desc: params[:desc]
    )

    flash[:notice] = "Submission successfull"
    redirect_to quirks_path
  end
end
