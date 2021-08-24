module MusicPlayer
    COMMAND = "afplay"
    MUSIC_PATH = "assets/music"

    def play file
        system "#{COMMAND} assets/music/#{file} &>/dev/null &"
    end

    def change new_music_file
        stop
        play new_music_file
    end

    def stop
        system "pkill #{COMMAND}"
    end

    module_function :play, :change, :stop
end