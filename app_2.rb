require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------
|   Bienvenue sur 'ILS VEULENT TOUS MA POO' !   |
| Le but du jeu est d'éliminer les politicard ! |
-------------------------------------------------"

def new_player
    puts "Quel est votre nom ? Jeune guerrier(ère) !"
    name = gets.chomp
    name = HumanPLayer.new("#{name}")
    return name
end

def bot
    ennemis = []
    player1 = Player.new("De Croo")
    player2 = Player.new("De Wever")
    ennemis << player1
    ennemis << player2
    return player1, player2, ennemis
end

def show_state(p1, p2, human)

    puts "Voici l'état actuel de nos 2 combatants :"
    p1.show_state
    p2.show_state
    human.show_state

end

def start_fight
puts "3..."
sleep(1)
puts"2..."
sleep(1)
puts"1..."
sleep(1)
system("clear")
puts " ___  ___  ___  _  _  _____   _ 
| __||_ _|/ __|| || ||_   _| | |
| _|  | || (_ || __ |  | |   |_|
|_|  |___|\___| |_||_|  |_|   (_)"
end


def fight(p1, p2, human, ennemis)
    while p1.life_point > 0 && p2.life_point > 0 || human.life_point > 0

        puts "Voici l'état de #{human.name}"
        human.show_state
        puts "Que veux tu faire ?"
        puts "[a] Chercher une meilleure arme."
        puts "[s] Chercher une potion."
        puts "Pour partir au combat :"
        print "[0]"
        puts " #{p1.show_state}"
        print "[1]"
        puts" #{p2.show_state}"
        puts ""
        puts "Fais un choix :"
        print ">"
        choice = gets.chomp
        system("clear")
        case choice
        when "a"
            system("clear")
            human.search_weapon
            sleep(2)
        when "s"
            human.search_health_pack
       
        when "0"
            human.attacks(p1)
            sleep(1)
      
        when "1"
            human.attacks(p2)
            sleep(1)

        end
        if human.life_point <= 0
            puts "TU N'ES PAS DIGNE DE DIRIGER LE ROYAUME DE WALLONIE !"
            break
        elsif p2.life_point <= 0 && p1.life_point <= 0
            puts "BRAVO ! LE LEO BELGICUS EST A TOI !"
            break
        else
        puts " "
        puts "Cest au tour des ennemis d'attaquer !"
        puts " "
        ennemis.each do |bot|
            if bot.life_point > 0
            bot.attacks(human)
            puts ""
            sleep(1)
            end
        end
        puts "Appuies sur ENTER pour retourner au menu !"
        gets.chomp
    end
    end
end



def perform
    human = new_player 
    p1, p2, ennemis = bot
    start_fight
  fight(p1, p2, human, ennemis)
end

perform