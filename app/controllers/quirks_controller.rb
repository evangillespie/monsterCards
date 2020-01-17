class QuirksController < ApplicationController

  def index
    @category = QuirkCategory.find(
      ActiveRecord::Base.connection.execute(
        "
        SELECT qc.*, COALESCE(counts.C, 0) AS quirk_count
        FROM quirk_categories AS qc
        LEFT OUTER JOIN (
          SELECT quirk_category_id, COUNT(id) AS c
          FROM quirks
          GROUP BY quirk_category_id
        ) AS counts ON qc.id = counts.quirk_category_id
        ORDER BY quirk_count ASC
        LIMIT 25
        ;
        "
      ).field_values('id').sample
    )

    @existing_quirks = Quirk.
      where(quirk_category_id: @category.id).
      order(:created_at)
  end

  def create
    if params[:desc].present?
      Quirk.create!(
        quirk_category_id: params[:quirk_category_id],
        desc: params[:desc]
      )

      flash[:notice] = "Submission saved 👍"
    end

    redirect_to quirks_path
  end
end
