module Type
    NORMAL = 0
    FIRE = 1
    GRASS = 2
    WATER = 3

    module Compatibility
        SUPER_EFFECTIVE = {ratio: 2, message: :こうかはばつぐんだ！ }
        NORMAL = {ratio: 1, message: nil }
        NOT_VERY_EFFECTIVE = {ratio: 0.5, message: :こうかはいまひとつのようだ }
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

    def compatibility_to diffender_type
        case self.type
        when NORMAL
            case diffender_type
            when NORMAL ; Compatibility::NORMAL
            when FIRE ; Compatibility::NORMAL
            when GRASS ; Compatibility::NORMAL
            when WATER ; Compatibility::NORMAL
            end
        when FIRE
            case diffender_type
            when NORMAL ; Compatibility::NORMAL
            when FIRE ; Compatibility::NOT_VERY_EFFECTIVE
            when GRASS ; Compatibility::SUPER_EFFECTIVE
            when WATER ; Compatibility::NOT_VERY_EFFECTIVE
            end
        when GRASS
            case diffender_type
            when NORMAL ; Compatibility::NORMAL
            when FIRE ; Compatibility::NOT_VERY_EFFECTIVE
            when GRASS ; Compatibility::NOT_VERY_EFFECTIVE
            when WATER ;Compatibility::SUPER_EFFECTIVE
            end
        when WATER
            case diffender_type
            when NORMAL ; Compatibility::NORMAL
            when FIRE ; Compatibility::SUPER_EFFECTIVE
            when GRASS ; Compatibility::NOT_VERY_EFFECTIVE
            when WATER ; Compatibility::NOT_VERY_EFFECTIVE
            end
        end
    end
end