require './pokemon'
require './type'
require './move'
require './view'

include View

begin
    # https://stackoverflow.com/questions/42288146/running-afplay-in-mac-sh-well-running-rest-of-script
    system "afplay assets/pokemon_battle.mp3 &>/dev/null &"

    poke1 = Pokemon.new(
        name: "ヒトカゲ", 
        type: Type::FIRE, 
        hp: 300, 
        atk: 30,
        moves: [Move.find(1), Move.find(2)]
    )

    poke2 = Pokemon.new(
        name: "ゼニガメ", 
        type: Type::WATER, 
        hp: 100, 
        atk: 30,
        moves: [Move.find(1), Move.find(4)]
    )

    loop do
        finish_letter = "c"
        p "#{finish_letter}を入力で終了"
        View.status poke1
        View.status poke2
        View.moves poke1
        input = gets.chomp
        if input == finish_letter
            break
        end

        if input.to_i > 0 && input.to_i <= poke1.moves.length
            poke1.attack input.to_i - 1, poke2
            View.br
            sleep(1)
            if poke2.hp <= 0
                break
            end
            poke2.attack rand(0..(poke2.moves.length-1)),poke1
            if poke1.hp <= 0 
                break
            end
            sleep(1)
        elsif
            View.input_again
        end
        View.br        
    end

ensure 
    system "pkill afplay"
end


