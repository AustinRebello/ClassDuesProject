require 'test_helper'

class GradesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get grades_home_url
    assert_response :success
  end

end
