require 'test_helper'

class GaleriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:galeries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create galery" do
    assert_difference('Galery.count') do
      post :create, :galery => { }
    end

    assert_redirected_to galery_path(assigns(:galery))
  end

  test "should show galery" do
    get :show, :id => galeries(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => galeries(:one).to_param
    assert_response :success
  end

  test "should update galery" do
    put :update, :id => galeries(:one).to_param, :galery => { }
    assert_redirected_to galery_path(assigns(:galery))
  end

  test "should destroy galery" do
    assert_difference('Galery.count', -1) do
      delete :destroy, :id => galeries(:one).to_param
    end

    assert_redirected_to galeries_path
  end
end
