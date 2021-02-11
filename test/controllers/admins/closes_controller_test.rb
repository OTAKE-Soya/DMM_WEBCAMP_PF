require 'test_helper'

class Admins::ClosesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_closes_index_url
    assert_response :success
  end

end
