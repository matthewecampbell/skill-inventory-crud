require 'sqlite3'

database = SQLite3::Database.new("db/skill_inventory_development.db")

database.execute("DELETE FROM skills;")

database.execute("INSERT INTO skills (title, description) VALUES ('Go to the gym', 'because'), ('Brush cat', 'To prevent hairballs'), ('Read watercooler', 'drama'), ('Do your homework', 'so you learn things');")

puts database.execute("SELECT * FROM skills;")
