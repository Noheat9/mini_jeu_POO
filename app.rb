require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'



player1 = Player.new("Josiane")
player2 = Player.new("José")


puts "\nVoici l'état de chaque joueur\n"

player1.show_state 
player2.show_state


puts "\nPassons à la phase d'attaque\n"

while player1.life_points > 0 && player2.life_points > 0 #do
  player1.attacks(player2)
  player2.attacks(player1)
  
  puts "\nVoici l'état de chaque joueur\n"
  player1.show_state 
  player2.show_state

  
  if player1 <=> 0 
    puts "\nLe joueur #{player1.name} a été tué !\n"
  if player2 <=> 0
    puts "\nLe joueur #{player2.name} a été tué !\n"
    break
  end
end
end
  

binding.pry