require 'bundler'
Bundler.require

require_relative 'lib/player'
#require_relative 'lib/game'

def welcome
  # Affiche un message de démarrage de jeu
  puts "-------------------------------------------------"
  puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
  puts "|Le but du jeu est d'être le dernier survivant !|"
  puts "-------------------------------------------------"
end

def get_human_player
  # Crée un Joueur humain portant le prénom de l'utilisateur
  print "Quel est ton prénom ?\n> "
  first_name = gets.chomp
  human = HumanPlayer.new(first_name)
  return human
end

# Be careful : "When you declare a method outside of any class, it's a private method, which means it can't be called on other objects"!!!
#def still_alive?
  # Renvoie true si le Joueur sur lequel la méthode est appelée (qu'il soit humain ou qu'il soit un bot) est toujours en vie, false sinon
#  return @life_points > 0
#end

def menu(enemies)
  # Propose un menu et renvoie nil
  puts "\nQuelle action veux-tu effectuer ?\n"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner\n"
  puts "attaquer un joueur en vue :"
  enemies.each_index { |bot_index|
    if enemies[bot_index].still_alive?
      print "#{bot_index} - "
      enemies[bot_index].show_state
    end
  }
end

def apply_choice(human, enemies)
  # Applique une action du menu en fonction de la saisie de l'utilisateur et renvoie nil
  print "> "
  choice = gets.chomp
  case choice
  when "a"
    human.search_weapon
  when "s"
    puts "#{human.search_health_pack}"
  else
    bot_index = choice.to_i
    human.attacks(enemies[bot_index]) if enemies[bot_index].still_alive?
  end
end

def perform
  welcome
  user = get_human_player # Initialisation du Joueur humain
  # Initialisation du groupe d'ennemis
  enemies = []
  bot1 = Player.new("Josiane")
  enemies << bot1
  bot2 = Player.new("José")
  enemies << bot2
  while user.still_alive? && (bot1.still_alive? || bot2.still_alive?)
    puts
    user.show_state
    menu(enemies)
    apply_choice(user, enemies)
    if !user.still_alive?
      break
    end
    puts "\nLes autres joueurs t'attaquent !" if enemies.any? { |bot| bot.still_alive? }
    enemies.each { |bot| bot.attacks(user) if bot.still_alive? }
  end
  puts "\nLa partie est finie"
  if user.still_alive?
    puts "BRAVO ! TU AS GAGNE !"
  else
    puts "Loser ! Tu as perdu !"
  end
end

perform

binding.pry
