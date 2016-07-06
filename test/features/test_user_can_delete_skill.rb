require_relative '../test_helper'

class UserDeletesSkillTest < FeatureTest
  include TestHelpers

  def test_user_can_delete_a_skill
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
    within "##{skill_1.id}" do
    click_link_or_button("Delete")
    end
    assert_equal "/skills", current_path
    refute page.has_content?("Green Bay Packers")
  end
end
