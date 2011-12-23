require 'test_helper'

class PuntoServiciosControllerTest < ActionController::TestCase
  setup do
    @punto_servicio = punto_servicios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:punto_servicios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create punto_servicio" do
    assert_difference('PuntoServicio.count') do
      post :create, punto_servicio: @punto_servicio.attributes
    end

    assert_redirected_to punto_servicio_path(assigns(:punto_servicio))
  end

  test "should show punto_servicio" do
    get :show, id: @punto_servicio.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @punto_servicio.to_param
    assert_response :success
  end

  test "should update punto_servicio" do
    put :update, id: @punto_servicio.to_param, punto_servicio: @punto_servicio.attributes
    assert_redirected_to punto_servicio_path(assigns(:punto_servicio))
  end

  test "should destroy punto_servicio" do
    assert_difference('PuntoServicio.count', -1) do
      delete :destroy, id: @punto_servicio.to_param
    end

    assert_redirected_to punto_servicios_path
  end
end
