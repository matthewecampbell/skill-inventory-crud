class SkillInventory
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(skill)
    database.execute("INSERT INTO skills (title, description) VALUES (?, ?);", skill[:title], skill[:description])
  end

  def raw_skills
    database.execute("SELECT * FROM skills;")
  end

  def all
    raw_skills.map { |data| Skill.new(data) }
  end

  def raw_skill(id)
    database.execute("SELECT * FROM skills WHERE id = ?;", id).first
  end

  def find(id)
    Skill.new(raw_skill(id))
  end

  def update(id, skill)
    database.execute("UPDATE skills SET title= ?, description= ? WHERE id = ?;", skill[:title], skill[:description], id)
  end

  def destroy(id)
    database.execute("DELETE FROM skills WHERE id = ?;", id)
  end

  def delete_all
    database.execute("DELETE FROM skills;")
  end
end
