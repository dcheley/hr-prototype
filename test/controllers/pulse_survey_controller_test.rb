require 'test_helper'

class PulseSurveyControllerTest < ActionDispatch::IntegrationTest
  test "should get new," do
    get pulse_survey_new,_url
    assert_response :success
  end

  test "should get create" do
    get pulse_survey_create_url
    assert_response :success
  end

end
