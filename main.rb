require './pokemon'
require './type'
require './move'

t = Thread.new do
    # 事前に 'brew install mpg123' されていること前提
    #system("mpg123 -q assets/pokemon_battle.mp3")
end


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
    puts input
    break if input == finish_letter
end
system "pkill mpg123"
t.join