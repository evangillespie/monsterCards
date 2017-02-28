namespace :importer do
  
  desc "Add a small amount of sample monster data to the database for development"
  task test_data: :environment do

    manual_monster_set = MonsterSet.create(
      system: "5e",
      source: "Manually Typed",
      desc: "A small set of monsters which were typed out manually so that we have a few for development"
    )

    cyclops = Monster.create(
      monster_set_id: manual_monster_set.id,
      name: "cyclops",
      size: "huge",
      monster_type: "giant",
      alignment: "chaotic neutral",
      hp: 138,
      hit_dice: "12d12 + 60",
      ac: 14,
      xp: 2300,
      cr: "6",
      str: 22,
      dex: 11,
      con: 20,
      int: 8,
      wis: 6,
      cha: 10,
      speed: "30 ft.",
      languages: "giant",
      senses: "passive perception 8"
    )
    cyclops_ability_1 = MonsterAbility.create(
      monster_id: cyclops.id,
      ability_type: "special",
      name: "poor depth perception",
      desc: "The cyclops has disadvantage on any attack roll against a target more than 30 feet away"
    )
    cyclops_ability_2 = MonsterAbility.create(
      monster_id: cyclops.id,
      ability_type: "action",
      name: "multiattack",
      desc: "The cyclops makes two greatclub attacks.",
    )
    cyclops_ability_3 = MonsterAbility.create(
      monster_id: cyclops.id,
      ability_type: "action",
      name: "greatclub",
      desc: "Melee Weapon Attack: +9 to hit, reach 10 ft., one target. Hit 19 (3d8 + 6) bludgeoning damage.",
      attack_bonus: 9,
      damage_dice: "3d8",
      damage_bonus: 6
    )
    cyclops_ability_4 = MonsterAbility.create(
      monster_id: cyclops.id,
      ability_type: "action",
      name: "Rock",
      desc: "Ranged Weapon Attack: +9 to hit, range 30/120 ft., one target. Hit: 28 (4d10 + 6) bludgeoning damage",
      attack_bonus: 10,
      damage_dice: "4d10",
      damage_bonus: 6
    )

    dragon = Monster.create(
      monster_set_id: manual_monster_set.id,
      name: "Ancient White Dragon",
      size: "gargantuan",
      monster_type: "dragon",
      alignment: "chaotic evil",
      hp: 333,
      hit_dice: "18d20 + 144",
      ac: 20,
      xp: 25000,
      cr: "20",
      str: 26,
      dex: 10,
      con: 26,
      int: 10,
      wis: 13,
      cha: 14,
      speed: "40 ft., burrow 40 ft., fly 80 ft., swim 40 ft.",
      languages: "Common, Draconic",
      senses: "blindsight 60 ft., darkvision 120 ft., passive Perception 23",
      skills: "Perception +13, stealth +6",
      saving_throws: "Dex +6, Con +14, Wis +7, Cha +8",
      damage_immunities: "cold"
    )
    dragon_ability_1 = MonsterAbility.create(
      monster_id: dragon.id,
      ability_type: "special",
      name: "Ice Walk",
      desc: "The dragon can move across and climb icy surfaces without needing to make an ability check. Additionally, difficult terrain composed of ice or snow doesn't cost it extra moment.",
    )
    dragon_ability_2 = MonsterAbility.create(
      monster_id: dragon.id,
      ability_type: "special",
      name: "Legendary Resistance (3/Day)",
      desc: "If the dragon fails a saving throw, it can choose to succeed instead.",
    )
    dragon_ability_3 = MonsterAbility.create(
      monster_id: dragon.id,
      ability_type: "action",
      name: "Multiattack",
      desc: "The dragon can use its Frightful Presence. It then makes three attacks: one with its bite and two with its claws.",
    )
    dragon_ability_4 = MonsterAbility.create(
      monster_id: dragon.id,
      ability_type: "action",
      name: "Bite",
      desc: "Melee Weapon Attack: +14 to hit, reach 15 ft., one target. Hit: 19 (2d10 + 8) piercing damage plus 9 (2d8) cold damage.",
      attack_bonus: 14,
      damage_dice: "2d10 + 2d8",
      damage_bonus: 8
    )
    dragon_ability_5 = MonsterAbility.create(
      monster_id: dragon.id,
      ability_type: "action",
      name: "Claw",
      desc: "Melee Weapon Attack: +14 to hit, reach 10 ft., one target. Hit: 15 (2d6 + 8) slashing damage.",
      attack_bonus: 14,
      damage_dice: "2d6",
      damage_bonus: 8
    )
    dragon_ability_6 = MonsterAbility.create(
      monster_id: dragon.id,
      ability_type: "action",
      name: "Tail",
      desc: "Melee Weapon Attack: +14 to hit, reach 20 ft., one target. Hit: 17 (2d8 + 8) bludgeoning damage.",
      attack_bonus: 14,
      damage_dice: "2d8",
      damage_bonus: 8
    )
    dragon_ability_7 = MonsterAbility.create(
      monster_id: dragon.id,
      ability_type: "action",
      name: "Frightful Presence",
      desc: "Each creature of the dragon's choice that is within 120 feet of the dragon and aware of it must succeed on a DC 16 Wisdom saving throw or become frightened for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success. If a creature's saving throw is successful or the effect ends for it, the creature is immune to the dragon's Frightful Presence for the next 24 hours .",
    )
    dragon_ability_8 = MonsterAbility.create(
      monster_id: dragon.id,
      ability_type: "action",
      name: "Cold Breath (Recharge 5-6)",
      desc: "The dragon exhales an icy blast in a 90-foot cone. Each creature in that area must make a DC 22 Constitution saving throw, taking 72 (l6d8) cold damage on a failed save, or half as much damage on a successful one.",
      attack_bonus: 0,
      damage_dice: "16d8",
      damage_bonus: 0
    )
    dragon_ability_9 = MonsterAbility.create(
      monster_id: dragon.id,
      ability_type: "legendary",
      name: "Detect",
      desc: "The dragon makes a Wisdom (Perception) check.",
    )
    dragon_ability_10 = MonsterAbility.create(
      monster_id: dragon.id,
      ability_type: "legendary",
      name: "Tail Attack",
      desc: "The dragon makes a tail attack.",
    )
    dragon_ability_11 = MonsterAbility.create(
      monster_id: dragon.id,
      ability_type: "legendary",
      name: "Wing Attack (Costs 2 Actions)",
      desc: "The dragon beats its wings. Each creature within 15 ft. of the dragon must succeed on a DC 25 Dexterity saving throw or take 17 (2d6 + 10) bludgeoning damage and be knocked prone. The dragon can then fly up to half its flying speed.",
      attack_bonus: 0,
      damage_dice: "2d6",
      damage_bonus: 10
    )
  end


  desc "Import the SRD monsters from the dropbox file that Colin found by parsing JSON and adding monsters to the database"
  task set1_5e_srd_monsters: :environment do

    file = File.read(File.join(Rails.root, 'lib', 'tasks', 'assets', '5e-SRD-Monsters.json'))
    monster_list = JSON.parse(file)

    set = MonsterSet.create(
      system: "5e",
      source: "JSON file that Colin found on reddit of SRD monsters",
      desc: "Set of all 5e monsters that are included in the SRD"
    )

    # a map to translate keys from the json sytax to the one in our db
    key_mapping = {
      "type" => "monster_type",
      "challenge_rating" => "cr",
      "hit_points" => "hp",

      "armor_class" => "ac",
      "strength" => "str",
      "dexterity" => "dex",
      "constitution" => "con",
      "intelligence" => "int",
      "wisdom" => "wis",
      "charisma" => "cha"
    }

    ability_key_mapping = {
      "special_abilities" => "special",
      "actions" => "action",
      "legendary_actions" => "legendary",
      "reactions" => "reaction"
    }
    save_key_mapping = {
      "strength_save" => "str",
      "dexterity_save" => "dex",
      "constitution_save" => "con",
      "intelligence_save" => "int",
      "wisdom_save" => "wis",
      "charisma_save" => "cha"
    }
    skill_keys = [
      "acrobatics",
      "arcana",
      "athletics",
      "deception",
      "history",
      "insight",
      "intimidation",
      "investigation",
      "medicine",
      "nature",
      "perception",
      "performance",
      "persuasion",
      "religion",
      "stealth",
      "survival"
    ]

    monster_list.each do |monster|
      #create a monster, mapping values from the JSON to the Monster object
      m = Monster.new
      m.monster_set_id = set.id
      saves = {}
      skills = {}
      monster.each do |key, value|
        if m.attributes.keys.include?(key)
          m[key] = value
        elsif key_mapping.keys.include?(key)
          m[key_mapping[key]] = value
        elsif save_key_mapping.keys.include?(key)
          saves[save_key_mapping[key]] = value
        elsif skill_keys.include?(key)
          skills[key] = value
        elsif ability_key_mapping.keys.include?(key)
          # do nothing. we'll deal with it after saving the monster
        else
          raise "Found a weird key in your monster: #{key}"
        end
      end
      m.saving_throws = saves
      m.skills = skills
      m.save!

      # create all the monster abilities      
      ability_key_mapping.each do |ability_key, ability_type_name|
        if monster.key?(ability_key)
          monster[ability_key].each do |ability|
            create_ability_from_hash(m['id'], ability_type_name, ability)
          end
        end
      end
      puts "Added monster: #{m.name}"
    end

  end #task

  #
  # create an ability from the hash provided
  #
  def create_ability_from_hash(monster_id, ability_type, ability)
    a = MonsterAbility.create(
      monster_id: monster_id,
      ability_type: ability_type,
      name: ability['name'],
      desc: ability['desc'],
      attack_bonus: ability.key?('attack_bonus') ? ability['attack_bonus'] : nil,
      damage_dice: ability.key?('damage_dice') ? ability['damage_dice'] : nil,
      damage_bonus:ability.key?('damage_bonus') ? ability['damage_bonus'] : nil
    )
  end

end #namespace