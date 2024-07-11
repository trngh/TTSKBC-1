require "application_system_test_case"

class EJoinsTest < ApplicationSystemTestCase
  setup do
    @e_join = e_joins(:one)
  end

  test "visiting the index" do
    visit e_joins_url
    assert_selector "h1", text: "E Joins"
  end

  test "creating a E join" do
    visit e_joins_url
    click_on "New E Join"

    click_on "Create E join"

    assert_text "E join was successfully created"
    click_on "Back"
  end

  test "updating a E join" do
    visit e_joins_url
    click_on "Edit", match: :first

    click_on "Update E join"

    assert_text "E join was successfully updated"
    click_on "Back"
  end

  test "destroying a E join" do
    visit e_joins_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "E join was successfully destroyed"
  end
end
