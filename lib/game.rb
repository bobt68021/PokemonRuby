require_relative 'pokemon'
require_relative 'trainer'
require_relative 'enemy'

class Game
  attr_accessor :game_status, :trainer, :enemy, :turn

  def initialize
    @game_status = 1
    @trainer = Trainer.new ('Ash')
    @enemy = Enemy.new ('Gary')
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
    puts "\n\n**#{attacker.name}\'s Turn!**"
    puts "(attacker) #{attacker.name}\'s current pokemon: #{attacker.current_pokemon.name} (#{attacker.current_pokemon.hp}hp)"
    puts "(defender) #{defender.name}\'s current pokemon: #{defender.current_pokemon.name} (#{defender.current_pokemon.hp}hp)"

    puts "\nEnter action: \n\s\s0: Attack\n\s\s1: Item\n\s\s2: Send out new pokemon"
    action = gets.chomp
    case action
      when "0"
        get_attack(attacker, defender)
      when "1"
        get_item(attacker)
      when "2"
        swap_pokemon(attacker)
      else
        puts "turn skipped"
    end
  end

  def get_attack(attacker, defender)
    puts "#{attacker.name}\'s #{attacker.current_pokemon.name} attacks #{defender.name}\'s #{defender.current_pokemon.name} for 100 damage!\n\n"
    defender.current_pokemon.hp -= 100
    if(defender.current_pokemon.hp <= 0)
      puts "#{defender.name}\'s #{defender.current_pokemon.name} Fainted!!"
      defender.pokemon_left -= 1
      if defender.pokemon_left > 0
        puts "#{defender.name}, choose new Pokemon"
        swap_pokemon(defender)
      end
    end
  end

  def get_item(attacker)
    puts "#{attacker.name}\'s #{attacker.current_pokemon.name} uses an item"
  end

  def swap_pokemon(attacker)
    i = 0
    puts ""
    attacker.pokemon.each do |pokemon|
      print "#{i}: #{pokemon.name}"
      STDOUT.flush
      puts pokemon.hp > 0? " (available)" : " (unavailable)"
      i += 1
    end

    puts "Enter pokemon number"
    attacker.choose_pokemon(gets.chomp.to_i)
    puts "Go get \'em #{attacker.current_pokemon.name}!!"
  end
end