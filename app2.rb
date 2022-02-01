require 'bundler'
Bundler.require

require_relative 'lib/game2'
require_relative 'lib/player2'



puts "-----------------------------------------------------"
puts "|      Bienvenue sur 'ILS VEULENT TOUS MA POO' !     |"
puts "|    Le but du jeu est de tous les niquer ces FDP   !|"
puts "-----------------------------------------------------"


array_ennemies =[]
humanplayer = HumanPlayer.new("Sarah Connor", 100, 1)
player1 = Player.new("T-800", 10)
array_ennemies << player1
player2 = Player.new("T-1000", 10)
array_ennemies << player2

puts
puts "Deux puissants Terminators venus du futur s'apprêtent à vous attaquer."
puts

while humanplayer.life_points > 0 && (player1.life_points > 0 || player1.life_points > 0)
    puts
    puts "Vous avez #{humanplayer.life_points} point(s) de vie"
    puts
    puts "Quelle action veux-tu effectuer ?"
    puts "      >>> a - chercher une meilleure arme"
    puts "      >>> s - chercher à se soigner "
    puts "      >>> c - combattre un Terminator en vue"
    print "> "
    fight_choice = gets.chomp
    if fight_choice == "a"
        humanplayer.search_weapon
    elsif fight_choice == "s"
        humanplayer.search_health_pack
    elsif fight_choice == "c"
        puts "Voici l'état des Terminators :"
        puts "T-800"
        player1.show_state
        puts "T-1000"
        player2.show_state
        puts "Lequel voulez-vous attaquer ?"
        puts "     >>> 0 - combattre le T-800"
        puts "     >>> 1 - combattre le T-1000"
        print "> "
        fight_choice2 = gets.chomp
        if fight_choice2 == "0"
            humanplayer.attacks(player1)
        elsif fight_choice2 == "1"
            humanplayer.attacks(player2)
        end
    end

    puts "Les ennemis attaquent !"
    array_ennemies.each do |counter|
        if counter.life_points > 0
            counter.attacks(humanplayer)
        else 
            
        end
    end
end

if player1.life_points <= 0 && player2.life_points <= 0 
    puts "CONGRAT'S BOY ! U FUCKIN' WON !"
elsif humanplayer.life_points <= 0
    puts "You're just a damn looser ..."
end



binding.pry