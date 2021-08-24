require './type'

class Pokemon
    include Type

    attr_reader :name, :type, :lv, :atk, :def, :moves, :last_attack_move, :last_attack_damage
    
    def initialize name:,type:,hp:,atk:,df:,moves:
        @name = name
        @type = type
        @lv = 50
        self.hp = hp
        @atk = atk #攻撃力
        @def = df #防御力
        self.moves = moves #技
    end
    
    def attack move_num, target
        move = moves[move_num]
        compatibility = move.compatibility_to(target.type)
        damage = (calc_damage(move, target) * compatibility[:ratio]).floor
        target.hp -= damage
        @last_attack_move = move #直近に繰り出した技に影響される技　例、オウムがえし
        @last_attack_damage = damage #直近与えたダメージに影響される技　例、カウンター
        return compatibility
    end

    def ramdom_attack target
        attack rand(0..(moves.length-1)), target
    end

    #ひんし
    def is_fainting?
        hp == 0
    end
    
    def hp= hp
        if hp > 0
            @hp = hp.floor
        else
            @hp = 0
        end
    end

    def moves= moves
        max_moves_size = 4
        if moves.size > max_moves_size
            @moves = moves.first max_moves_size
        else
            @moves = moves
        end
    end
    
    def hp
        @hp
    end

    private
    def calc_damage move, target
        ((((@lv * 2 / 5 + 2).floor * 
        move.damage * @atk / target.def).floor / 50 + 2).floor * 
        rand(85..100)/100).floor
    end

end

