require 'test_helper'

class EJoinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @e_join = e_joins(:one)
  end

  test "should get index" do
    get e_joins_url
    assert_response :success
  end

  test "should get new" do
    get new_e_join_url
    assert_response :success
  end

  test "should create e_join" do
    assert_difference('EJoin.count') do
      post e_joins_url, params: { e_join: {  } }
    end

    assert_redirected_to e_join_url(EJoin.last)
  end

  test "should show e_join" do
    get e_join_url(@e_join)
    assert_response :success
  end

  test "should get edit" do
    get edit_e_join_url(@e_join)
    assert_response :success
  end

  test "should update e_join" do
    patch e_join_url(@e_join), params: { e_join: {  } }
    assert_redirected_to e_join_url(@e_join)
  end

  test "should destroy e_join" do
    assert_difference('EJoin.count', -1) do
      delete e_join_url(@e_join)
    end

    assert_redirected_to e_joins_url
  end
end
