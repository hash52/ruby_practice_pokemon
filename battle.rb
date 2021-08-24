require './view'
require './music_player'

class Battle
    COMMON = 1
    GYM_LEADER = 2

    WINNING_FANFARE = "winning_fanfare.mp3"

    BATTLE_BGMS = {
        COMMON => "pokemon_battle.mp3",
        GYM_LEADER => "pokemon_gym_leader.mp3"
    }

    def initialize my_poke:,teki_poke:,genre:
        @my_poke = my_poke
        @teki_poke = teki_poke
        @genre = genre
        @bgm = BATTLE_BGMS[@genre]
    end

    def start
        MusicPlayer.play @bgm
        View.encount @teki_poke
    end

    def end
        if @my_poke.is_fainting?
            View.fainted @my_poke
        end
        if @teki_poke.is_fainting?
            View.fainted @teki_poke
            MusicPlayer.change WINNING_FANFARE
            sleep 15
        end
        MusicPlayer.stop
    end

    def is_end?
        @my_poke.is_fainting? || @teki_poke.is_fainting?
    end

    def my_turn
        View.battle_status my_poke: @my_poke, teki_poke: @teki_poke
        View.moves @my_poke
        input = STDIN.gets.chomp.to_i
        if (1..@my_poke.moves.length).cover? input
            move_num = input - 1
            compatibility = @my_poke.attack move_num, @teki_poke
            View.attack_result @my_poke, compatibility
        else
            View.input_again
            my_turn
        end
    end

    def teki_turn
        compatibility = @teki_poke.ramdom_attack @my_poke
        View.attack_result @teki_poke, compatibility
    end
end