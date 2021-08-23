require './pokemon'
require './type'

t = Thread.new do
    # 事前に 'brew install mpg123' されていること前提
    system("mpg123 -q assets/pokemon_battle.mp3")
end


hitokage = Pokemon.new(name: "ヒトカゲ", type: Type::FIRE, hp: 100, atk: 30)
hitokage.display_status

zenigame = Pokemon.new(name: "ゼニガメ", type: Type::WATER, hp: 100, atk: 30)
zenigame.display_status

fushigidane = Pokemon.new(name: "フシギダネ", type: Type::GRASS, hp: 100, atk: 30)
fushigidane.display_status

pippi = Pokemon.new(name: "ピッピ", type: Type::NORMAL, hp: 100, atk: 30)
pippi.display_status

hitokage.attack zenigame
zenigame.display_status

zenigame.attack hitokage
hitokage.display_status

fushigidane.attack hitokage
hitokage.display_status

zenigame.attack hitokage
hitokage.display_status

pippi.attack fushigidane
fushigidane.display_status

loop do
    finish_letter = "c"
    puts "#{finish_letter}を入力で終了"
    input = gets.chomp
    puts input
    break if input == finish_letter
end
system "pkill mpg123"
t.join