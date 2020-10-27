class Artist
    @@all = []
    
    attr_accessor :name, :songs

    def initialize(name)
        @name = name 
        save
    end

    def self.all
        @@all
    end
    
    def add_song(song)    # tells a passed in Song instance that it belongs to said Artist, then...  
        song.artist = self  # should return ana array of all songs that belng to this Artist instance,
    end                     # gets all existing Song instances fron Song an select only th ones associated
                            # wit said Artist instance...songs method
    def songs
        Song.all.select {|song| song.artist == self}
    end
        
    def self.find_or_create_by_name(name)  # always returns an artist instance, finds or creates artist by name maintaining uniquenesss 
        self.find(name) ? self.find(name) : self.new(name)  #  of objects by name property
    end
    
    def self.find(name) 
        self.all.find {|artist| artist.name == name } 
    end
    
    def save
        @@all << self  # saves an returns all existing song instances 
    end

    def print_songs
        songs.each {|song| puts song.name}  # lists all of artists songs according to artist 
    end

end