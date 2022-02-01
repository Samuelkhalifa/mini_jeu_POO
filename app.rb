require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


player1 = Player.new("Sangoku", 10)
player2 = Player.new("Végéta", 10)

puts
puts "Bienvenue à tous ! Vous allez assister au combat du siècle"
puts
puts "A ma droite '#{player1.name}' ! A ma gauche '#{player2.name}' !"
puts 
puts "Voici leurs points de vie respectifs :"
puts
puts "#{player1.show_state}"
puts "#{player2.show_state}"
puts
puts "3..., 2..., 1..., LET THE FIGHT BEGIN !"
puts
puts
while player1.life_points > 0 && player2.life_points > 0
        puts "Sangoku attaque !"
        player1.attacks(player2)
        if player2.life_points <= 0
            puts "THE FIGHT IS OVER !"
            break
        end
        puts
        puts "Végéta réplique !"
        player2.attacks(player1)
        if player1.life_points <= 0
            puts "THE FIGHT IS OVER !"
            break
        end
        puts
end



binding.pry