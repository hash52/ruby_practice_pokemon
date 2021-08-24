require './view'

class Battle
    COMMON = 1
    GYM_LEADER = 2

    def initialize my_poke:,teki_poke:,genre:
        @my_poke = my_poke
        @teki_poke = teki_poke
        @genre = genre
        case @genre
        when COMMON
            @bgm = "assets/pokemon_battle.mp3"
        when GYM_LEADER
            @bgm = "assets/pokemon_gym_leader.mp3"
        end
    end

    def start
        start_bgm
    end

    def end
        if(@my_poke.is_fainting?)
            View.fainted @my_poke
        end
        if(@teki_poke.is_fainting?)
            View.fainted @teki_poke
        end
        stop_bgm
    end

    def is_end?
        @my_poke.is_fainting? || @teki_poke.is_fainting?
    end

    def display_status
        View.status @my_poke
        View.status @teki_poke
    end

    def my_turn
        View.moves @my_poke
        input = gets.chomp.to_i
        if (1..@my_poke.moves.length).cover? input
            move_num = input - 1
            compatibility = @my_poke.attack move_num, @teki_poke
            View.attack @my_poke
            if compatibility[:message]
                View.message compatibility
            end
        else
            View.input_again
            my_turn
        end
    end

    def teki_turn
        compatibility = @teki_poke.ramdom_attack @my_poke
        View.attack @teki_poke
        if compatibility[:message]
            View.message compatibility
        end
    end

    private
    def start_bgm
        system "afplay #{@bgm} &>/dev/null &"
    end

    def stop_bgm
        system "pkill afplay"
    end
end