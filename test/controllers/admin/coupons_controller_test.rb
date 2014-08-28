require 'test_helper'

class Admin::CouponsControllerTest < ActionController::TestCase
  setup do
    @admin_coupon = admin_coupons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_coupons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_coupon" do
    assert_difference('Admin::Coupon.count') do
      post :create, admin_coupon: { apply_catalogues: @admin_coupon.apply_catalogues, apply_products: @admin_coupon.apply_products, code: @admin_coupon.code, discount: @admin_coupon.discount, end_date: @admin_coupon.end_date, is_free_ship: @admin_coupon.is_free_ship, is_login: @admin_coupon.is_login, max_times: @admin_coupon.max_times, max_times_cus: @admin_coupon.max_times_cus, name: @admin_coupon.name, start_date: @admin_coupon.start_date, status: @admin_coupon.status }
    end

    assert_redirected_to admin_coupon_path(assigns(:admin_coupon))
  end

  test "should show admin_coupon" do
    get :show, id: @admin_coupon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_coupon
    assert_response :success
  end

  test "should update admin_coupon" do
    patch :update, id: @admin_coupon, admin_coupon: { apply_catalogues: @admin_coupon.apply_catalogues, apply_products: @admin_coupon.apply_products, code: @admin_coupon.code, discount: @admin_coupon.discount, end_date: @admin_coupon.end_date, is_free_ship: @admin_coupon.is_free_ship, is_login: @admin_coupon.is_login, max_times: @admin_coupon.max_times, max_times_cus: @admin_coupon.max_times_cus, name: @admin_coupon.name, start_date: @admin_coupon.start_date, status: @admin_coupon.status }
    assert_redirected_to admin_coupon_path(assigns(:admin_coupon))
  end

  test "should destroy admin_coupon" do
    assert_difference('Admin::Coupon.count', -1) do
      delete :destroy, id: @admin_coupon
    end

    assert_redirected_to admin_coupons_path
  end
end
