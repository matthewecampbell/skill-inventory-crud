require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test
  include TestHelpers

  def test_can_create_skill
    assert_equal 0, skill_inventory.all.count

    skill = skill_inventory.create(title: "Green Bay Packers", description: "NFL Football Team")

    assert_equal 1, skill_inventory.all.count

    skill = skill_inventory.find(skill_inventory.all.count)

    assert_equal "Green Bay Packers", skill.title
    assert_equal "NFL Football Team", skill.description
    assert_instance_of Skill, skill
  end
end
