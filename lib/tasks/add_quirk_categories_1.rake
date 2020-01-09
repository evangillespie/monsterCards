namespace :quirk_categories do
  
  desc "add quirk categories to the database"
  task add_categories_1: :environment do
    QuirkCategory.create(
      monster_name: "Gnoll",
      category: "Fur Marking"
    )
    QuirkCategory.create(
      monster_name: "Gnoll",
      category: "Clan Symbol"
    )
    QuirkCategory.create(
      monster_name: "Gnoll",
      category: "Battle Scar"
    )

  end
end