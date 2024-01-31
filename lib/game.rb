require 'random_name_generator'
require_relative 'player'
class Game < HumanPlayer
    attr_accessor :human_player, :ennemies

    def text_to_ascii(text)
        a = Artii::Base.new                 # Call this def if you want to transform a str into ascii
        a.asciify(text)
    end

    def initialize(name,number_ennemies) 
        @ennemies = []
        rng = RandomNameGenerator.new
        @human_player = HumanPlayer.new(name)
        number_ennemies.times do |n|                # Initialization of the human player
            ennemi_name = rng.compose(2)            # and the bot. Call the initialize in player.rb
            @ennemies << Player.new(ennemi_name)
        end
    end

    def kill_player(dead_ennemi)
        if dead_ennemi.life_point <= 0
        @ennemies.delete(dead_ennemi)               # After a round, check if a bot is dead and delete him from the array
        else
            puts "Il reste #{dead_ennemi.life_point}pv à #{dead_ennemi.name}"
        end

    end

    def is_still_ongoing?
        if @human_player.life_point > 0 && @ennemies.length >= 1
            return false
        else                            #! Return true when the game is over. It means that if the human player is dead
            return true                 #! or if all the bot are dead ( the array of ennemis is empty )
        end
    end

    def show_player
        puts "                 /|
        _______________)|.. 
      <'______________<(,_|) 
                 .((()))| )) << YEAAYAAAAEAAAARGH!! >>
                 (======)| \ 
                ((( '_'()|_ \
               '()))(_)/_/ ' )
               .--/_\ /(  /./
              /'._.--\ .-(_/  
             / / )\___:___) 
            ( -.'.._  |  /
             \  \_\ ( | )
              '. /\)_(_)|
                '-|  XX |
                 %%%%%%%%
                / %%%%%%%\
               ( /.-'%%%. \ 
              /(.'   %%\ :|
             / ,|    %  ) )
           _|___)   %  (__|_
           )___/       )___(
            |x/      mrf\ >
            |x)         / '.
            |x\       _(____''.__
          --\ -\--
           --\__|-"
        print @human_player.show_state
        puts "Il reste #{@ennemies.length} ennemis à élimliner !"
        puts "______________________________"
    end

    def menu
        puts "Que veux tu faire ?"
        puts "\n[a] Chercher une meilleure arme."
        puts "[s] Chercher une potion.\n"
        puts "______________________________"
        puts "\nPour partir au combat :"
        @ennemies.each.with_index do |ennemi, i|
            print "[#{i}]" 
            puts "#{ennemi.show_state}"
        end
        puts "______________________________"
        puts "Fais un choix :"
        print ">"
        choice = gets.chomp
        system("clear")
        return choice
    end

    def menu_choice(choice)
        if choice == "a"
            human_player.search_weapon
            gets
        elsif choice == "s"
            human_player.search_health_pack
            gets
        elsif choice.to_i.between?(0, @ennemies.length - 1)
        index = choice.to_i
            ennemi = @ennemies[index]
            human_player.attacks(ennemi)
            kill_player(ennemi)
        end

    end

        def ennemies_attack
            @ennemies.each do |ennemi|
                ennemi.attacks(human_player)
                sleep(1)
            end
        end
            
        def end
            if human_player.life_point > 0
                puts text_to_ascii("VICTORY !")
            else
                puts text_to_ascii("You loose..")
            end
        end
end