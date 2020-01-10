namespace :quirk_categories do

  desc "add quirk categories from a csv file in lib/tasks/assets/"
  task :add_categories_from_csv, [:filename] => [:environment] do |task, args|
    # filename is the name of the file from /lib/tasks/assets to use

    require 'csv'

    file = File.read(File.join(Rails.root, 'lib', 'tasks', 'assets', args[:filename]))
    table = CSV.parse(file, headers: true)

    if table.headers().include?("monster_name") and table.headers().include?("category")
      table.each do |row|
        if row["monster_name"].present? and row["category"].present?
          QuirkCategory.create(
            monster_name: row["monster_name"],
            category: row["category"]
          )
        end
      end
    else
      raise "Bad headers in the csv"
    end
    
  end
end