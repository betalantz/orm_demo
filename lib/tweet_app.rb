class TweetApp

    def start
        display_intro
        loop do
            display_options
            option = gets.strip
            case option
            when "e"
                break
            when "n"
                puts "Enter a username:"
                user = gets.strip
                puts "Enter your message:"
                message = gets.strip
                tweet = Tweet.new(username: user, message: message)
                tweet.save
                display_tweet(tweet)
            when "ls"
                render_tweets
            when "id"
                puts "Enter the id of the tweet you seek"
                id = gets.strip
                tweet = Tweet.find_by_id(id)
                display_tweet(tweet)
            else
                puts "Input not recognized"
            end

        end
    end

    def display_intro
        puts "Welcome to the Tweet App"
    end 

    def display_options
        puts "\nWhat do you want to do?"
        puts "-------------------------"
        puts "[n] Make new tweet"
        puts "[e] to exit"
        puts "[ls] to show a list of tweets"
        puts "[id] to find a tweet by id"
    end

    def display_tweet(t)
        puts "\n#{t.id}. #{t.username}\n #{t.message}"
    end

    def render_tweets
        Tweet.all.each {|t|
           display_tweet(t)
        }
    end
end