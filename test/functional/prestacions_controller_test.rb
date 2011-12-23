require 'test_helper'

class PrestacionsControllerTest < ActionController::TestCase
  setup do
    @prestacion = prestacions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prestacions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prestacion" do
    assert_difference('Prestacion.count') do
      post :create, prestacion: @prestacion.attributes
    end

    assert_redirected_to prestacion_path(assigns(:prestacion))
  end

  test "should show prestacion" do
    get :show, id: @prestacion.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prestacion.to_param
    assert_response :success
  end

  test "should update prestacion" do
    put :update, id: @prestacion.to_param, prestacion: @prestacion.attributes
    assert_redirected_to prestacion_path(assigns(:prestacion))
  end

  test "should destroy prestacion" do
    assert_difference('Prestacion.count', -1) do
      delete :destroy, id: @prestacion.to_param
    end

    assert_redirected_to prestacions_path
  end
end
