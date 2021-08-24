require './type'

class Pokemon
    include Type

    attr_accessor :name, :atk
    attr_reader :type, :moves, :used_last_move
    
    def initialize name:,type:,hp:,atk:,moves:
        @name = name
        @type = type
        self.hp = hp
        @atk = atk #攻撃力
        self.moves = moves #技
    end
    
    def attack move_num, target
        move = moves[move_num]
        compatibility = move.compatibility_to(target.type)
        target.hp = target.hp - move.damage * compatibility[:ratio]
        @used_last_move = move
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
            @hp = hp.floor #小数点以下切り捨て
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

end

