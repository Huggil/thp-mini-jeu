require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

#mise en place de l"humain
puts "Quel est ton prénom ?"
print "> "
human_player_name = gets.chomp
user = human_player_name

#loading bots
player1 = Player.new("Gilbert")
player2 = Player.new("Gwendal")
enemies = [player1, player2]

#Baston
while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
user.show_state

    puts " "
    puts "fais un choix!"
    puts " "
    puts "a - s'armer"
    puts " "
    puts "s - se soigner"
    puts " "
    puts "rentrer en confrontation"
    i = 0
    enemies.each do |enemy|
    puts "#{i} - #{enemy.show_state}"
    i += 1
end
print "> "
input = gets.chomp

case input #case est un moyen de sauvegarder une valeur pour la reutiliser dans une méthode
    when 'a'
        user.search_weapon
    when 's'
        user.search_health_pack
    when '0'
        user.attacks(player1)
    when '1'
        user.attacks(player2)
else 
    "tu dois de nouveau faire un choix"
end

#Tour et fonctionnment des enemis
puts "Enemis en approche !"
    enemies.each do |enemy|
        if enemy.life_points > 0
            enemy.attacks(user)
    end
end
end

#Fin
puts "finito pipo"
if user.life_points > 0
    puts " ggs, cette fois t'as été le meilleur"
else
    puts "c'est perdu! retente!"
end