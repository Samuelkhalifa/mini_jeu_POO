class Player
    attr_accessor :name
    attr_accessor :life_points

    def initialize(name, life_points)
        @name = name
        @life_points = life_points
    end

    def show_state
        puts "#{name} a #{life_points} point(s) de vie"
    end

    def gets_damage(damage)
        @life_points = @life_points - damage
        if @life_points <= 0
            puts "#{name} est mort"
        else
            puts "#{name} a #{life_points} point(s) de vie"
        end
    end

    def attacks(player)
        puts "#{@name} attaque #{player.name}"
        damage = compute_damage
        player.gets_damage(damage)
    end

    def compute_damage
        return rand(1..6)
    end

end

class HumanPlayer < Player
    attr_accessor :weapon_level
    
    def initialize(name, life_points, weapon_level)
        @weapon_level = 1
        super(name, life_points)
    end

    def show_state
        puts "#{name} a #{life_points} point(s) de vie et une arme de niveau #{weapon_level}"
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        searching_weapon = rand(1..6)
        if searching_weapon > @weapon_level
            @weapon_level = searching_weapon
            puts "Arme de niveau #{@weapon_level} trouvée"
        else
            puts "Pas de meilleure arme trouvée ..."
        end
    end

    def search_health_pack
        searching_health_pack = rand(1..6)
        if searching_health_pack == 1
            puts "Points de vie inchangés"
        elsif searching_health_pack >= 2 && searching_health_pack <= 5
            if @life_points <= 50
                @life_points = @life_points + 50
                if @life_points < 100
                    puts "Points de vie augmentés de 50"
                else 
                    puts "Points de vie restaurés"
                end
            else
                @life_points = 100
                puts "Points de vie restaurés"
            end
        elsif searching_health_pack > 6
            if @life_points <= 30
                @life_points = @life_points + 80
                if @life_points < 100
                    puts "Points de vie augmentés de 80"
                else 
                    puts "Points de vie restaurés"
                end
            else
                @life_points = 100
                puts "Points de vie restaurés"
            end
        end
    end


end