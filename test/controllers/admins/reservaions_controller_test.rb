require 'test_helper'

class Admins::ReservaionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_reservaions_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_reservaions_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_reservaions_edit_url
    assert_response :success
  end

end
