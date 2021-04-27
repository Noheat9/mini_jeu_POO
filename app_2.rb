require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def bienvenue
  puts "-----------------------------------------------|"
  puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !!!!  |"
  puts "|Le but du jeu est d'être le dernier survivant |"
  puts "-----------------------------------------------|"
end


puts "Bonjour, quel est ton nom"
title = gets.chomp
title = HumanPlayer.new(title)


player1 = Player.new("Josiane")
player2 = Player.new("José")
ennemies = [player1, player2]

while title.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
  title.show_state2
  puts "Quelle action veux-tu effectuer ?

  a - chercher une meilleure arme
  s - chercher à se soigner" 

  put = gets.chomp
  

  if put== "a"
    title.search_weapon
  end

  if put == "s"
    title.search_health_pack
  end

  puts "attaquer un joueur en vue :
  0 - Josiane a 10 points de vie
  1 - José a 10 points de vie"

  pu = gets.chomp.to_i

  if pu == "0"
    title.attacks(player1)
  end

  puts "#{player1.name} a #{@life_points} points de vie"

  if pu == "1"
    title.attacks(player2)
  end

  puts "#{player2.name} a #{@life_points} points de vie"

  puts "Les autres joueurs t'attaquent !"

  ennemies.each do |ennemie|
    if ennemie.life_points > 0
      ennemie.attacks(title)
    end
  end
end

puts "La partie est finie"

if title.life_points > 0
  puts "Bravo ! TU AS GAGNE !"
else
  puts "Loser ! Tu as perdu"
end


binding.pry