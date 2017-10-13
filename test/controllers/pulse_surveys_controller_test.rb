require 'test_helper'

class PulseSurveysControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pulse_surveys_new_url
    assert_response :success
  end

  test "should get create" do
    get pulse_surveys_create_url
    assert_response :success
  end

end
