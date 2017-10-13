require 'test_helper'

class SignupsControllerTest < ActionDispatch::IntegrationTest
  test "should get step_one" do
    get signups_step_one_url
    assert_response :success
  end

  test "should get step_two" do
    get signups_step_two_url
    assert_response :success
  end

  test "should get step_three" do
    get signups_step_three_url
    assert_response :success
  end

  test "should get step_four" do
    get signups_step_four_url
    assert_response :success
  end

  test "should get step_five" do
    get signups_step_five_url
    assert_response :success
  end

  test "should get step_six" do
    get signups_step_six_url
    assert_response :success
  end

end
