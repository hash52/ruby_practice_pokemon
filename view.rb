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

    def input_again
        p "無効な入力値"
    end

    def br
        puts "\n"
    end
end