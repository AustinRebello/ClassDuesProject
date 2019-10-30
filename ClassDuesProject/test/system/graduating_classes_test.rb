require "application_system_test_case"

class GraduatingClassesTest < ApplicationSystemTestCase
  setup do
    @graduating_class = graduating_classes(:one)
  end

  test "visiting the index" do
    visit graduating_classes_url
    assert_selector "h1", text: "Graduating Classes"
  end

  test "creating a Graduating class" do
    visit graduating_classes_url
    click_on "New Graduating Class"

    fill_in "Classadvisorone", with: @graduating_class.classAdvisorOne
    fill_in "Classadvisortwo", with: @graduating_class.classAdvisorTwo
    fill_in "Gradyear", with: @graduating_class.gradYear
    click_on "Create Graduating class"

    assert_text "Graduating class was successfully created"
    click_on "Back"
  end

  test "updating a Graduating class" do
    visit graduating_classes_url
    click_on "Edit", match: :first

    fill_in "Classadvisorone", with: @graduating_class.classAdvisorOne
    fill_in "Classadvisortwo", with: @graduating_class.classAdvisorTwo
    fill_in "Gradyear", with: @graduating_class.gradYear
    click_on "Update Graduating class"

    assert_text "Graduating class was successfully updated"
    click_on "Back"
  end

  test "destroying a Graduating class" do
    visit graduating_classes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Graduating class was successfully destroyed"
  end
end
