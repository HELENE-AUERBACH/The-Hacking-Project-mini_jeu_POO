require "pry"

class Player
  # Classe qui modélise un Joueur
  attr_accessor :name # nom du Joueur (String)
  attr_accessor :life_points # niveau de vie du Joueur (Integer)

  def initialize(name_to_save)
    # Dans une méthode "initialize", on définit du code qui sera exécuté en même temps que la création d'une instance (donc, lors de l'appel à la méthode "new")
    if check_name(name_to_save) # On vérifie le nom proposé via une méthode check_name (cf. plus bas)
      @name = name_to_save # Si le nom passe le check => on le sauve dans l'instance
    else
      puts "ERREUR! Nom foireux. Remet à jour le nom de ton Joueur" # Si le nom saisi est "vide" => message d'erreur
    end
    @life_points = 10
    # Un Joueur vient d'être créé (avec ou sans nom) avec 10 points de vie : on l'affiche "en brut" (ce doit être le comportement par défaut de la méthode new?)
  end # fin de la définition de ma méthode "initialize"
  
  def show_state
    # Affiche l'état de l'objet Player sur laquelle elle est exécutée et renvoie nil
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(number_of_damage_suffered)
    # Fait baisser le niveau de vie du joueur sur lequel la méthode est appelée
    # du "number_of_damage_suffered" nombre (Integer) de dommages subits par ce même joueur,
    # puis affiche un message si ce joueur a été tué, et renvoie nil dans tous les cas
    @life_points -= number_of_damage_suffered
    if @life_points <= 0
      puts "le joueur #{@name} a été tué !"
    end
  end

  def attacks(another_player)
    # Simule le fait que le joueur sur lequel la méthode est appelée attaque un autre joueur "another_player"
    # en affichant combien de dommages ce joueur a fait subir à "another_player"
    # et renvoie nil
    puts "#{@name} attaque #{another_player.name}"
    number_of_damage_suffered = compute_damage # Calcul des dommages que le joueur va faire subir à "another_player"
    another_player.gets_damage(number_of_damage_suffered) # Le joueur fait baisser les points de vie de "another_player" de "number_of_damage_suffered" points
    puts "il lui inflige #{number_of_damage_suffered} points de dommages"
  end

  def still_alive?
    # Renvoie true si le Joueur sur lequel la méthode est appelée (qu'il soit humain ou qu'il soit un bot) est toujours en vie, false sinon
    return @life_points > 0
  end

  private # Toutes les méthodes définies ci-après sont privées : il est interdit de pouvoir les appeler en dehors du code de la classe (donc interdit même dans le "main" ici-même dans ce fichier)

  def check_name(name_to_save)
    # Vérification simple du format du nom saisi par l'utilisateur de la classe.
    # Si le nom est ok, ça renvoie TRUE, sinon ça renvoie FALSE.
    # On veut vérifier que le name_to_save n'est ni nil, ni une instance d'une autre classe que celle des String, ni une chaîne vide :
    !name_to_save.nil? && name_to_save.instance_of?(String) && !name_to_save.strip.empty?
  end

  def compute_damage
    # Renvoie un chiffre tiré aléatoirement et compris entre 1 et 6
    return rand(1..6)
  end
end # Fin du code de la classe Player

class HumanPlayer < Player # HumanPlayer est une classe fille de la classe Player : elle hérite des attributs et des méthodes de la classe Player
  # Classe qui modélise un Joueur humain (un Joueur qui n'est pas un Bot)
  attr_accessor :weapon_level # niveau (Integer) de l'arme du HumanPlayer

  def initialize(name_to_save)
    super(name_to_save) # On fait appel au constructeur (à la méthode initialize) de la classe mère Player
    @life_points = 100 # un Joueur humain dispose de 100 points de vie par défaut (au lieu de 10 pour un Bot)
    @weapon_level = 1
  end

  def show_state
    # Affiche l'état de l'objet HumanPlayer sur laquelle elle est exécutée et renvoie nil
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def search_weapon
    # Simule la recherche d'une nouvelle arme, plus puissante (et dans ce cas, cette arme est associée
    # au Joueur humain sur lequel la méthode est appelée), affiche un message et renvoie nil
    dice = rand(1..6) # Lancement d'un "dé" dont le résultat sera compris entre 1 et 6
    puts "Tu as trouvé une arme de niveau #{dice}"
    if dice > @weapon_level
      @weapon_level = dice
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#\$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    # Simule la recherche d'un pack de points de vie afin de faire remonter le niveau de vie du Joueur humain sur lequel la méthode est appelée,
    # mais pas au-delà de 100 points, et renvoie un message
    life_points_max = 100
    dice = rand(1..6) # Lancement d'un "dé" dont le résultat sera compris entre 1 et 6
    case dice
    when 1
      "Tu n'as rien trouvé..."
    when 2..5
      limit_increase_for_life_points(50, life_points_max)
    else
      limit_increase_for_life_points(80, life_points_max)
    end
  end

  private # Toutes les méthodes définies ci-après sont privées

  def compute_damage
    # Renvoie (par un return implicite) un chiffre tiré aléatoirement et compris entre [@weapon_level] et [6 x @weapon_level]
    rand(1..6) * @weapon_level
  end

  def limit_increase_for_life_points(value_for_increase, value_max)
    # Augmente le niveau de vie du Joueur humain sur lequel la méthode est appelée de "value_for_increase" points,
    # mais sans élever ce niveau de vie au-delà de la valeur "value_max", et renvoie un message
    @life_points = (@life_points + value_for_increase >= value_max ? value_max : @life_points + value_for_increase)
    if value_for_increase == 50
      "Bravo, tu as trouvé un pack de +50 points de vie !"
    else
      "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end
end # Fin du code de la classe Player
