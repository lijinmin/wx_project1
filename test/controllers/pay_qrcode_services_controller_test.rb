require 'test_helper'

class PayQrcodeServicesControllerTest < ActionController::TestCase
  setup do
    @pay_qrcode_service = pay_qrcode_services(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pay_qrcode_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pay_qrcode_service" do
    assert_difference('PayQrcodeService.count') do
      post :create, pay_qrcode_service: { website: @pay_qrcode_service.website }
    end

    assert_redirected_to pay_qrcode_service_path(assigns(:pay_qrcode_service))
  end

  test "should show pay_qrcode_service" do
    get :show, id: @pay_qrcode_service
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pay_qrcode_service
    assert_response :success
  end

  test "should update pay_qrcode_service" do
    patch :update, id: @pay_qrcode_service, pay_qrcode_service: { website: @pay_qrcode_service.website }
    assert_redirected_to pay_qrcode_service_path(assigns(:pay_qrcode_service))
  end

  test "should destroy pay_qrcode_service" do
    assert_difference('PayQrcodeService.count', -1) do
      delete :destroy, id: @pay_qrcode_service
    end

    assert_redirected_to pay_qrcode_services_path
  end
end
