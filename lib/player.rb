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

  private # Toutes les méthodes définies ci-après sont privées : il est interdit de pouvoir les appeler en dehors du code de la classe (donc interdit même dans le "main" ici-même dans ce fichier)

  def check_name(name_to_save)
    # Vérification simple du format du nom saisi par l'utilisateur de la classe.
    # Si le nom est ok, ça renvoie TRUE, sinon ça renvoie FALSE.
    # On veut vérifier que le name_to_save n'est ni nil, ni une instance d'une autre classe que celle des String, ni une chaîne vide :
    !name_to_save.nil? && name_to_save.instance_of?(String) && !name_to_save.strip.empty?
  end
end
