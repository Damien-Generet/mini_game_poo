require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def creation_player
    player1 = Player.new("Mélenchon")
    player2 = Player.new("Zemmour")
    system("clear")
    return player1, player2
end

def show_state(p1, p2)

    while p1.life_point > 0 && p2.life_point > 0
        puts "Voici l'état actuel de nos 2 combatants :"
        p1.show_state
        p2.show_state
        round1(p1, p2)
        if p2.life_point <= 0
            break
        else
            round1_2(p1, p2)
        end
        
        puts "appuie sur une touche pour passer au Round suivant !"
        gets.chomp
    end

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

def round1(p1, p2)
    p1.attacks(p2)
    sleep(1)
end
def round1_2(p1, p2)
    p2.attacks(p1)
end

def perform
    p1, p2 = creation_player
    start_fight
    show_state(p1, p2)
end

perform