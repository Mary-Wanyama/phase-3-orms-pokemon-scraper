require 'pry'
class Pokemon 

    attr_accessor :id, :name, :type, :db
    def initialize(name:, type:, db:, id:nil)
        @id = id 
        @name = name
        @type = type
        @db = db
    end
    def self.create_table
        sql =  <<-SQL
          CREATE TABLE IF NOT EXISTS pokemons (
            id INTEGER PRIMARY KEY,
            name TEXT,
            type TEXT
            )
            SQL
        DB[:conn].execute(sql)
      end
      def save
        sql = <<-SQL
          INSERT INTO pokemons (name, type)
          VALUES (?, ?)
        SQL
    
        DB[:conn].execute(sql, self.name, self.type)
    
        self.id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemons")[0][0]
    
        self
    
      end
      def self.create(name:, type:)
        pokemon = Pokemon.new(name: name, type: type)
        pokemon.save
      end
      def self.find
        sql = <<-SQL 
        
        SQL
      end
end

binding.pry
"pls"
