class Pokemon
  attr_accessor :name, :hp, :moves

  def initialize name, hp
    @name = name
    @hp = hp;
    @moves = set_moves
  end

  private
  def set_moves

    @moves == [:tackle, :pierce, :defend, :rage]
  end
end