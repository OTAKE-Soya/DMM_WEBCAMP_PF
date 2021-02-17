require 'test_helper'

class Admins::PaidEquipmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_paid_equipments_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_paid_equipments_show_url
    assert_response :success
  end

  test "should get new" do
    get admins_paid_equipments_new_url
    assert_response :success
  end

  test "should get edit" do
    get admins_paid_equipments_edit_url
    assert_response :success
  end

end
