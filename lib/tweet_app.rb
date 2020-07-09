class TweetApp

    def start
        loop do
            display_intro
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
                render_tweets
            else

            end

        end
    end

    def display_intro
        puts "Welcome to the Tweet App"
    end 

    def display_options
        puts "/nWhat do you want to do?"
        puts "-------------------------"
        puts "[n] Make new tweet"
        puts "[e] to exit"
    end

    def render_tweets
        Tweet.all.each.with_index {|t, i|
            puts "\n#{i}. #{t.username}\n #{t.message}"
        }
    end
end