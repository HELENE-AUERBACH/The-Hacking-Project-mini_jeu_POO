require 'bundler'
Bundler.require

require_relative 'lib/player'
#require_relative 'lib/game'

def perform
  player1 = Player.new("José")
  player1.name
  player1.life_points
  player1.show_state
  player1.gets_damage(5)
  player1.show_state
  player1.gets_damage(5)
  player1.show_state
  player1 = Player.new("Josiane")
  player2 = Player.new("José")
  while player1.life_points > 0 && player2.life_points > 0
    puts "Voici l'état de chaque joueur :"
    player1.show_state
    player2.show_state
    puts "Passons à la phase d'attaque :"
    player1.attacks(player2)
    player2.attacks(player1)
  end
  #player2.show_state
  #player1.show_state
end

binding.pry

perform
