require_relative '../test_helper'

class UserSeesSkillsTest < FeatureTest
  include TestHelpers

  def test_user_can_see_a_skill
    skill_1 = {:title => "Green Bay Packers",
               :description => "Best team in the NFL"}
    skill_2 = {:title => "Chicago Bears",
               :description => "The Bears still suck"}

    skill_inventory.create(skill_1)
    skill_inventory.create(skill_2)
    skill_1 = skill_inventory.all.first
    visit '/'
    click_link("Skill Index")
    assert_equal "/skills", current_path
    assert page.has_content?("Green Bay Packers")
  end
end
