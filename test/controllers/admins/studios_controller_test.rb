require 'test_helper'

class Admins::StudiosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_studios_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_studios_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_studios_edit_url
    assert_response :success
  end

end
