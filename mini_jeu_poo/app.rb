require 'bundler'
Bundler.require


require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("gwendal")
player2 = Player.new("Gabriel")


while player1.life_points > 0 && player2.life_points >0 do
    puts "\n*****************\n"
    puts "\n*************\n"

    puts "Qui est encore debout!!"
    player1.show_state
    player2.show_state

    puts "\n*****************\n"
    puts "\n*************\n"

    puts "la bourse ou la vie:"

    player1.attacks(player2) # player 1 attaque
    if player2.life_points <= 0 # pas de mort-vivants
    break
    end
    player2.attacks(player1) # player 2 attaque

end 