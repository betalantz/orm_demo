class Tweet

    @@all = []

    def self.all
        @@all
    end

    attr_accessor :username, :message

    def initialize(username:, message:)
        @username, @message = username, message
    end

    def save
        @@all << self
    end

end