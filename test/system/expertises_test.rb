require "application_system_test_case"

class ExpertisesTest < ApplicationSystemTestCase
  setup do
    @expertise = expertises(:one)
  end

  test "visiting the index" do
    visit expertises_url
    assert_selector "h1", text: "Expertises"
  end

  test "should create expertise" do
    visit expertises_url
    click_on "New expertise"

    fill_in "Name", with: @expertise.name
    click_on "Create Expertise"

    assert_text "Expertise was successfully created"
    click_on "Back"
  end

  test "should update Expertise" do
    visit expertise_url(@expertise)
    click_on "Edit this expertise", match: :first

    fill_in "Name", with: @expertise.name
    click_on "Update Expertise"

    assert_text "Expertise was successfully updated"
    click_on "Back"
  end

  test "should destroy Expertise" do
    visit expertise_url(@expertise)
    click_on "Destroy this expertise", match: :first

    assert_text "Expertise was successfully destroyed"
  end
end
