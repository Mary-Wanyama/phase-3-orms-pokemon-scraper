require 'pry'
class Pokemon 

    attr_accessor :id, :name, :type, :db
    def initialize(name:, type:, db:, id:nil)
        @id = id 
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)

      sql = <<-SQL
      INSERT INTO Pokemon (name, type) VALUES (?, ?)
      SQL

      db.execute(sql, name, type)

  end

  def self.find(id, db)

      sql = <<-SQL
      SELECT * FROM Pokemon WHERE id = ?
      SQL

      poke = db.execute(sql, id).flatten
      self.new(id: poke[0], name: poke[1], type: poke[2], db: db)

  end

end
