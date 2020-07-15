class Tweet

    

    def self.all
        sql = <<-SQL
            SELECT * FROM tweets;
        SQL
        data = DB[:conn].execute(sql)
        # binding.pry
        data.map {|t_data| self.new(self.xform_data(t_data))}
    end

    def self.xform_data(data)
        return data.each_with_object({}){|(k, v), memo|
            memo[k.to_sym] = v 
        }
    end

    def self.find_by_id(id)
        sql = <<-SQL
            SELECT * FROM tweets WHERE id = ?;
        SQL
        data = DB[:conn].execute(sql, id).first
        # binding.pry
        return self.new(self.xform_data(data))
    end

    attr_accessor :username, :message
    attr_reader :id  # <- encapsulation
    def initialize(username:, message:, id: nil)
        @username, @message, @id = username, message, id
    end

    def save
        sql = <<-SQL
            INSERT INTO tweets (username, message)
            VALUES (?, ?);
        SQL
        DB[:conn].execute(sql, self.username, self.message)
        @id = DB[:conn].last_insert_row_id
    end

end