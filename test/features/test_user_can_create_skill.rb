require_relative '../test_helper'

class SkillInventoryTest < FeatureTest
  include TestHelpers

  def test_can_create_skill
    visit '/'
    click_link 'New Skill'
    assert_equal '/skills/new', current_path
    fill_in 'skill[title]', with: 'new skill'
    fill_in 'skill[description]', with: 'new description'
    click_button 'Submit'
    assert_equal '/skills', current_path
    assert page.has_css?('#title')
    assert page.has_content?("All Skills")
  end

end
