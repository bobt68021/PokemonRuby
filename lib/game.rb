require_relative 'pokemon'
require_relative 'trainer'
require_relative 'enemy'

class Game
  attr_accessor :game_status, :trainer, :enemy, :turn
  def initialize
    move_set1 = ['Tackle', 'Body Slam', 'Growl', 'Leer']
    move_set2 = ['Pierce', 'Bulk up', 'Sharpen', 'Heal']

    ash_pokemon = []
    ash_pokemon << Pokemon.new('Pikachu', 50, 50, 50, move_set1)
    ash_pokemon << Pokemon.new('Butterfree' ,40, 50, 50, move_set2)
    ash_pokemon << Pokemon.new('Pidgeotto', 60, 50, 50, move_set2)
    ash_pokemon << Pokemon.new('Bulbasaur', 45, 50, 50, move_set1)
    ash_pokemon << Pokemon.new('Charmander', 55, 50, 50, move_set1)
    ash_pokemon << Pokemon.new('Squirtle', 50, 50, 50, move_set1)
    ash_items = { 'Potion' => 2, 'Super Potion' => 1 }

    gary_pokemon = []
    gary_pokemon << Pokemon.new('Flareon', 50, 50, 50, move_set1)
    gary_pokemon << Pokemon.new('Scyther', 100, 50, 50, move_set2)
    gary_pokemon << Pokemon.new('Spearow', 60, 50, 50, move_set1)
    gary_pokemon << Pokemon.new('Rattata', 35, 50, 50, move_set2)
    gary_pokemon << Pokemon.new('Nidoran', 40, 50, 50, move_set1)
    gary_pokemon << Pokemon.new('Sandshrew', 50, 50, 50, move_set2)
    gary_items = { 'Potion' => 2, 'Super Potion' => 1 }


    @game_status = 1
    @trainer = Trainer.new('Ash', ash_pokemon, ash_items)
    @enemy = Trainer.new('Gary', gary_pokemon, gary_items)
    @turn = 0
  end

  def take_turn
    while @game_status == 1
      if @turn == 0
        turn_action(@trainer, @enemy)
        @turn = 1
      else
        turn_action(@enemy, @trainer)
        @turn = 0
      end

      #pokemon check
      if @trainer.pokemon_left <= 0
        puts "#{@trainer.name} is out of Pokemon"
        puts "#{@enemy.name} Wins!!!!"
        @game_status = 0
      end

      if enemy.pokemon_left <= 0
        puts "#{@enemy.name} is out of Pokemon"
        puts "#{@trainer.name} Wins!!!!"
        @game_status = 0
      end
    end
  end

  def turn_action (attacker, defender)
    puts "\n\n**  #{attacker.name}\'s Turn!  **"
    puts "\n(attacker) #{attacker.name}\'s current pokemon: \s\s (#{attacker.current_pokemon.hp.to_i}HP) #{attacker.current_pokemon.name} "
    puts "(defender) #{defender.name}\'s current pokemon: \s (#{defender.current_pokemon.hp.to_i}HP) #{defender.current_pokemon.name} "

    puts "\nEnter #{attacker.name}\'s action: \n\s\s0: Attack\n\s\s1: Item\n\s\s2: Send out new pokemon"
    action = gets.chomp

    case action
      when "0"
        get_attack(attacker, defender)
      when "1"
        get_item(attacker)
      when "2"
        attacker.choose_new_pokemon
      else
        puts "turn skipped"
    end
  end

  def get_attack(attacker, defender)
    print_moves(attacker.current_pokemon)
    puts "Enter move number:"
    move = gets.chomp.to_i
    attacker.current_pokemon.perform_move(attacker.current_pokemon.move_set[move], defender.current_pokemon)
    if(defender.current_pokemon.hp <= 0)
      puts "#{defender.name}\'s #{defender.current_pokemon.name} Fainted!!"
      defender.pokemon_left -= 1
      if defender.pokemon_left > 0
        puts "\n#{defender.name}, choose new Pokemon..."
        defender.choose_new_pokemon
      else
        @game_status = 0
      end
    end
  end

  def print_moves(attacker)
    i = 0
    puts "\n"
    attacker.move_set.each do |move|
      printf "%s: %s\n", i, move
      i+=1
    end
  end

    # puts "#{attacker.name}\'s #{attacker.current_pokemon.name} attacks #{defender.name}\'s #{defender.current_pokemon.name} for 100 damage!\n\n"
    # defender.current_pokemon.hp -= 100
    # if(defender.current_pokemon.hp <= 0)
    #   puts "#{defender.name}\'s #{defender.current_pokemon.name} Fainted!!"
    #   defender.pokemon_left -= 1
    #   if defender.pokemon_left > 0
    #     puts "\n#{defender.name}, choose new Pokemon..."
    #     defender.choose_new_pokemon
    #   else
    #     @game_status = 0
    #   end
    # end
    # end

  def get_item(attacker)
    print_items(attacker)
    puts "\nEnter item number:"
    item = gets.chomp.to_i
    case item
      when 0
        puts "#{attacker.name} used a Potion on #{attacker.current_pokemon.name}"
        puts "#{attacker.current_pokemon.name} is healed by 15 HP!"
        attacker.current_pokemon.hp += 15
        attacker.items['Potion'] -= 1
      when 1
        puts "#{attacker.name} used a Super Potion on #{attacker.current_pokemon.name}"
        puts "#{attacker.current_pokemon.name} is healed by 50 HP!"
        attacker.current_pokemon.hp += 50
        attacker.items['Super Potion'] -= 1
      else
        get_item(attacker)
    end
  end

  def print_items(attacker)
    i = 0
    attacker.items.each do |key, value|
      print "#{i}: "
      printf "%-20s X %s\n", key, value
      i += 1
    end
  end
end