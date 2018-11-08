namespace :add_announcement do

	desc "Create a simple announcement for testing"
	task test_announcement: :environment do
		a = Announcement.create(
			expires_at: "2018-12-25",
			title: "Test Announcement",
			slug: "test"
		)
	end
end
