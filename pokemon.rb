require './type'

class Pokemon
    include Type

    attr_accessor :name, :atk
    attr_reader :type, :moves
    
    def initialize name:,type:,hp:,atk:,moves:
        @name = name
        @type = type
        self.hp = hp
        @atk = atk #攻撃力
        self.moves = moves #技
    end
    
    def attack move_num, teki
        move = moves[move_num]
        p "#{name}の #{move.name}"
        compatibility = move.compatibility_to(teki.type)
        teki.hp = teki.hp - move.damage * compatibility[:ratio]
        if compatibility[:message]
            p "#{compatibility[:message]}(#{move.name}=>#{teki.name})"
        end
        if teki.hp <= 0
            p "#{teki.name} はたおれた"
        end
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

