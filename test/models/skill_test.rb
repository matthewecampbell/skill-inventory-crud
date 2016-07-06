require_relative '../test_helper'

class SkillTest < Minitest::Test

  def test_assigns_attributes_correctly
    skill = Skill.new({"id" => 11, "title" => "Stiff Arm", "description" => "Stop defender from tackling you"})

    assert_equal 11, skill.id
    assert_equal "Stiff Arm", skill.title
    assert_equal "Stop defender from tackling you", skill.description
  end


end
