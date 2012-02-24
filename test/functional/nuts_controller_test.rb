require 'test_helper'

class NutsControllerTest < ActionController::TestCase
  setup do
    @nut = nuts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nuts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nut" do
    assert_difference('Nut.count') do
      post :create, nut: @nut.attributes
    end

    assert_redirected_to nut_path(assigns(:nut))
  end

  test "should show nut" do
    get :show, id: @nut.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nut.to_param
    assert_response :success
  end

  test "should update nut" do
    put :update, id: @nut.to_param, nut: @nut.attributes
    assert_redirected_to nut_path(assigns(:nut))
  end

  test "should destroy nut" do
    assert_difference('Nut.count', -1) do
      delete :destroy, id: @nut.to_param
    end

    assert_redirected_to nuts_path
  end
end
