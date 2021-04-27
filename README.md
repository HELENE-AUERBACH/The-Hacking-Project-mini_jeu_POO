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
From: /media/lnha/Data/The_Hacking_Project/4-Semaine_Decouverte_de_la_POO/Jour_1/mini_jeu_POO/app.rb:14 :<BR>
<BR>
     9:   player1.name<BR>
    10:   player1.life_points<BR>
    11:   player1.show_state<BR>
    12: end<BR>
    13: <BR>
 => 14: binding.pry<BR>
    15: <BR>
    16: perform<BR>
<BR>
[1] pry(main)> player1.show_state<BR>
NameError: undefined local variable or method `player1' for main:Object<BR>
from (pry):1:in `<main>'<BR>
[2] pry(main)> perform<BR>
José a 10 points de vie<BR>
=> nil<BR>
[3] pry(main)> player1.show_state<BR>
NameError: undefined local variable or method `player1' for main:Object<BR>
from (pry):3:in `<main>'<BR>
[4] pry(main)> player1 = Player.new("José")<BR>
=> #<Player:0x00005561bc63e5e8 @life_points=10, @name="José"><BR>
[5] pry(main)> player1.show_state<BR>
José a 10 points de vie<BR>
=> nil<BR>
[6] pry(main)> !!!<BR>
</p>
</div>
</body>
</html> 
