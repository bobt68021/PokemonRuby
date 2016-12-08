
class Pokemon
  attr_accessor :name, :hp, :moves, :attack, :defense

  def initialize name, hp, attack, defense, move_set
    @name = name
    @hp = hp
    @attack = attack
    @defense = defense
    @moves = move_set
  end

  def perform_move(move_name, target_pokeon)
    case move_name
      when 'Tackle'
        target_pokeon.hp -= 1*@attack - 0.5*target_pokeon.defense
      when 'Body Slam'
        target_pokeon.hp -= 1.5*@attack - 0.5*target_pokeon.defense
      when 'Pierce'
        target_pokeon.hp -= 1*@attack
      when 'Heal'
        target_pokeon.hp += 0.5*@hp
      when 'Defense Curl'
        @defense += 10
      when 'Sharpen'
        @attack += 10
      when 'Bulk up'
        @attack += 10
        @defense += 10
      when 'Growl'
        target_pokeon.attack -= 10
      when 'Leer'
        target_pokeon.defense -= 10
    end
  end

  def describe_move (move_name)
    case move_name
      when 'Tackle'
        puts 'The user charges the foe with a full-body tackle'
      when 'Body Slam'
        puts 'The user drops its full body on the foe'
      when 'Pierce'
        puts 'The user lunges, ignoring targets defenses'
      when 'Heal'
        puts 'Heals for 25% of max health'
      when 'Defense Curl'
        puts 'The user curls up to conceal weak spots and raise its Defense stat'
      when 'Sharpen'
        puts 'The user makes its edges more jagged, which raises its Attack stat.'
      when 'Bulk up'
        puts 'The user tenses its muscles to bulk up its body, boosting both its Attack and Defense stats.'
      when 'Growl'
        puts 'The user growls in an endearing way, making the foe less wary. The target\'s Attack stat is lowered.'
      when 'Leer'
        puts 'The user gives opposing Pokémon an intimidating leer that lowers the Defense stat.'
    end
  end
end