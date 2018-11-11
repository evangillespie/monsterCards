class CreateAnnouncement < ActiveRecord::Migration[5.0]
  def change
    create_table :announcements do |t|
      t.string :text
      t.string :goto_path
      t.timestamp :expires_at
    end
  end
end
