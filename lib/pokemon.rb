class Pokemon

	attr_accessor :name, :type, :db, :id 


	def initialize(name: , type: , db: , id:)
		@name = name
		@type = type
		@db = db
		@id = id
	end 

	def self.save(name, type, db) 
		sql = <<-SQL
		INSERT INTO pokemon (name, type)
			VALUES (?,?)
		SQL

		db.execute(sql, name, type)

		@id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
	end 

	def self.find(id_num, db) 
		pikachu = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num)[0]
		new_pokemon = Pokemon.new(name: pikachu[1], type: pikachu[2], db: db, id: pikachu[0])
		new_pokemon
	end 


end
