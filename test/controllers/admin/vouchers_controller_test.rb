require 'test_helper'

class Admin::VouchersControllerTest < ActionController::TestCase
  setup do
    @admin_voucher = admin_vouchers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_vouchers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_voucher" do
    assert_difference('Admin::Voucher.count') do
      post :create, admin_voucher: { from_email: @admin_voucher.from_email, from_name: @admin_voucher.from_name, to_email: @admin_voucher.to_email, to_name: @admin_voucher.to_name, v_amount: @admin_voucher.v_amount, v_code: @admin_voucher.v_code, v_messsage: @admin_voucher.v_messsage, v_status: @admin_voucher.v_status }
    end

    assert_redirected_to admin_voucher_path(assigns(:admin_voucher))
  end

  test "should show admin_voucher" do
    get :show, id: @admin_voucher
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_voucher
    assert_response :success
  end

  test "should update admin_voucher" do
    patch :update, id: @admin_voucher, admin_voucher: { from_email: @admin_voucher.from_email, from_name: @admin_voucher.from_name, to_email: @admin_voucher.to_email, to_name: @admin_voucher.to_name, v_amount: @admin_voucher.v_amount, v_code: @admin_voucher.v_code, v_messsage: @admin_voucher.v_messsage, v_status: @admin_voucher.v_status }
    assert_redirected_to admin_voucher_path(assigns(:admin_voucher))
  end

  test "should destroy admin_voucher" do
    assert_difference('Admin::Voucher.count', -1) do
      delete :destroy, id: @admin_voucher
    end

    assert_redirected_to admin_vouchers_path
  end
end
