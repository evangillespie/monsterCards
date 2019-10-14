  class DropAnnouncements < ActiveRecord::Migration[5.0]
  def change
    drop_table :announcements
  end
end
