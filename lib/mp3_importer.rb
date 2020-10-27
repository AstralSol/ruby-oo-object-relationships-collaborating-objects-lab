class MP3Importer
    attr_reader :path

    def initialize(path)
        @path = path
    end

    def files
        @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/","") }
    end
                # parses a directory of files an sends th filenames to a song class to create a library 
                # of music wit artists that are unique.
    def import
        files.each{|f| Song.new_by_filename(f)}  # also sends filenames to Song class, handles creation of Song
    end                                          # instances an their associated Artist instances.
end