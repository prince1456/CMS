require 'test_helper'

class Admin::VisitorsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_visitors_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_visitors_destroy_url
    assert_response :success
  end

  test "should get editshow" do
    get admin_visitors_editshow_url
    assert_response :success
  end

  test "should get index" do
    get admin_visitors_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_visitors_new_url
    assert_response :success
  end

end
