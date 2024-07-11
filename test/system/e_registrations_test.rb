require "application_system_test_case"

class ERegistrationsTest < ApplicationSystemTestCase
  setup do
    @e_registration = e_registrations(:one)
  end

  test "visiting the index" do
    visit e_registrations_url
    assert_selector "h1", text: "E Registrations"
  end

  test "creating a E registration" do
    visit e_registrations_url
    click_on "New E Registration"

    click_on "Create E registration"

    assert_text "E registration was successfully created"
    click_on "Back"
  end

  test "updating a E registration" do
    visit e_registrations_url
    click_on "Edit", match: :first

    click_on "Update E registration"

    assert_text "E registration was successfully updated"
    click_on "Back"
  end

  test "destroying a E registration" do
    visit e_registrations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "E registration was successfully destroyed"
  end
end
