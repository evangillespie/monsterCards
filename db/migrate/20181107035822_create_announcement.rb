class CreateAnnouncement < ActiveRecord::Migration[5.0]
  def change
    create_table :announcements do |t|
    	t.string :title
    	t.string :slug
    	t.timestamp :expires_at
    end
  end
end
