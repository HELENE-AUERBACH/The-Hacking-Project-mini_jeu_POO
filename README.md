<!DOCTYPE html>
<html>
<head></head>
<body>
<h1>The Hacking Project - Semaine 4 (Semaine 1 - Fullstack web)</h1>
<h2>Jour 1 / 45 - Découverte de la POO - Plus loin dans la POO</h2>
<h3>Projet : Mini jeu - il veulent tous ta POO</h3>
<div>
<p>.../The_Hacking_Project/4-Semaine_Decouverte_de_la_POO/Jour_1/mini_jeu_POO$ ruby/app.rb<BR>
Warning: the running version of Bundler (2.1.4) is older than the version that created the lockfile (2.2.16). We suggest you to upgrade to the version that created the lockfile by running `gem install bundler:2.2.16`.<BR>
<BR>
From: /media/lnha/Data/The_Hacking_Project/4-Semaine_Decouverte_de_la_POO/Jour_1/mini_jeu_POO/app.rb:23 :<BR>
<BR>
    18:   player1.attacks(player2)<BR>
    19:   player2.show_state<BR>
    20:   player1.show_state<BR>
    21: end<BR>
    22: <BR>
 => 23: binding.pry<BR>
    24: <BR>
    25: perform<BR>
<BR>
[1] pry(main)> perform<BR>
José a 10 points de vie<BR>
José a 5 points de vie<BR>
le joueur José a été tué !<BR>
José a 0 points de vie<BR>
Josiane attaque José<BR>
il lui inflige 6 points de dommages<BR>
José a 4 points de vie<BR>
Josiane a 10 points de vie<BR>
=> nil<BR>
[2] pry(main)> player1 = Player.new("Josiane")<BR>
=> #&lt;Player:0x0000557a0a3faf28 @life_points=10, @name="Josiane"&gt;<BR>
[3] pry(main)> player2 = Player.new("José")<BR>
=> #&lt;Player:0x0000557a09d2f568 @life_points=10, @name="José"&gt;<BR>
[4] pry(main)> player1.attacks(player2)<BR>
Josiane attaque José<BR>
il lui inflige 2 points de dommages<BR>
=> nil<BR>
[5] pry(main)> player2.show_state<BR>
José a 8 points de vie<BR>
=> nil<BR>
[6] pry(main)> player1.show_state<BR>
Josiane a 10 points de vie<BR>
=> nil<BR>
[7] pry(main)> !!!<BR>
</p>
</div>
</body>
</html> 
