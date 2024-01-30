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


# def menu(p1, p2, human)
#         puts "Voici l'état de #{human.name}"
#         human.show_state
#         puts "Que veux tu faire ?"
#         puts "[a] Chercher une meilleure arme."
#         puts "[s] Chercher une potion."
#         puts "Pour partir au combat :"
#         puts "[0] Attaquer #{p1.name}(#{p1.life_point}pv)"
#         puts "[1] Attaquer #{p2.name}(#{p2.life_point}pv)"
#         puts ""
#         puts "Fais un choix :"
#         print ">"
#         choice = gets.chomp
#     return choice
# end

def fight(p1, p2, human, ennemis)
    while p1.life_point > 0 && p2.life_point > 0 || human.life_point > 0

        puts "Voici l'état de #{human.name}"
        human.show_state
        puts "Que veux tu faire ?"
        puts "[a] Chercher une meilleure arme."
        puts "[s] Chercher une potion."
        puts "Pour partir au combat :"
        puts "[0] #{p1.show_state}"
        puts "[1] #{p2.show_state}"
        puts ""
        puts "Fais un choix :"
        print ">"
        choice = gets.chomp

        case choice
        when "a"
            human.search_weapon
        when "s"
            human.search_health_pack
       
        when "0"
            human.attacks(p1)
            sleep(1)
            end
      
        when "1"
            human.attacks(p2)
            sleep(1)

        end
        
        puts "Cest au tour des ennemis d'attaquer !"
        ennemis.each do |bot|
            if bot.life_point > 0
            bot.attacks(human)
            sleep(1)
            end
    end
end



def perform
    human = new_player 
    p1, p2, ennemis = bot
  fight(p1, p2, human, ennemis)
end

perform