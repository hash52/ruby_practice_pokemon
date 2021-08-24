require './pokemon'
require './type'
require './move'
require './battle'

# lv50のステータス計算 https://pokemottoo.com/beginner-poke-doryokuti/#i-2
# 個体値 https://game8.jp/pokemon-sword-shield/302215
poke1 = Pokemon.new(
    name: "ヒトカゲ", 
    type: Type::FIRE, 
    hp: 44 + 75 + rand(0..32), #種族値＋75＋努力値実数値（0~32）
    atk: 48 + 20 + rand(0..32), #{ 種族値＋2０＋努力値実数値（0~32）｝×性格補正（0.9~1.1倍）#性格補正は無視
    df: 64 + 20 + rand(0..32),
    moves: [Move.find(1), Move.find(2)]
)

poke2 = Pokemon.new(
    name: "ゼニガメ", 
    type: Type::WATER, 
    hp: 39 + 75 + rand(0..32), 
    atk: 52 + 20 + rand(0..32),
    df: 50 + 20 + rand(0..32),
    moves: [Move.find(1), Move.find(4)]
)

p poke1
p poke2

battle = Battle.new(
    my_poke: poke2,
    teki_poke: poke1,
    genre: Battle::COMMON #選曲可能
)

begin
    battle.start
    loop do
        battle.my_turn
        break if battle.is_end?
        battle.teki_turn
        break if battle.is_end?
    end
    battle.end
ensure 
    system "pkill afplay"
end