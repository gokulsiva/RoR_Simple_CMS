require 'test_helper'

class ExampleControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get example_controller_home_url
    assert_response :success
  end

  test "should get hall" do
    get example_controller_hall_url
    assert_response :success
  end

end
