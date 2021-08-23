require './pokemon'
require './type'

t = Thread.new do
    # 事前に 'brew install mpg123' されていること前提
    system("mpg123 -q assets/pokemon_battle.mp3")
end


hitokage = Pokemon.new("ヒトカゲ",Type::FIRE,100,30)
hitokage.display_status

zenigame = Pokemon.new("ゼニガメ",Type::WATER,100,30)
zenigame.display_status

fushigidane = Pokemon.new("フシギダネ",Type::GRASS,100,30)
fushigidane.display_status

pippi = Pokemon.new("ピッピ",Type::NORMAL,100,30)
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