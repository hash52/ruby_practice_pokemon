require './pokemon'
require './type'
require './move'

begin
    # https://stackoverflow.com/questions/42288146/running-afplay-in-mac-sh-well-running-rest-of-script
    system "afplay assets/pokemon_battle.mp3 &>/dev/null &"

    hitokage = Pokemon.new(
        name: "ヒトカゲ", 
        type: Type::FIRE, 
        hp: 100, 
        atk: 30,
        moves: [Move.find(1), Move.find(2)]
    )
    hitokage.display_status

    zenigame = Pokemon.new(
        name: "ゼニガメ", 
        type: Type::WATER, 
        hp: 100, 
        atk: 30,
        moves: [Move.find(1), Move.find(4)]
    )
    zenigame.display_status

    hitokage.attack 1, zenigame

    zenigame.display_status


    loop do
        finish_letter = "c"
        puts "#{finish_letter}を入力で終了"
        input = gets.chomp
        break if input == finish_letter
    end

ensure 
    system "pkill afplay"
end


