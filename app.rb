require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'

player1 = Player.new("Josiane")
player2 = Player.new("José")
while player1.life_points > 0 && player2.life_points > 0
  puts "Voici l'état de chaque joueurs :"
  puts player1.show_state
  puts player2.show_state
  puts " "
  puts "Passons à la phase d'attaque :"
  player1.attacks(player2)
  if player2.life_points <= 0 
    break
  end 
  player2.attacks(player1)
  puts "-----------------------------------------------------"
end 

if player1.life_points > 0
  puts "/0/0/0/ #{player1.name} a gagné, vive #{player1.name} /0/0/0/ "
else    
  puts "/0/0/0/ #{player2.name} a gagné, vive #{player2.name} /0/0/0/ "
end

