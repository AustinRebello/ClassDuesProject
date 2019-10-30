require 'test_helper'

class GraduatingClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @graduating_class = graduating_classes(:one)
  end

  test "should get index" do
    get graduating_classes_url
    assert_response :success
  end

  test "should get new" do
    get new_graduating_class_url
    assert_response :success
  end

  test "should create graduating_class" do
    assert_difference('GraduatingClass.count') do
      post graduating_classes_url, params: { graduating_class: { classAdvisorOne: @graduating_class.classAdvisorOne, classAdvisorTwo: @graduating_class.classAdvisorTwo, gradYear: @graduating_class.gradYear } }
    end

    assert_redirected_to graduating_class_url(GraduatingClass.last)
  end

  test "should show graduating_class" do
    get graduating_class_url(@graduating_class)
    assert_response :success
  end

  test "should get edit" do
    get edit_graduating_class_url(@graduating_class)
    assert_response :success
  end

  test "should update graduating_class" do
    patch graduating_class_url(@graduating_class), params: { graduating_class: { classAdvisorOne: @graduating_class.classAdvisorOne, classAdvisorTwo: @graduating_class.classAdvisorTwo, gradYear: @graduating_class.gradYear } }
    assert_redirected_to graduating_class_url(@graduating_class)
  end

  test "should destroy graduating_class" do
    assert_difference('GraduatingClass.count', -1) do
      delete graduating_class_url(@graduating_class)
    end

    assert_redirected_to graduating_classes_url
  end
end
