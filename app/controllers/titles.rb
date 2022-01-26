class Titles
    attr_accessor :title

    @@all = []

    def inititalize
        @@all << self
    end

    def self.all
        @all
    end

    def self.reset_all
        @all.clear
    end
end