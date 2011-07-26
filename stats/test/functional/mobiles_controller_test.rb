require 'test_helper'

class MobilesControllerTest < ActionController::TestCase
  setup do
    @mobile = mobiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mobiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mobile" do
    assert_difference('Mobile.count') do
      post :create, :mobile => @mobile.attributes
    end

    assert_redirected_to mobile_path(assigns(:mobile))
  end

  test "should show mobile" do
    get :show, :id => @mobile.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mobile.to_param
    assert_response :success
  end

  test "should update mobile" do
    put :update, :id => @mobile.to_param, :mobile => @mobile.attributes
    assert_redirected_to mobile_path(assigns(:mobile))
  end

  test "should destroy mobile" do
    assert_difference('Mobile.count', -1) do
      delete :destroy, :id => @mobile.to_param
    end

    assert_redirected_to mobiles_path
  end
end
