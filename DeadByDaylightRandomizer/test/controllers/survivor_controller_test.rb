require 'test_helper'

class SurvivorControllerTest < ActionDispatch::IntegrationTest
  test "should get perks" do
    get survivor_perks_url
    assert_response :success
  end

  test "should get randomizer" do
    get survivor_randomizer_url
    assert_response :success
  end

end
