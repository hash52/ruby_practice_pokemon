require './type'

class Pokemon
    include Type
    attr_accessor :name, :atk
    attr_reader :type
    
    def initialize name:,type:,hp:,atk:
        @name = name
        @type = type
        self.hp = hp
        @atk = atk #攻撃力
    end
    
    def attack teki
        p "attack!"
        compatibility = self.compatibility_to(teki.type)
        teki.hp = teki.hp - @atk * compatibility[:ratio]
        if compatibility[:message]
            p "#{compatibility[:message]}(#{@name}=>#{teki.name})"
        end
        if teki.hp <= 0
            p "#{teki.name} はたおれた"
        end
    end
    
    def display_status
        p "#{@name}(#{self.type}) HP:#{@hp}"
    end
    
    def hp= hp
        if hp > 0
            @hp = hp.floor #小数点以下切り捨て
        else
            @hp = 0
        end
    end
    
    def hp
        @hp
    end

end

