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
From: /media/lnha/Data/The_Hacking_Project/4-Semaine_Decouverte_de_la_POO/Jour_1/mini_jeu_POO/app.rb:18 :<BR>
<BR>
    13:   player1.show_state<BR>
    14:   player1.gets_damage(5)<BR>
    15:   player1.show_state<BR>
    16: end<BR>
    17: <BR>
 => 18: binding.pry<BR>
    19: <BR>
    20: perform<BR>
<BR>
[1] pry(main)> perform<BR>
José a 10 points de vie<BR>
José a 5 points de vie<BR>
le joueur José a été tué !<BR>
José a 0 points de vie<BR>
=> nil<BR>
[2] pry(main)> player1 = Player.new("José")<BR>
=> #&lt;Player:0x00005571142ce928 @life_points=10, @name="José"&gt;<BR>
[3] pry(main)> player1.gets_damage(5)<BR>
=> nil<BR>
[4] pry(main)> player1.show_state<BR>
José a 5 points de vie<BR>
=> nil<BR>
[5] pry(main)> player1.gets_damage(5)<BR>
le joueur José a été tué !<BR>
=> nil<BR>
[6] pry(main)> player1.show_state<BR>
José a 0 points de vie<BR>
=> nil<BR>
[7] pry(main)> !!!<BR>
</p>
</div>
</body>
</html> 
