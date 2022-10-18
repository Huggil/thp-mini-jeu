class Player
    attr_accessor :name, :life_points

    def initialize(name)
        @name = name
        @life_points = 10
    end

    def show_state#montre les points de vie
        if @life_points > 0
            puts "#{@name} a #{@life_points}"
        else
            puts"#{@name} est mort"
        end
    end
        

    def gets_damages(damagen) #combien de dégats tu fais
        @life_points -= damagen
        if @life_points <= 0
            puts "#{name} est passé dans l'autre monde"
        end
    end

    def compute_damage #içi on obtient la valeur du coup qui va être porté
        return rand(1..6)
    end

    def attacks(player) #on passe à l'attaque
        puts "#{name} s'en prends à #{player.name}" #le premier permet de choisir un joueur parmi ceux en vie et le second permet de sélectionner un jour pour recevoir le coup
        damages = compute_damage #içi on créer une valeur pour valeur pour pouvoir appeler la méthode compute_damages
        puts " #{player.name} reçoit #{damages}"
        player.gets_damages(damages)
        player.show_state
    end
    
        
end

class Human < Player #methode pour calculer la valuer des degats
    attr_accessor :weapon_level

    def initialize(name) 
        @lifepoints = 100
        @weapon_level = 1
        super(name) #reprend le fonctionnement de la première classe
    end

    def show_state #affiche le statut
        puts "#{name} a #{@life_points} pdv et une arme niveau #{weapon_level}"
    end

    def compute_damage #calcule les dégats multplié par le niveau de l'arme
        rand(1..6) * @weapon_level
    end

    def search_weapon
        sus_weapon =rand (1..6)  #le dé pour avoir le niveau de l'arme trouvé

        puts"tu as trouvé une arme niveau #{sus_weapon} :S"
        
        if sus_weapon > @weapon_level
            @weapon_level = sus_weapon
            puts"grosse épée à deux mains à la Berserk la classe!!"

        else 
            puts " oh l'arme éclatée, il te reste plus qu'a courir :'("
        end
    end

    def serch_health_pack
        medpack = rand (1..6)

        if medpack ==1
            puts" tu n'as rien trouvé.... Encore"
        elsif medpack <= 5 && medpack >=2
            @life_points += 50
            if @life_points > 100
                @life_points = 100
                puts " +50 pdv tu vas pouvoir souffler"
            end
        else
            @life_points += 80
            if @life_points > 100
                @life_points = 100
            end
            puts" 80 pdv en plus! voilà un second souflle!"
        end
    end
end




