class MP3Importer
    attr_reader :path

    def initialize(file_path)
        @path = file_path
    end

    # Contains a #files method that parses the files in the path, returning an array that contains the file names. Make sure you only get .mp3 files.
    def files
        @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    end

    def import
        files.each{|file| Song.new_by_filename(file)}
    end
end