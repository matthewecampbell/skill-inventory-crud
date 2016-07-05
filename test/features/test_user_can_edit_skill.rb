require_relative '../test_helper'

class UserEditsSkillTest < FeatureTest
  include TestHelpers

  def test_user_can_edit_a_skill
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
    click_link("Edit")
    end
    assert_equal "/skills/#{skill_1.id}/edit", current_path
    fill_in "skill[title]", with: "Detroit Lions"
    click_button("Edit Skill")
    assert_equal "/skills/#{skill_1.id}", current_path
    visit'/skills'
    assert page.has_content?("Detroit Lions")
  end
end
