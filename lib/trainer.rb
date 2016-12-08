require_relative 'pokemon'

class Trainer
  attr_accessor :name, :pokemon, :items, :current_pokemon, :current_pokemon_index, :pokemon_left

  def initialize(name, pokemon_array, item_array)
    @name = name
    @pokemon = pokemon_array
    @items = item_array
    @current_pokemon_index = 0
    @pokemon_left = pokemon_array.length
    @current_pokemon = @pokemon[0]
  end

  def choose_new_pokemon
    print_pokemon

    puts "Enter pokemon number"
    choice = gets.chomp.to_i

    if @pokemon[choice].hp <=0
      puts "#{@pokemon[choice].name} has no will to fight... "
    elsif @current_pokemon == choice
      puts "#{@pokemon[choice].name} is already out!"
    else
      @current_pokemon = @pokemon[choice]
      @current_pokemon_index = choice
      puts "\nGo get \'em #{@current_pokemon.name}!!"
    end
  end

  def print_pokemon
    i = 0
    @pokemon.each do |pokemon|
      print "\s\s#{i}: #{pokemon.name}"
      print pokemon.hp > 0? " \s\s\s\t(available)" : " \s\s\s\t(unavailable)"
      print i == @current_pokemon_index ? " (current)" : ""
      STDOUT.flush
      puts ""
      i += 1
    end
  end
end