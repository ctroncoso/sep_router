require 'test_helper'

class AsocPuntoServiciosControllerTest < ActionController::TestCase
  setup do
    @asoc_punto_servicio = asoc_punto_servicios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asoc_punto_servicios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asoc_punto_servicio" do
    assert_difference('AsocPuntoServicio.count') do
      post :create, asoc_punto_servicio: @asoc_punto_servicio.attributes
    end

    assert_redirected_to asoc_punto_servicio_path(assigns(:asoc_punto_servicio))
  end

  test "should show asoc_punto_servicio" do
    get :show, id: @asoc_punto_servicio.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asoc_punto_servicio.to_param
    assert_response :success
  end

  test "should update asoc_punto_servicio" do
    put :update, id: @asoc_punto_servicio.to_param, asoc_punto_servicio: @asoc_punto_servicio.attributes
    assert_redirected_to asoc_punto_servicio_path(assigns(:asoc_punto_servicio))
  end

  test "should destroy asoc_punto_servicio" do
    assert_difference('AsocPuntoServicio.count', -1) do
      delete :destroy, id: @asoc_punto_servicio.to_param
    end

    assert_redirected_to asoc_punto_servicios_path
  end
end
