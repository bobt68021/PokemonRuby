
class Pokemon
  attr_accessor :name, :hp, :move_set, :attack, :defense

  def initialize name, hp, attack, defense, move_set
    @name = name
    @hp = hp
    @attack = attack
    @defense = defense
    @move_set = move_set
  end

  def perform_move(move_name, target_pokeon)
    case move_name
      when 'Tackle'
        puts "\n#{@name} charges #{target_pokeon.name} with a full-body tackle for #{(1*@attack - 0.5*target_pokeon.defense).to_i} damage."
        target_pokeon.hp -= 1*@attack - 0.5*target_pokeon.defense
      when 'Body Slam'
        puts "\n#{@name} drops its full body on #{target_pokeon.name} for #{(1.5*@attack - 0.5*target_pokeon.defense).to_i} damage."
        target_pokeon.hp -= 1.5*@attack - 0.5*target_pokeon.defense
      when 'Pierce'
        puts "\n#{@name} lunges, ignoring #{target_pokeon.name}\'s defenses for #{1*@attack} damage."
        target_pokeon.hp -= 1*@attack
      when 'Heal'
        puts "\n#{@name} heals for 25 points of health."
        @hp += 25
      when 'Defense Curl'
        puts "\n#{@name} curls up to conceal weak spots and raise its Defense stat by 10 points."
        @defense += 10
      when 'Sharpen'
        puts "\n#{@name} makes its edges more jagged, which raises its Attack stat by 10 points."
        @attack += 10
      when 'Bulk up'
        puts "\n#{@name} tenses its muscles to bulk up its body, boosting both its Attack and Defense stats by 10 points each."
        @attack += 10
        @defense += 10
      when 'Growl'
        puts "\n#{@name} growls in an endearing way, making #{target_pokeon.name} less wary. The #{target_pokeon.name}\'s Attack stat is lowered by 10 points."
        target_pokeon.attack -= 10
      when 'Leer'
        puts "\n#{@name} gives #{target_pokeon.name} an intimidating leer that lowers #{target_pokeon.name}\'s Defense stat by 10."
        target_pokeon.defense -= 10
    end
  end

  def describe_move (move_name, target_pokeon)
    case move_name
      when 'Tackle'
        puts "#{@name} charges #{target_pokeon.name} with a full-body tackle for #{(1*@attack - 0.5*target_pokeon.defense).to_i} damage."
      when 'Body Slam'
        puts "#{@name} drops its full body on #{target_pokeon.name} for #{(1.5*@attack - 0.5*target_pokeon.defense).to_i} damage."
      when 'Pierce'
        puts "#{@name} lunges, ignoring #{target_pokeon.name}\'s defenses for #{1*@attack} damage."
      when 'Heal'
        puts "#{@name} heals for 25 points of health."
      when 'Defense Curl'
        puts "#{@name} curls up to conceal weak spots and raise its Defense stat by 10 points."
      when 'Sharpen'
        puts "#{@name} makes its edges more jagged, which raises its Attack stat by 10 points."
      when 'Bulk up'
        puts "#{@name} tenses its muscles to bulk up its body, boosting both its Attack and Defense stats by 10 points each."
      when 'Growl'
        puts "#{@name} growls in an endearing way, making #{target_pokeon.name} less wary. The #{target_pokeon.name}\'s Attack stat is lowered by 10 points."
      when 'Leer'
        puts "#{@name} gives #{target_pokeon.name} an intimidating leer that lowers #{target_pokeon.name}\'s Defense stat by 10."
    end
  end
end