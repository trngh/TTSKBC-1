require 'test_helper'

class ERegistrationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @e_registration = e_registrations(:one)
  end

  test "should get index" do
    get e_registrations_url
    assert_response :success
  end

  test "should get new" do
    get new_e_registration_url
    assert_response :success
  end

  test "should create e_registration" do
    assert_difference('ERegistration.count') do
      post e_registrations_url, params: { e_registration: {  } }
    end

    assert_redirected_to e_registration_url(ERegistration.last)
  end

  test "should show e_registration" do
    get e_registration_url(@e_registration)
    assert_response :success
  end

  test "should get edit" do
    get edit_e_registration_url(@e_registration)
    assert_response :success
  end

  test "should update e_registration" do
    patch e_registration_url(@e_registration), params: { e_registration: {  } }
    assert_redirected_to e_registration_url(@e_registration)
  end

  test "should destroy e_registration" do
    assert_difference('ERegistration.count', -1) do
      delete e_registration_url(@e_registration)
    end

    assert_redirected_to e_registrations_url
  end
end
