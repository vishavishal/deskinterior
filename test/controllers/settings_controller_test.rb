require "test_helper"

class SettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get display" do
    get settings_display_url
    assert_response :success
  end

  test "should get update" do
    get settings_update_url
    assert_response :success
  end
end
