require 'bundler'
Bundler.require

require_relative 'lib/player'
#require_relative 'lib/game'

def perform
  #player1 = Player.new("José")
  #player1.name
  #player1.life_points
  #player1.show_state
  #player1.gets_damage(5)
  #player1.show_state
  #player1.gets_damage(5)
  #player1.show_state
  player1 = Player.new("Josiane")
  player2 = Player.new("José")
  #player1.attacks(player2)
  #player2.show_state
  #player1.show_state
  while player1.life_points > 0 && player2.life_points > 0
    puts "Voici l'état de nos joueurs :"
    print "\t"
    player1.show_state
    print "\t"
    player2.show_state
    puts "\nPassons à la phase d'attaque :"
    print "\t"
    player1.attacks(player2)
    if player2.life_points <= 0
      break # player2 est mort (ses points de vie sont négatifs ou nuls) : il ne peut donc plus attaquer player1
      # il nous faut donc mettre immédiatement fin au combat (sortir immédiatement de la boucle)
    end
    print "\t"
    player2.attacks(player1)
    puts
  end
end

perform

binding.pry
