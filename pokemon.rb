class Pokemon
    @name
    @hp
    @atk #攻撃力
    
    attr_accessor :name, :atk
    
    def initialize name,hp,atk
        @name = name
        self.hp = hp
        @atk = atk
    end
    
    def attack teki
        teki.hp = teki.hp - @atk
        if teki.hp <= 0
            p "#{teki.name} はたおれた"
        end
    end
    
    def display_status
        p "#{@name} HP:#{@hp}"
    end
    
    def hp= hp
        if hp > 0
            @hp = hp
        else
            @hp = 0
        end
    end
    
    def hp
        @hp
    end

end

