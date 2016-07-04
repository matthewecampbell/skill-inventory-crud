require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test
  include TestHelpers
  attr_reader :skill, :id

  def setup
    skill_inventory.create(title: "Green Bay Packers", description: "NFL Football Team")
    @skill = skill_inventory.find(skill_inventory.all.first.id)
    @id = skill_inventory.all.first.id
  end

  def test_can_create_skill
    assert_equal "Green Bay Packers", skill.title
    assert_equal "NFL Football Team", skill.description
    assert_instance_of Skill, skill
  end

  def test_can_get_all_skills
    assert_instance_of Array, skill_inventory.all
    assert_equal 1, skill_inventory.all.count
    assert_equal "Green Bay Packers", skill.title
  end

  def test_it_can_find_by_id
    assert_instance_of Skill, skill_inventory.find(id)
  end

  def test_it_can_update
    skill_inventory.update(id, {:title => "Chicago Bears", :description => "Still suck"})
    assert_equal "Chicago Bears", skill_inventory.find(id).title
  end

  def test_it_can_destroy
    skill_inventory.destroy(id)
    assert_equal [], skill_inventory.all
  end
end
