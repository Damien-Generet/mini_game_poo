class Player
    attr_accessor :name, :life_point
    @@all_player = []
    
    def initialize(name)
        @name = name
        @life_point = 10
        @@all_player << self
    end

    def show_state
        if @life_point <= 0
            print "#{@name} est MORT"
        else
            print "#{@name} a #{@life_point}"
        end

    end

    def gets_damage(damage)
        @life_point = @life_point - damage
        if @life_point <=0
            puts "'AAaargh ! #{@name} à été tué au combat !'"
        end
    end

    def attacks(victim)
        damage = compute_damage
        puts "#{@name} attaque férocement #{victim.name}"

        if damage == 0 || damage <= 3
            puts "L'attaque de #{@name} n'est pas très efficace ! Il inflige #{damage}... !"
        elsif damage == 6
            puts "L'attaque de #{@name} inflige #{damage} ! C'est super efficace !"
        else
            puts "L'attaque de #{@name} inflige #{damage} !"
        end

        victim.gets_damage(damage)

    end


    def compute_damage
        return rand(1..6)
    end

end

 #*NEW TYPE OF PLAYER

 class HumanPLayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        super(name)
        @weapon_level = 1
        @life_point = 100
    end

    def show_state
        if @life_point < 0
            @life_point = 0
        end

        puts "#{@name} a #{@life_point} points de vie et une arme de niveau #{@weapon_level}"
        
        
    end

    def compute_damage
       return rand(1..6) * @weapon_level
    end


    def search_weapon
       new_weapon_level = rand(1..6)
       if new_weapon_level <= @weapon_level
        puts "Laisses ça la. Ca ne te servira à rien."
       else
            case new_weapon_level 
            when 2
                puts "C'est une arme rouillée, mais elle infligera des dégats de tétHanos !"
                @weapon_level = new_weapon_level
            when (3..5)
                puts "C'est une arme en mithril ! Quelle chance !"
                @weapon_level = new_weapon_level
            when 6
                puts "TU AS TROUVÉ L'ARME ULTIME DE FEU ET DE TENEBRE MOUHAAAAWAWAWHAHAHAAA ! DEEESTRUCTIOOOON"  
                @weapon_level = new_weapon_level                  
            end
        end
        
    end


    def search_health_pack
        luck = rand(1..6)

        case luck
        when 1
            puts "Il n'y a rien par ici..."
        when (2..5)
            puts "Tu as trouvé une petite potion ! Tu récupères 50 PV."
            if @life_point + 50 <= 100
                @life_point = @life_point + 50
            else
                @life_point = 100
            end
        when 6
            puts "Tu as trouvé une grande potion ! Tu récupères 80 PV"
            if @life_point + 80 <= 100
                @life_point = @life_point + 80
            else
                @life_point = 100
            end
        end
    end

    

 end
