require 'test_helper'

class ManageControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get manage_create_url
    assert_response :success
  end

end
