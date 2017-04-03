# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170403064055) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "monster_abilities", force: :cascade do |t|
    t.integer  "monster_id"
    t.string   "ability_type"
    t.string   "name"
    t.string   "desc"
    t.integer  "attack_bonus"
    t.string   "damage_dice"
    t.integer  "damage_bonus"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "monster_sets", force: :cascade do |t|
    t.string   "system"
    t.string   "source"
    t.text     "desc"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "title"
    t.string   "license"
    t.text     "license_text"
    t.string   "slug"
  end

  create_table "monsters", force: :cascade do |t|
    t.string  "name"
    t.string  "size"
    t.string  "monster_type"
    t.string  "subtype"
    t.string  "alignment"
    t.integer "hp"
    t.string  "hit_dice"
    t.integer "ac"
    t.integer "xp"
    t.string  "cr"
    t.integer "str"
    t.integer "dex"
    t.integer "con"
    t.integer "int"
    t.integer "wis"
    t.integer "cha"
    t.string  "speed"
    t.string  "languages"
    t.string  "senses"
    t.string  "skills"
    t.string  "saving_throws"
    t.string  "damage_vulnerabilities"
    t.string  "damage_resistances"
    t.string  "damage_immunities"
    t.string  "condition_immunities"
    t.integer "monster_set_id"
  end

end
