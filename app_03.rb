require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
def text_to_ascii(text)
    a = Artii::Base.new
    a.asciify(text)
end
system("clear")
puts "------------------------------------------------
|   Bienvenue sur 'ILS VEULENT TOUS MA POO' !   |
| Le but du jeu est d'éliminer les politicard ! |
-------------------------------------------------"

def new_game
    
    print "      _,.
    ,` -.)
   ( _/-\\-._
  /,|`--._,-^|            ,
  \_| |`-._/||          ,'|
    |  `-, / |         /  /
    |     || |        /  /
     `r-._||/   __   /  /
 __,-<_     )`-/  `./  /
'  \   `---'   \   /  /
    |           |./  /
    /           //  /
\_/' \         |/  /
 |    |   _,^-'/  /
 |    , ``  (\/  /_
  \,.->._    \X-=/^
  (  /   `-._//^`
   `Y-.____(__}
    |     {__)
          ()"
    puts "Quel est votre nom ? Jeune guerrier(ère) !"
    name = gets.chomp
    puts "Combien d'ennemis voulez-vous combattre aujourd'hui ?"
    number_ennemies = gets.chomp.to_i
    my_game = Game.new("#{name}", number_ennemies)
    system("clear")
    return my_game
end

def show_stat(mygame)
    mygame.show_player
end

def menu(mygame)
    mygame.menu_choice(mygame.menu)
end

def perform
    mygame = new_game
    while mygame.is_still_ongoing? == false
    show_stat(mygame)
    menu(mygame)
    mygame.ennemies_attack
    end
    mygame.end
end

perform