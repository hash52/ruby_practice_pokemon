require './pokemon'
require './type'
require './move'
require './view'
require './battle'


poke1 = Pokemon.new(
    name: "ヒトカゲ", 
    type: Type::FIRE, 
    hp: 70, 
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

battle = Battle.new(
    my_poke: poke1,
    teki_poke: poke2,
    genre: Battle::COMMON #選曲可能
)

begin
    battle.start
    loop do
        battle.display_status
        battle.my_turn
        break if battle.is_end?
        battle.teki_turn
        break if battle.is_end?
    end
    battle.end
ensure 
    system "pkill afplay"
end