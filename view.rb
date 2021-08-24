module View
    def status poke
        puts "#{poke.name}(#{poke.type_name}) HP:#{poke.hp}"
    end

    def moves poke
        output_str = ""
        poke.moves.each_with_index do |move, i|
            output_str += "#{i+1}:#{move.name} "
        end
        puts output_str
    end

    def attack poke
        puts "#{poke.name}の #{poke.used_last_move.name}"
        br
    end

    def fainted poke
        puts "#{poke.name}はたおれた"
        br
    end

    def message obj
        puts obj[:message]
        br
    end

    def input_again
        p "無効な入力値: [わざの番号]を入力してください"
        br
    end

    def br
        sleep 1
        puts "\n"
    end

    module_function :status, :moves, :attack, :fainted, :message, :input_again, :br
end