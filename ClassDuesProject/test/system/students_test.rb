require "application_system_test_case"

class StudentsTest < ApplicationSystemTestCase
  setup do
    @student = students(:one)
  end

  test "visiting the index" do
    visit students_url
    assert_selector "h1", text: "Students"
  end

  test "creating a Student" do
    visit students_url
    click_on "New Student"

    fill_in "Balance", with: @student.balance
    fill_in "Firstname", with: @student.firstName
    fill_in "Gradyear", with: @student.gradYear
    fill_in "Graduation classes", with: @student.graduation_classes_id
    fill_in "Lastname", with: @student.lastName
    fill_in "Paidbalance", with: @student.paidBalance
    fill_in "Studentid", with: @student.studentID
    click_on "Create Student"

    assert_text "Student was successfully created"
    click_on "Back"
  end

  test "updating a Student" do
    visit students_url
    click_on "Edit", match: :first

    fill_in "Balance", with: @student.balance
    fill_in "Firstname", with: @student.firstName
    fill_in "Gradyear", with: @student.gradYear
    fill_in "Graduation classes", with: @student.graduation_classes_id
    fill_in "Lastname", with: @student.lastName
    fill_in "Paidbalance", with: @student.paidBalance
    fill_in "Studentid", with: @student.studentID
    click_on "Update Student"

    assert_text "Student was successfully updated"
    click_on "Back"
  end

  test "destroying a Student" do
    visit students_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Student was successfully destroyed"
  end
end
