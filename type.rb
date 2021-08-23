module Type
    NORMAL = 0
    FIRE = 1
    GRASS = 2
    WATER = 3

    module DamageRate
        SUPER_EFFECTIVE = 2
        NORMAL = 1
        NOT_VERY_EFFECTIVE = 0.5
    end

    NAMES = {
        NORMAL => :ノーマル,
        FIRE => :ほのお,
        GRASS => :くさ,
        WATER => :みず
    }

    def type_name
        NAMES[self.type]
    end

    def damage_multiplier_to diffender_type
        case self.type
        when NORMAL
            case diffender_type
            when NORMAL ; DamageRate::NORMAL
            when FIRE ; DamageRate::NORMAL
            when GRASS ; DamageRate::NORMAL
            when WATER ; DamageRate::NORMAL
            end
        when FIRE
            case diffender_type
            when NORMAL ; DamageRate::NORMAL
            when FIRE ; DamageRate::NOT_VERY_EFFECTIVE
            when GRASS ; DamageRate::SUPER_EFFECTIVE
            when WATER ; DamageRate::NOT_VERY_EFFECTIVE
            end
        when GRASS
            case diffender_type
            when NORMAL ; DamageRate::NORMAL
            when FIRE ; DamageRate::NOT_VERY_EFFECTIVE
            when GRASS ; DamageRate::NOT_VERY_EFFECTIVE
            when WATER ;DamageRate::SUPER_EFFECTIVE
            end
        when WATER
            case diffender_type
            when NORMAL ; DamageRate::NORMAL
            when FIRE ; DamageRate::SUPER_EFFECTIVE
            when GRASS ; DamageRate::NOT_VERY_EFFECTIVE
            when WATER ; DamageRate::NOT_VERY_EFFECTIVE
            end
        end
    end
end