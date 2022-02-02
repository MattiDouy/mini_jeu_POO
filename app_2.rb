require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'

puts "-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-"
puts "| Wanna play ?                        |"
puts "| Press any key except the On/Off one |"
puts "|                     And press Enter |"
puts "-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-"
gets.chomp
puts "Quel est ton nom de warrior ?"
print "> "
name = gets.chomp.to_s
user = HumanPlayer.new(name)
player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = [player1, player2]

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points >0)
  puts user.show_state
  puts " "
  puts "Quelle action veux-tu effectuer ?"
  puts " "
  puts " a - chercher une meilleur arme"
  puts " s - chercher à se soigner"
  puts " "
  puts "attaquer un joueur  en vue :"
  puts " 0 - " + player1.show_state.to_s
  puts " 1 - " + player2.show_state.to_s
  puts " "
  print "> "
  choice = gets.chomp

  if choice.to_s == "a"
    user.search_weapon
  elsif choice.to_s == "s" 
    user.search_health_pack
  elsif choice.to_i == 0
    user.attacks(player1)
  elsif choice.to_i == 1
    user.attacks(player2)
  end 


  puts " "
  puts "Au tour des ennemis !"
  print "press enter"
  gets.chomp 
  enemies.each do |villain|
    if villain.life_points > 0
      villain.attacks(user)
    end  
    if user.life_points <= 0
      break
    end
  end
  print "press enter"
  gets.chomp 
end
puts "------------------------"
puts "La partie est finie"
if user.life_points > 0
  puts "Bravo tu as gagné !!!"
else  
  puts "Gros looser va..."
end 

