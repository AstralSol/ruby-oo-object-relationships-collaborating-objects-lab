class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save 
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename) # parses a filename to find th song name an artist name
        artist, song = filename.split(" - ")
        new_song = self.new(song)   # creates new song instance using th string we gathered from filename
        new_song.artist_name = artist  # associates new song wit artist, uses Artist attr_accessor to do so 
        new_song     # returns new song instance
    end

    def artist_name=(name)     # turns artist name as a string into an Artist object and 
        self.artist = Artist.find_or_create_by_name(name)   # assigns th song to artist
        artist.add_song(self)
    end
end
