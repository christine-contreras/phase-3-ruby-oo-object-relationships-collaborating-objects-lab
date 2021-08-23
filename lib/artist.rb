class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.filter {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        find_artist = self.all.find {|artist| artist.name == name}

        find_artist ? find_artist : self.new(name)
    end

    def print_songs
        songs_array = self.songs
        songs_array.map do |song|
            puts song.name
        end
    end

end