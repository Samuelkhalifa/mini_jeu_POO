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
    
    def initialize(name, life_points)
        @weapon_level = weapon_level
        super(name, life_points, weapon_level)
    end
end