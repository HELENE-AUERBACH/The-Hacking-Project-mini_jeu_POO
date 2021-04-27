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
end
