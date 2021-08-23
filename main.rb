require './pokemon'
require './type'

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
