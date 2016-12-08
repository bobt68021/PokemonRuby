require 'rspec'
require_relative '../lib/pokemon'
require_relative  '../lib/main'
require_relative  '../lib/trainer'
require_relative  '../lib/game'

ash_pokemon = []
ash_pokemon << Pokemon.new("Pikachu", 50,  50, 50, [])
ash_pokemon << Pokemon.new("Butterfree" ,40, 50, 50, [])
ash_pokemon << Pokemon.new("Pidgeotto", 60, 50, 50, [])
ash_pokemon << Pokemon.new("Bulbasaur", 45, 50, 50, [])
ash_pokemon << Pokemon.new("Charmander", 55, 50, 50, [])
ash_pokemon << Pokemon.new("Squirtle", 50, 50, 50, [])
ash_items = { 'Potion' => 2, 'Super Potion' => 1 }

#
# describe 'Game tests' do
#   game = Game.new
#
#   it 'should have a trainer' do
#     expect(game.trainer == nil).to be false
#   end
#
#   it 'should have a trainer' do
#     expect(game.enemy == nil).to be false
#   end
#
#   it 'should have a turn' do
#     expect(game.turn == nil).to be false
#   end
#
#   # it 'can take turns' do
#   #   game.take_turn
#   # end
# end
#
# describe 'Trainer tests' do
#   trainer = Trainer.new('Trainer', ash_pokemon, ash_items)
#
#   it 'should have 6 pokemon' do
#     expect(trainer.pokemon.length).to eq 6
#   end
#
#   it 'should have items' do
#     expect(trainer.items == nil).to be false
#   end
# end
#
# describe 'Pokemon test' do
#   test_pokemon = Pokemon.new('test', 100, 50, 50, [])
#
#   it 'should have 100 hp' do
#     expect(test_pokemon.hp).to eq 100
#   end
#
#   it 'should have name test' do
#     expect(test_pokemon.name).to eq 'test'
#   end
#
#   it 'should have attack of 50' do
#     expect(test_pokemon.attack).to eq 50
#   end
# end

describe 'Move test' do
  move_set1 = ['Tackle', 'Body Slam', 'Growl', 'Leer']
  scyther  = Pokemon.new('Scyther ', 100, 50, 50, move_set1)

  move_set2 = ['Pierce', 'Bulk up', 'Sharpen', 'Heal']
  scyther  = Pokemon.new('Scyther ', 100, 50, 50, move_set2)

  it 'should do damage when a tackle' do
    bulbasaur = Pokemon.new('Bulbasaur', 100, 50, 50, move_set1)
    scyther  = Pokemon.new('Scyther ', 100, 50, 50, move_set2)
    bulbasaur.perform_move('Tackle', scyther)
    bulbasaur.describe_move('Tackle')
    expect(scyther.hp).to eq 75
  end

  it 'should do damage when a body slam' do
    bulbasaur = Pokemon.new('Bulbasaur', 100, 50, 50, move_set1)
    scyther  = Pokemon.new('Scyther ', 100, 50, 50, move_set2)
    bulbasaur.perform_move('Body Slam', scyther)
    bulbasaur.describe_move('Body Slam')
    expect(scyther.hp).to eq 50
  end

  it 'should lower defenders attack with a growl' do
    bulbasaur = Pokemon.new('Bulbasaur', 100, 50, 50, move_set1)
    scyther  = Pokemon.new('Scyther ', 100, 50, 50, move_set2)
    bulbasaur.describe_move('Growl')
    bulbasaur.perform_move('Growl', scyther)

    expect(scyther.attack).to eq 40
  end

  it 'should lower defenders attack with a leer' do
    bulbasaur = Pokemon.new('Bulbasaur', 100, 50, 50, move_set1)
    scyther  = Pokemon.new('Scyther ', 100, 50, 50, move_set2)
    bulbasaur.describe_move('Leer')
    bulbasaur.perform_move('Leer', scyther)
    expect(scyther.defense).to eq 40
  end

  it 'should ignore targets defenses with pierce' do
    bulbasaur = Pokemon.new('Bulbasaur', 100, 50, 10000, move_set1)
    scyther  = Pokemon.new('Scyther ', 100, 50, 50, move_set2)
    scyther.describe_move('Pierce')
    scyther.perform_move('Pierce', bulbasaur)
    expect(bulbasaur.hp).to eq 50
  end

  it 'should raise users attack and defense by 10' do
    bulbasaur = Pokemon.new('Bulbasaur', 100, 50, 50, move_set1)
    scyther  = Pokemon.new('Scyther ', 100, 50, 50, move_set2)
    scyther.describe_move('Bulk up')
    scyther.perform_move('Bulk up', bulbasaur)
    expect(scyther.attack).to eq 60
    expect(scyther.defense).to eq 60
  end


end