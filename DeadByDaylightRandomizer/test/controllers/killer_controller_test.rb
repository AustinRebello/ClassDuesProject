require 'test_helper'

class KillerControllerTest < ActionDispatch::IntegrationTest
  test "should get perks" do
    get killer_perks_url
    assert_response :success
  end

  test "should get randomizer" do
    get killer_randomizer_url
    assert_response :success
  end

end
