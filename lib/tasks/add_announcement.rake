namespace :add_announcement do
  desc "initial kickstarter announcement"
  task upcoming_kickstarter: :environment do
    a = Announcement.create(
      expires_at: "2019-12-25",
      text: "Exciting new Monster Cards project coming soon: real physical cards!",
      goto_path: "/physical_cards"
    )
  end

  desc "updated kickstarter announcement"
  task upcoming_kickstarter_upd: :environment do
    a = Announcement.create(
      expires_at: "2019-12-25",
      text: "New project coming soon, real life physical cards!",
      goto_path: "/physical_cards"
    )
  end

end
