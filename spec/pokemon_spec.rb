require 'rspec'
require_relative '../lib/pokemon'
require_relative  '../lib/main'
require_relative  '../lib/trainer'
require_relative  '../lib/game'

describe 'Game tests' do
  game = Game.new

  it 'should have a trainer' do
    expect(game.trainer == nil).to be false
  end

  it 'should have a trainer' do
    expect(game.enemy == nil).to be false
  end

  it 'should have a turn' do
    expect(game.turn == nil).to be false
  end

  it 'can take turns' do
    game.take_turn
  end


#
# describe 'Trainer tests' do
#   trainer = Trainer.new ('Trainer')
#
#   it 'should have 6 pokemon' do
#     expect(trainer.pokemon.length).to eq 6
#   end
#
#   it 'should have items' do
#     expect(trainer.items == nil).to be false
#   end
#
#   it 'should be able to choose a pokemon' do
#     trainer.choose_pokemon(3)
#     expect(trainer.current_pokemon.name).to eq "Weedle"
#   end
#
#   it 'should be able to use an item (Potion)' do
#     prior_hp = trainer.current_pokemon.hp
#     trainer.use_item 'Potion'
#     expect(trainer.current_pokemon.hp).to eq prior_hp + 20
#   end
#
#   it 'should be able to use an item (Super Potion)' do
#     trainer = Trainer.new ('Trainer')
#     prior_hp = trainer.current_pokemon.hp
#     trainer.use_item 'Super Potion'
#     expect(trainer.item_response).to eq "Item Used"
#     expect(trainer.current_pokemon.hp).to eq prior_hp + 50
#   end
#
#   it 'shouldn\'t be able to use an item it doesnt have (Potion)' do
#     trainer = Trainer.new ('Trainer')
#     prior_hp = trainer.current_pokemon.hp
#     trainer.use_item 'Potion'
#     trainer.use_item 'Potion'
#     expect(trainer.item_response).to eq 'No Potions left'
#     expect(trainer.current_pokemon.hp).to eq prior_hp + 20
#   end
#
#   describe 'Pokemon tests' do
#     #pokemon = Pokemon.new ("God", 1000)
#     it 'should have moves' do
#       expect(pokemon.moves == nil).to be false
#     end
#   end

end