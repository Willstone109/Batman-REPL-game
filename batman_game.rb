# Show intro
# Will display ascii art and game intro
def show_intro
  puts "WELCOME TO BATMAN: WYNCODE ASYLUM"
  add_a_line
  puts "        __.--'\\     \\.__./     /'--.__
      _.-'       '.__.'    '.__.'       '-._
    .'                                      '.
   /                                          \\
  |                                            |
  |                                            |
   \\         .---.              .---.         /
    '._    .'     '.''.    .''.'     '.    _.'
       '-./            \\  /            \\.-'
                        ''mrf"
  add_a_line
  puts "After all your hard work, you've become the batman!"
end

def say(character_name, message)
  puts "#{character_name}: #{message}"
end

# Asks a question
# Validates that the user selected an appropriate option
# returns the selection from the user
def ask_question(question, options)
  add_a_line
  puts question
  puts "Options: #{options.join(', ')}"
  users_input = gets.chomp.downcase

  # validates input against available options
  until options.include? users_input
    add_a_line
    puts question
    puts "Options: #{options.join(', ')}"
    users_input = gets.chomp.downcase
  end
  users_input
end

# Handle sidekick output
def handle_sidekick(sidekick)
  if sidekick == "robin"
    say(sidekick.capitalize, "Holy rusted metal, Batman!")
  else
    say(sidekick.capitalize, "Suit me up, Alfred!")
  end
end

def handle_weapon(weapon, sidekick)
  case weapon
  when "batarang"
    say(sidekick, "wHOA! A batarang! Thanks Bman.")
  when "fists"
    say(sidekick, "They not ready. For these guns...")
  when "flashlight"
    say(sidekick, " Uh.... thanks? I guess I'll blind them to death!")
  end
end

def handle_villain(villain)
  case villain
  when "joker"
    say(villain, "HAHAHAHAHAHA... HAHA.")
  when "bane"
    say(villain, "I was born. in. the. darkness.")
  when "penguin"
    say(villain, "Rweh. rweh. rweh. Check out my tux.")
  when "mr. frost"
    say(villain, "Ill be back!")
  when "riddler"
    say(villain, "Puzzle me this.. Batman")
  end
end

# Add a line of stars
def add_a_line
  puts "*" * 50
end

show_intro
sidekick = ask_question("Who will be your sidekick?", ["batgirl", "robin"])
handle_sidekick(sidekick)

weapon = ask_question("Awesome! What weapon will #{sidekick} be using today?", ["batarang", "fists", "flashlight"])
handle_weapon(weapon, sidekick)

valid_enemies = ["joker", "bane", "penguin", "mr. frost", "riddler"]
villain = ask_question("Who shall we fight first?", valid_enemies)


villain_life_points = {
  "joker" => 12,
  "riddler" => 10,
  "bane" => 20,
  "penguin" => 30,
  "mr. frost" => 15
}

batman_life_points = 50
batman_moves = {
  "punch" => 4,
  "kick" => 10,
  "kiss" => -4,
  "uppercut" => 15
}

villain_moves = [7, 19, 1]

until batman_life_points <= 0 || villain_life_points[villain] <= 0
  fight_move = ask_question("Batman, what move will you use?", batman_moves.keys)
  puts "Batman: Pow!"
  villain_life_points[villain] -= batman_moves[fight_move]
  add_a_line
  puts "You took #{batman_moves[fight_move]} points off the villains life."
  if villain_life_points[villain] > 0
    puts "#{villain.capitalize}: Ha! I've still got #{villain_life_points[villain]} life points.."
  end
  add_a_line
  if villain_life_points[villain] <= 0
    break
  end
  villain_move = villain_moves.sample
  puts "#{villain.capitalize}: WhaM!"
  batman_life_points -= villain_move
  puts "Batman: Ouch!"
end

if batman_life_points > villain_life_points[villain]
  puts "Batman wins!"
else
  puts "#{villain.capitalize} wins!"
end
