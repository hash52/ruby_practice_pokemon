module View
    def encount poke
        sleep 3
        display "あ！ やせいの #{poke.name} が あらわれた"
    end

    def battle_status my_poke:,teki_poke:
        output_str = "\n"
        output_str += "自分：#{my_poke.name}(#{my_poke.type_name}) HP:#{my_poke.hp}\n"
        output_str += "相手：#{teki_poke.name}(#{teki_poke.type_name}) HP:#{teki_poke.hp}"
        display output_str
    end

    def moves poke
        output_str = "-----------------------\n"
        poke.moves.each_with_index do |move, i|
            output_str += "#{i+1}:#{move.name} "
            if i % 2 == 0 || move == poke.moves.last
                output_str += "\n"
            end
        end
        output_str += "-----------------------\n"
        output_str += "わざ ばんごう で こうげき！"
        display output_str
    end

    def attack_result poke, compatibility
        sleep 1
        output_str = "#{poke.name}の #{poke.used_last_move.name}\n"
        output_str += "#{compatibility[:message]}"
        display_line_by_line output_str
    end

    def fainted poke
        display "#{poke.name}はたおれた"
    end

    def input_again
        sleep 1
        display "無効な入力値: [わざの番号(半角)]を入力してください"
    end

    def display message
        puts message
        wait
    end

    def display_line_by_line message
        message.split(/\R/).each do |s|
            puts s
            sleep(0.5)
        end
        wait
    end

    def wait
        puts "\n"
        sleep(1)
    end

    module_function :encount, :battle_status, :moves, :attack_result, :fainted, :input_again, :display, :display_line_by_line, :wait
end