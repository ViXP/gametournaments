require 'test_helper'

class CaptainInfoControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get captain_info_show_url
    assert_response :success
  end

end
