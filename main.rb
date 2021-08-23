require './pokemon'

pikachu = Pokemon.new("ピカチュウ",100,30)
pikachu.display_status

parukia = Pokemon.new("パルキア",500,200)
parukia.display_status

pikachu.attack parukia
parukia.display_status

parukia.attack pikachu
pikachu.display_status

pichu = Pokemon.new("pichu",500,200)