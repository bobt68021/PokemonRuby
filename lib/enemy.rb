require_relative 'pokemon'

class Enemy
  attr_accessor :name, :pokemon, :items, :item_response, :current_pokemon, :current_pokemon_index, :pokemon_left

  def initialize name
    @name = name
    @pokemon = set_pokemon
    @items = { 'Potion' => 1 , 'Super Potion' => 1}
    @current_pokemon_index = 0
    @pokemon_left = 6
    @current_pokemon = @pokemon[0]
    @item_response = 'Item Used'
  end

  def choose_pokemon index
    if pokemon[index].hp<=0
      puts "#{@pokemon[index].name} is unavailable"
      i = 0
      @pokemon.each do |pokemon|
        print "#{i}: #{pokemon.name}"
        print pokemon.hp > 0? " (available)" : " (unavailable)"
        #print i == @current_pokemon_index ? " (current)" : ""
        STDOUT.flush
        puts ""
        i += 1
      end
      puts "Enter pokemon number"
      choose_pokemon(gets.chomp.to_i)
      puts "Go get \'em #{@current_pokemon.name}!!"

    elsif index == @current_pokemon_index
      puts "#{@current_pokemon.name} is already out!"
      i = 0
      @pokemon.each do |pokemon|
        print "#{i}: #{pokemon.name}"
        print pokemon.hp > 0? " (available)" : " (unavailable)"
        #print i == @current_pokemon_index ? " (current)" : ""
        STDOUT.flush
        puts ""
        i += 1
      end
      puts "Enter pokemon number"
      choose_pokemon(gets.chomp.to_i)
      puts "Go get \'em #{@current_pokemon.name}!!"
    else
      @current_pokemon = @pokemon[index]
      @current_pokemon_index = index
    end
  end

  def use_item string
    if @items[string] > 0
      @items[string] -= 1
      if string == 'Potion'
        @current_pokemon.hp += 20
      elsif string == 'Super Potion'
        @current_pokemon.hp += 50
      end
    else
      @item_response = "No #{string}s left"
    end
  end


  private
  def set_pokemon
    pokemon = []
    pokemon << Pokemon.new("Eevee", 50)
    pokemon << Pokemon.new("Weedle", 30)
    pokemon << Pokemon.new("Fearow", 60)
    pokemon << Pokemon.new("Rattata", 35)
    pokemon << Pokemon.new("Pidgey", 40)
    pokemon << Pokemon.new("Sandshrew", 50)
  end

end